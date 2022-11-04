import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:take_home_assignment/modules/static/splash_screen.dart';
import 'package:take_home_assignment/modules/weather/bloc/weather_bloc.dart';
import 'package:take_home_assignment/modules/weather/data/weather_repository.dart';
import 'package:take_home_assignment/modules/weather/view/location_screen.dart';

import '../modules/weather/provider/db_provider.dart';

class Routes {
  Routes._();

  static const mainScreen = '/main_route';
  static const splashScreen = '/splash_screen';

  // get onGenerateRoute
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainScreen:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc(
              weatherRepository: Injector().get<WeatherRepository>(),
              dbProvider: Injector().get<DBProvider>(),
            )..add(FetchLocationEvent()),
            child: const LocationRoute(),
          );
        });
      default:
        return MaterialPageRoute(builder: (context) {
          return const SplashPage();
        });
    }
  }

// get Routes
  static Map<String, Widget Function(BuildContext context)> get appRoutes => {
        Routes.splashScreen: (BuildContext context) => const SplashPage(),
      };

  static Widget get splashPage => const SplashPage();
}
