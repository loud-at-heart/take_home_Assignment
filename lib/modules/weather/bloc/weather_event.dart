part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class FetchDataEvent extends WeatherEvent {}

class FetchLocationEvent extends WeatherEvent {}
