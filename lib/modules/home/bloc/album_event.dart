part of 'album_bloc.dart';

@immutable
abstract class AlbumEvent {}

class FetchAlbums extends AlbumEvent {}