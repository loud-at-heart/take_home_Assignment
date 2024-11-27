part of 'album_bloc.dart';

@immutable
abstract class AlbumState {}

class AlbumInitial extends AlbumState {}

class AlbumLoading extends AlbumState {}

class AlbumLoaded extends AlbumState {
  AlbumLoaded(this.albums);

  final AlbumList albums;
}

class AlbumError extends AlbumState {
  AlbumError(this.message);

  final String message;
}
