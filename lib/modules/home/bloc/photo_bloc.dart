import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:take_home_assignment/models/album_model.dart';
import 'package:take_home_assignment/modules/home/repository/home_repository.dart';
import 'package:take_home_assignment/modules/home/services/db_helper.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc({
    required this.homeRepository,
    required this.dbHelper,
  }) : super(PhotoInitial()) {
    on<FetchPhotosForAlbum>(_onFetchPhotosForAlbum);
  }

  final HomeRepository homeRepository;
  final DatabaseHelper dbHelper;
  final Map<int, PhotoList> _photoCache = {};

  Future<void> _onFetchPhotosForAlbum(
    FetchPhotosForAlbum event,
    Emitter<PhotoState> emit,
  ) async {
    if (_photoCache.containsKey(event.albumId)) {
      emit(PhotoLoaded(_photoCache[event.albumId]!));
      return;
    }
    emit(PhotoLoading());
    try {
      List<Photo> photos = await dbHelper.getPhotosByAlbumId(event.albumId);
      if (photos.isEmpty) {
        final _response =
            await homeRepository.getImageData(albumId: "${event.albumId}");
        if (_response.isSuccessful()) {
          photos = (_response.data as PhotoList).data ?? [];
          await _cachePhotosInDb(photos);
        } else {
          emit(PhotoError(_response.errorMessage ?? ''));
        }
      }
      _photoCache[event.albumId] = PhotoList(data: photos);
      emit(PhotoLoaded(PhotoList(data: photos)));
    } catch (e) {
      emit(PhotoError(e.toString()));
    }
  }

  Future<void> _cachePhotosInDb(List<Photo> photos) async {
    for (var photo in photos) {
      await dbHelper.insertPhoto(photo);
    }
  }
}
