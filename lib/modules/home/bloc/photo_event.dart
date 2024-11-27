part of 'photo_bloc.dart';

@immutable
abstract class PhotoEvent {}

class FetchPhotosForAlbum extends PhotoEvent {
  FetchPhotosForAlbum(this.albumId);
  final int albumId;
}