part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class NoInternetState extends WeatherState {}

class RequestFailedWithMessageState extends WeatherState {
  RequestFailedWithMessageState({required this.errorMessage});

  final String errorMessage;
}

class LoadingState extends WeatherState {}

class PermissionDeniedState extends WeatherState {}

class ServerResponse extends WeatherState {
  ServerResponse({
    this.forecastData,
    this.weatherData,
  });

  final ForecastData? forecastData;
  final WeatherData? weatherData;
}
