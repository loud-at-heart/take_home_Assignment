import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalModule {
  /// A singleton preference provider.
  ///
  /// Calling it multiple times will return the same instance.
  static Future<SharedPreferences> provideSharedPreferences() {
    return SharedPreferences.getInstance();
  }

  /// A singleton database provider.
  ///
  /// Calling it multiple times will return the same instance.
  // static Future<Database> provideDatabase() async {
  //
  //   // Get a platform-specific directory where persistent app data can be stored
  //   final appDocumentDir = await getApplicationDocumentsDirectory();
  //
  //   // Path with the form: /platform-specific-directory/demo.db
  //   final dbPath = join(appDocumentDir.path, DBConstants.DB_NAME);
  //
  //   // Check to see if encryption is set, then provide codec
  //   // else init normal db with path
  //   var database;
  //   database = await databaseFactoryIo.openDatabase(dbPath);
  //
  //   // Return database instance
  //   return database;
  // }
}
