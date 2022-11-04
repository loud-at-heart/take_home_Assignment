import 'package:json_annotation/json_annotation.dart';
import 'package:take_home_assignment/models/weather_data.dart';

part "forecast_data.g.dart";

@JsonSerializable(createToJson: false)
class ForecastData {
  ForecastData({required this.list});

  factory ForecastData.fromJson(
    Map<String, dynamic> json, {
    bool isForecastData = false,
  }) =>
      _$ForecastDataFromJson(
        json,
        isForecastData,
      );

  final List<WeatherData> list;
}
