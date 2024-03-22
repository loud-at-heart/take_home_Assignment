// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gif_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GifModelList _$GifModelListFromJson(Map<String, dynamic> json) => GifModelList()
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) => GifModel.fromJson(e as Map<String, dynamic>))
      .toList();

GifModel _$GifModelFromJson(Map<String, dynamic> json) => GifModel(
      id: json['id'] as String?,
      url: json['url'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

User _$UserFromJson(Map<String, dynamic> json) => User(
      avatarUrl: json['avatarUrl'] as String?,
      displayName: json['displayName'] as String?,
    );
