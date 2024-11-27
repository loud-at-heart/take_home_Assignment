import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:take_home_assignment/models/album_model.dart';
import 'package:take_home_assignment/modules/home/repository/home_repository.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc({required this.homeRepository}) : super(AlbumInitial()) {
    on<FetchAlbums>(_onFetchAlbums);
  }

  final HomeRepository homeRepository;

  Future<void> _onFetchAlbums(
      FetchAlbums event, Emitter<AlbumState> emit) async {
    emit(AlbumLoading());
    try {
      final _response = await homeRepository.getAlbumData();
      if (_response.isSuccessful()) {
        emit(AlbumLoaded((_response.data as AlbumList)));
      } else {
        emit(AlbumError(_response.errorMessage ?? ''));
      }
    } catch (e) {
      emit(AlbumError(e.toString()));
    }
  }
}
