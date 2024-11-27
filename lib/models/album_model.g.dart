// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumList _$AlbumListFromJson(Map<String, dynamic> json) => AlbumList(
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => Album.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      id: json['id'],
      title: json['title'],
    );

PhotoList _$PhotoListFromJson(Map<String, dynamic> json) => PhotoList(
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      id: json['id'],
      albumId: json['albumId'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
