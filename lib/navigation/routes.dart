import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:take_home_assignment/modules/home/bloc/home_bloc.dart';
import 'package:take_home_assignment/modules/home/view/home.dart';
import 'package:take_home_assignment/modules/static/splash_screen.dart';

class Routes {
  Routes._();

  static const mainScreen = '/main_route';
  static const splashScreen = '/splash_screen';
  static const noInternet = '/no_internet';

  // get onGenerateRoute
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainScreen:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => HomeBloc(homeRepository: Injector().get())
              ..add(
                InitHomePageEvent(),
              ),
            child: HomePage(),
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
