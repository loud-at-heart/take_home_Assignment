import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:take_home_assignment/models/album_model.dart';
import 'package:take_home_assignment/modules/home/repository/home_repository.dart';
import 'package:take_home_assignment/modules/home/services/db_helper.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc({
    required this.homeRepository,
    required this.dbHelper,
  }) : super(AlbumInitial()) {
    on<FetchAlbums>(_onFetchAlbums);
  }

  final HomeRepository homeRepository;
  final DatabaseHelper dbHelper;

  Future<void> _onFetchAlbums(
      FetchAlbums event, Emitter<AlbumState> emit) async {
    emit(AlbumLoading());
    try {
      List<Album> albums = await dbHelper.getAlbums();
      if (albums.isEmpty) {
        final _response = await homeRepository.getAlbumData();
        if (_response.isSuccessful()) {
          albums = (_response.data as AlbumList).data ?? [];
          for (var album in albums) {
            await dbHelper.insertAlbum(album);
          }
        } else {
          emit(AlbumError(_response.errorMessage ?? ''));
        }
      }
      emit(AlbumLoaded(AlbumList(data: albums)));
    } catch (e) {
      emit(AlbumError(e.toString()));
    }
  }
}
