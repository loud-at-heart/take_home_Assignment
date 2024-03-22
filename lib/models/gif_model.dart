import 'package:json_annotation/json_annotation.dart';

part "gif_model.g.dart";

@JsonSerializable(
  createToJson: false,
)
class GifModelList {
  GifModelList({this.data});

  factory GifModelList.fromJson(Map<String, dynamic> json) =>
      _$GifModelListFromJson(json);
  List<GifModel>? data;
}

@JsonSerializable(
  createToJson: false,
)
class GifModel {

  GifModel({this.id, this.url, this.user,});

  factory GifModel.fromJson(Map<String, dynamic> json) =>
      _$GifModelFromJson(json);
  String? id;
  String? url;
  User? user;
}

@JsonSerializable(
  createToJson: false,
)
class User {
  User({this.avatarUrl, this.displayName});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  String? avatarUrl;
  String? displayName;
}