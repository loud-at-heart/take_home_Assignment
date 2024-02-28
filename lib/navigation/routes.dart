import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_assignment/components/no_internet_screen.dart';
import 'package:take_home_assignment/modules/detail_screen/presentation/details_screen.dart';
import 'package:take_home_assignment/modules/payment_screen/bloc/payments_bloc.dart';
import 'package:take_home_assignment/modules/payment_screen/presentation/payments.dart';
import 'package:take_home_assignment/modules/payment_screen/presentation/progress_screen.dart';
import 'package:take_home_assignment/modules/static/splash_screen.dart';

class Routes {
  Routes._();

  static const mainScreen = '/main_route';
  static const paymentsScreen = '/payments_screen';
  static const progressScreen = '/progress_screen';
  static const splashScreen = '/splash_screen';
  static const noInternet = '/no_internet';

  // get onGenerateRoute
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainScreen:
        return MaterialPageRoute(builder: (context) {
          return DetailScreen();
        });
      case paymentsScreen:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider<PaymentsBloc>(
            create: (context) => PaymentsBloc(),
            child: PaymentsScreen(),
          );
        });
      case progressScreen:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider<PaymentsBloc>(
            create: (context) => PaymentsBloc()
              ..add(
                InitiateProgressScreenEvent(),
              ),
            child: ProgressScreen(),
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
