// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'i_timer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ITimerModel _$$_ITimerModelFromJson(Map<String, dynamic> json) =>
    _$_ITimerModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      second: json['second'] as int?,
      finished: json['finished'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ITimerModelToJson(_$_ITimerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'second': instance.second,
      'finished': instance.finished,
    };
