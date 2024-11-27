import 'package:json_annotation/json_annotation.dart';

part "album_model.g.dart";

@JsonSerializable(
  createToJson: false,
)
class AlbumList {
  AlbumList({this.data});

  factory AlbumList.fromJson(Map<String, dynamic> json) =>
      _$AlbumListFromJson(json);
  List<Album>? data;
}

@JsonSerializable()
class Album {
  Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
  final int id;
  final String title;

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}

@JsonSerializable(
  createToJson: false,
)
class PhotoList {
  PhotoList({this.data});

  factory PhotoList.fromJson(Map<String, dynamic> json) =>
      _$PhotoListFromJson(json);
  List<Photo>? data;
}


@JsonSerializable()
class Photo {
  Photo({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) =>
      _$PhotoFromJson(json);
  final int id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
