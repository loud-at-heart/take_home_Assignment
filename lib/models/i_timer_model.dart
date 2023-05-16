import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'i_timer_model.freezed.dart';

part 'i_timer_model.g.dart';

@freezed
class ITimerModel with _$ITimerModel {
  const factory ITimerModel({
    int? id,
    String? title,
    String? subtitle,
    int? second,
    @Default(false) bool finished,
  }) = _ITimerModel;

  factory ITimerModel.generate({
    String? title,
    String? subtitle,
    int? second,
    bool finished = false,
  }) {
    return ITimerModel(
      id: Random().nextInt(1000000),
      title: title,
      subtitle: subtitle,
      second: second,
      finished: finished,
    );
  }

  factory ITimerModel.parse({required Map<String, dynamic> data}) {
    return ITimerModel(
      id: data['id'] as int?,
      title: data['title'] as String?,
      subtitle: data['subtitle'] as String?,
      second: data['second'] as int?,
      finished: (data['finished'] as int) == 1 ? true : false,
    );
  }

  factory ITimerModel.fromJson(Map<String, dynamic> json) =>
      _$ITimerModelFromJson(json);
}
