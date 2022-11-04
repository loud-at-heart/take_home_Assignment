// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(
        Map<String, dynamic> json, String name) =>
    WeatherData(
      date:
          json['dt'] == null ? null : (json['dt'] as num).toInt(),
      name: isNullOrEmpty(name)
          ? json['name'] as String
          : name,
      temp: (json['main']['temp'] as num).toDouble(),
      main: json['weather'][0]['main'] as String,
      icon: json['weather'][0]['icon'] as String,
      condition:
          Weather.fromJson(json['weather'][0] as Map<String, dynamic>).id,
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'date': instance.date,
      'name': instance.name,
      'temp': instance.temp,
      'main': instance.main,
      'icon': instance.icon,
      'condition': instance.condition,
    };

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      id: json['id'] as int?,
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
