// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModelList _$NewsModelListFromJson(Map<String, dynamic> json) =>
    NewsModelList()
      ..newsModelList = (json['newsModelList'] as List<dynamic>?)
          ?.map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
          .toList();

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel()
  ..userId = json['userId'] as int?
  ..id = json['id'] as int?
  ..title = json['title'] as String?
  ..body = json['body'] as String?;
