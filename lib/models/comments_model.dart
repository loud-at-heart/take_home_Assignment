import 'package:json_annotation/json_annotation.dart';

part "comments_model.g.dart";


@JsonSerializable(createToJson: false,)
class CommentsModelList {

  CommentsModelList();

  factory CommentsModelList.fromJson(Map<String, dynamic> json) =>
      _$CommentsModelListFromJson(json);
  List<CommentsModel>? commentsModelList;
}

@JsonSerializable(
  createToJson: false,
)
class CommentsModel {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  CommentsModel();

  factory CommentsModel.fromJson(Map<String, dynamic> json) =>
      _$CommentsModelFromJson(json);
}
