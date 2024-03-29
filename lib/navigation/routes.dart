import 'package:flutter/material.dart';
import 'package:take_home_assignment/modules/dashboard/presentation/home.dart';
import 'package:take_home_assignment/modules/static/splash_screen.dart';

class Routes {
  Routes._();

  static const mainScreen = '/main_route';
  static const splashScreen = '/splash_screen';

  // get onGenerateRoute
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainScreen:
        return MaterialPageRoute(builder: (context) {
          return TimerHome();
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
