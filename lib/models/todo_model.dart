import 'package:json_annotation/json_annotation.dart';

part "todo_model.g.dart";


@JsonSerializable(createToJson: false,includeIfNull: false)
class TodoModelList {

  TodoModelList();

  factory TodoModelList.fromJson(Map<String, dynamic> json) =>
      _$TodoModelListFromJson(json);
  List<TodoModel>? todoModelList;
}


class TodoModel {

  TodoModel({this.id, this.title, this.subtitle});

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    title = json['title'] as String?;
    subtitle = json['subtitle'] as String?;
  }
  int? id;
  String? title;
  String? subtitle;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    return data;
  }
}