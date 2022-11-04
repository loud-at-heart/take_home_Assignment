// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastData _$ForecastDataFromJson(
        Map<String, dynamic> json, bool isForecastData) =>
    ForecastData(
      list: (json['list'] as List<dynamic>)
          .map((e) => WeatherData.fromJson(
                e as Map<String, dynamic>,
                name: json['city']['name'] as String
              ))
          .toList(),
    );
