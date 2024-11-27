part of 'album_bloc.dart';

@immutable
abstract class AlbumEvent {}

class FetchAlbums extends AlbumEvent {}

class FetchPhotosForAlbum extends AlbumEvent {
  FetchPhotosForAlbum(this.albumId);
  final int albumId;
}