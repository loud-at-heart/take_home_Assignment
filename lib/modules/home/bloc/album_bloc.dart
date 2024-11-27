import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:take_home_assignment/models/album_model.dart';
import 'package:take_home_assignment/modules/home/repository/home_repository.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc({required this.homeRepository}) : super(AlbumInitial()) {
    on<FetchAlbums>(_onFetchAlbums);
    on<FetchPhotosForAlbum>(_onFetchPhotosForAlbum);
  }

  final HomeRepository homeRepository;

  Future<void> _onFetchAlbums(FetchAlbums event, Emitter<AlbumState> emit) async {
    emit(AlbumLoading());
    try {
      List<Album> albums = [];

      final _response = await homeRepository.getAlbumData();
      if (_response.isSuccessful()) {
        albums = (_response.data as AlbumList).data ?? [];
        Map<int, List<Photo>> photos = {};
        emit(AlbumLoaded(albums, photos));

        // Fetch photos for each album
        for (var album in albums) {
          add(FetchPhotosForAlbum(album.id));
        }
      }
    } catch (e) {
      emit(AlbumError(e.toString()));
    }
  }

  Future<void> _onFetchPhotosForAlbum(
      FetchPhotosForAlbum event,
      Emitter<AlbumState> emit,
      ) async {
    if (state is AlbumLoaded) {
      final currentState = state as AlbumLoaded;
      try {
        List<Photo> photos = [];

        final _response = await homeRepository.getImageData(albumId: "${event.albumId}");
        if (_response.isSuccessful()) {
          photos = (_response.data as PhotoList).data ?? [];
          final updatedPhotos = Map<int, List<Photo>>.from(currentState.photos);
          updatedPhotos[event.albumId] = photos;

          emit(AlbumLoaded(currentState.albums, updatedPhotos));
        }
      } catch (e) {
        emit(AlbumError(e.toString()));
      }
    }
  }
}
