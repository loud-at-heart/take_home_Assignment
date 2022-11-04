import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_assignment/resources/network/network_connectivity.dart';

import 'di/di_initializer.dart';
import 'navigation/routes.dart';
import 'observer/app_bloc_observer.dart';

void main() {
  defaultMain();
}

defaultMain() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () {
      DI().initialize();
      runApp(const MyApp());
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    AppConnectivity().monitorConnectivity(scaffoldKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop(animated: true);
        return true;
      },
      child: MaterialApp(
        home: Routes.splashPage,
        routes: Routes.appRoutes,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: const Color(0xFF6E00F8)),
        onGenerateRoute: (s) => Routes.onGenerateRoute(s),
      ),
    );
  }
}
