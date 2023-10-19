// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModelList _$TodoModelListFromJson(Map<String, dynamic> json) =>
    TodoModelList()
      ..todoModelList = (json['todoModelList'] as List<dynamic>?)
          ?.map((e) => TodoModel.fromJson(e as Map<String, dynamic>))
          .toList();
