import 'package:json_annotation/json_annotation.dart';

import '../utils/utils.dart';

part "weather_data.g.dart";

@JsonSerializable()
class WeatherData {
  WeatherData({
    this.date,
    required this.name,
    required this.temp,
    required this.main,
    required this.icon,
    this.condition,
  });

  factory WeatherData.fromJson(
    Map<String, dynamic> json, {
    String? name,
  }) =>
      _$WeatherDataFromJson(
        json,
        name ?? "",
      );
  final int? date;
  final String name;
  final double temp;
  final String main;
  final String icon;
  final int? condition;

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}

@JsonSerializable()
class Weather {
  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  int? id;
  String? main;
  String? description;
  String? icon;

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
