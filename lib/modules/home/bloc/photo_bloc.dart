import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:take_home_assignment/models/album_model.dart';
import 'package:take_home_assignment/modules/home/repository/home_repository.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc({required this.homeRepository}) : super(PhotoInitial()) {
    on<FetchPhotosForAlbum>(_onFetchPhotosForAlbum);
  }

  final HomeRepository homeRepository;
  final Map<int, PhotoList> _photoCache = {};

  Future<void> _onFetchPhotosForAlbum(
    FetchPhotosForAlbum event,
    Emitter<PhotoState> emit,
  ) async {
    emit(PhotoLoading());
    try {
      final _response =
          await homeRepository.getImageData(albumId: "${event.albumId}");
      if (_response.isSuccessful()) {
        _photoCache[event.albumId] = _response.data as PhotoList;
        emit(PhotoLoaded(_response.data as PhotoList));
      } else {
        emit(PhotoError(_response.errorMessage ?? ''));
      }
    } catch (e) {
      emit(PhotoError(e.toString()));
    }
  }
}
