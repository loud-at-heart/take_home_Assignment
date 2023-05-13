import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:take_home_assignment/di/module/local_module.dart';
import 'package:take_home_assignment/stores/dashboard/countdown_timer_store.dart';

final getIt = GetIt.instance;

class DI {
  initialize() {
    // async singletons:----------------------------------------------------------
    getIt.registerSingletonAsync<SharedPreferences>(() => LocalModule.provideSharedPreferences());
    // stores:--------------------------------------------------------------------
    getIt.registerSingleton(CountdownTimerStore());
  }
}
