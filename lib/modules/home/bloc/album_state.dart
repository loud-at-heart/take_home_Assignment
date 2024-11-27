part of 'album_bloc.dart';

@immutable
abstract class AlbumState {}

class AlbumInitial extends AlbumState {}

class AlbumLoading extends AlbumState {}

class AlbumLoaded extends AlbumState {
  AlbumLoaded(this.albums, this.photos);

  final List<Album> albums;
  final Map<int, List<Photo>> photos;
}

class AlbumError extends AlbumState {
  AlbumError(this.message);

  final String message;
}
