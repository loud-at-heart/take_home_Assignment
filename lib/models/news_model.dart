import 'package:json_annotation/json_annotation.dart';
part "news_model.g.dart";


@JsonSerializable(createToJson: false,)
class NewsModelList {

  NewsModelList();

  factory NewsModelList.fromJson(Map<String, dynamic> json) =>
      _$NewsModelListFromJson(json);
  List<NewsModel>? newsModelList;
}

@JsonSerializable(createToJson: false,)
class NewsModel {

  NewsModel();

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
  int? userId;
  int? id;
  String? title;
  String? body;
}