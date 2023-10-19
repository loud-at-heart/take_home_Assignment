import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:take_home_assignment/components/no_internet_screen.dart';
import 'package:take_home_assignment/models/news_model.dart';
import 'package:take_home_assignment/modules/news/bloc/news_bloc.dart';
import 'package:take_home_assignment/modules/news/view/details_screen.dart';
import 'package:take_home_assignment/modules/news/view/news_screen.dart';
import 'package:take_home_assignment/modules/static/splash_screen.dart';
import 'package:take_home_assignment/modules/todo/bloc/todo_bloc.dart';
import 'package:take_home_assignment/modules/todo/view/todo_route.dart';

class Routes {
  Routes._();

  static const mainScreen = '/main_route';
  static const detailsScreen = '/details_route';
  static const splashScreen = '/splash_screen';
  static const noInternet = '/no_internet';

  // get onGenerateRoute
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainScreen:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider<TodoBloc>(
            create: (context) =>
            TodoBloc(
              todoRepository: Injector().get(),
            )
              ..add(GetTodoDataEvent()),
            child: const TodoScreen(),
          );
        });
      case detailsScreen:
        final NewsModel args = settings.arguments as NewsModel;
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
              create: (context) =>
                  NewsBloc(
                    newsRepository: Injector().get(),
                  )..add(GetCommentsEvent(model: args)),
            child: DetailsScreen(model: args),
          );
        });
      case noInternet:
        return MaterialPageRoute(builder: (context) {
          return NoInternet();
        });
      default:
        return MaterialPageRoute(builder: (context) {
          return const SplashPage();
        });
    }
  }

// get Routes
  static Map<String, Widget Function(BuildContext context)> get appRoutes =>
      {
        Routes.splashScreen: (BuildContext context) => const SplashPage(),
      };

  static Widget get splashPage => const SplashPage();
}
