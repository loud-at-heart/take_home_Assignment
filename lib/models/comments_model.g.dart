// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentsModelList _$CommentsModelListFromJson(Map<String, dynamic> json) =>
    CommentsModelList()
      ..commentsModelList = (json['commentsModelList'] as List<dynamic>?)
          ?.map((e) => CommentsModel.fromJson(e as Map<String, dynamic>))
          .toList();

CommentsModel _$CommentsModelFromJson(Map<String, dynamic> json) =>
    CommentsModel()
      ..postId = json['postId'] as int?
      ..id = json['id'] as int?
      ..name = json['name'] as String?
      ..email = json['email'] as String?
      ..body = json['body'] as String?;
