import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:take_home_assignment/generated/l10n.dart';
import 'package:take_home_assignment/stores/dashboard/countdown_timer_store.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';

import 'di/components/di_initializer.dart';
import 'navigation/routes.dart';

void main() {
  defaultMain();
}

defaultMain() {
  WidgetsFlutterBinding.ensureInitialized();
  DI().initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => getIt<CountdownTimerStore>(),
        ),
      ],
      child: Builder(builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            SystemNavigator.pop(animated: true);
            return true;
          },
          child: MaterialApp(
            localizationsDelegates: const [
              // ... app-specific localization delegate[s] here
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: Routes.splashPage,
            routes: Routes.appRoutes,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: AppColors.primary,
                fontFamily: AppFontFamilies.Roboto,
                appBarTheme: AppBarTheme(
                  color: AppColors.appbarColor,
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: AppColors.fabColor,
                )),
            onGenerateRoute: (s) => Routes.onGenerateRoute(s),
          ),
        );
      }),
    );
  }
}
