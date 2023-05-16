import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:take_home_assignment/data/local/datasources/db_manager.dart';
import 'package:take_home_assignment/di/module/local_module.dart';
import 'package:take_home_assignment/stores/dashboard/timer_list_store.dart';

final getIt = GetIt.instance;

class DI {
  initialize() {
    // async singletons:----------------------------------------------------------
    getIt.registerSingletonAsync<SharedPreferences>(
        () => LocalModule.provideSharedPreferences());

    getIt.registerSingleton<DBManager>(DBManager());
    // stores:--------------------------------------------------------------------
    getIt.registerSingleton(TimerListStore());
  }
}
