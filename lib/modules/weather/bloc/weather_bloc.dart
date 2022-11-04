import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';
import 'package:take_home_assignment/modules/weather/data/weather_repository.dart';
import 'package:take_home_assignment/utils/utils.dart';

import '../../../models/forecast_data.dart';
import '../../../models/weather_data.dart';
import '../../../webservice/data_load_result.dart';
import '../provider/db_provider.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({
    this.weatherRepository,
    this.dbProvider,
  }) : super(WeatherInitial()) {
    on<FetchDataEvent>(_handleFetchDataEvent);
    on<FetchLocationEvent>(_handleFetchLocationEvent);
  }

  final WeatherRepository? weatherRepository;
  final DBProvider? dbProvider;

  ForecastData? _forecastData;
  WeatherData? _weatherData;
  double? _lat;
  double? _long;
  final Location _location = Location();

  Future<void> _handleFetchDataEvent(
    FetchDataEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(LoadingState());
    if (!(await WeatherUtils.internetConnectivity())) {
      if (((await dbProvider?.getAllWeather()) ?? []).isEmpty) {
        // TODO : emit Empty State
      } else {
        List<WeatherData> res =
            await dbProvider?.getAllWeather() ?? <WeatherData>[];
        var weatherItem = res.removeAt(0);
        emit(
          ServerResponse(
            weatherData: weatherItem,
            forecastData: ForecastData(
              list: res,
            ),
          ),
        );
      }
    } else {
      var weatherResponse = await weatherRepository?.requestData(
        long: _long,
        lat: _lat,
      );
      var forecastResponse = await weatherRepository?.requestData(
        long: _long,
        lat: _lat,
        isForecast: true,
      );
      if (weatherResponse!.isSuccessful()) {
        _weatherData = weatherResponse.data as WeatherData?;
        dbProvider?.createWeather(_weatherData!);
        if (forecastResponse!.isSuccessful()) {
          var forecastRawRes = forecastResponse.data as ForecastData?;
          var refinedData =
              WeatherUtils.getAverageWeatherData(forecastRawRes?.list ?? []);
          List<WeatherData> temp =[];
          for (var element in refinedData) {
            dbProvider?.createWeather(
              element,
              isForecastUpload: true,
            );
            temp.add(element);
          }
          _forecastData = ForecastData(list: temp);
          emit(
            ServerResponse(
              weatherData: _weatherData,
              forecastData: _forecastData,
            ),
          );
        } else {
          _handleErrorState(forecastResponse, emit);
        }
      } else {
        _handleErrorState(weatherResponse, emit);
      }
    }
  }

  Stream<WeatherState> _handleErrorState(
    DataLoadResult result,
    Emitter<WeatherState> emit,
  ) async* {
    if (result.error == LoadingError.NO_CONNECTION) {
      emit(NoInternetState());
    } else {
      emit(RequestFailedWithMessageState(errorMessage: result.errorMessage!));
    }
  }

  Future<void> _handleFetchLocationEvent(
    FetchLocationEvent event,
    Emitter<WeatherState> emit,
  ) async {
    LocationData location;
    location = await _location.getLocation();
    if (await _location.hasPermission() == PermissionStatus.granted) {
      _lat = location.latitude;
      _long = location.longitude;
      add(FetchDataEvent());
    } else {
      emit(PermissionDeniedState());
    }
  }
}
