import 'package:freezed_annotation/freezed_annotation.dart';

part 'i_timer_model.freezed.dart';
part 'i_timer_model.g.dart';

@freezed
class ITimerModel with _$ITimerModel {
  const factory ITimerModel({
    String? title,
    String? subtitle,
    int? second,
  }) = _ITimerModel;

  factory ITimerModel.fromJson(Map<String, dynamic> json) =>
      _$ITimerModelFromJson(json);
}
