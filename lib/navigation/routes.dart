import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:take_home_assignment/modules/static/splash_screen.dart';
import 'package:take_home_assignment/modules/swiggyOtpLogin/bloc/swiggy_login_bloc.dart';
import 'package:take_home_assignment/modules/swiggyOtpLogin/data/swiggy_login_repository.dart';
import 'package:take_home_assignment/modules/swiggyOtpLogin/view/swiggy_login.dart';

class Routes {
  Routes._();

  static const mainScreen = '/main_route';
  static const splashScreen = '/splash_screen';

  // get onGenerateRoute
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainScreen:
        // return MaterialPageRoute(builder: (context) {
        //   return BlocProvider<WeatherBloc>(
        //     create: (context) => WeatherBloc(
        //       weatherRepository: Injector().get<WeatherRepository>(),
        //       dbProvider: Injector().get<DBProvider>(),
        //     )..add(FetchLocationEvent()),
        //     child: const LocationRoute(),
        //   );
        // });
        return MaterialPageRoute(builder: (context) {
          return BlocProvider<SwiggyLoginBloc>(
            create: (context) => SwiggyLoginBloc(
              swiggyLoginRepository: Injector().get<SwiggyLoginRepository>(),
            ),
            child: const SwiggyLoginView(),
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
