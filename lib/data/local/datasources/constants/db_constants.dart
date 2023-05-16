part of '../db_manager.dart';

class DBConstants {
  DBConstants._();

  // DB Name
  static const String dbName = 'my_database.db';
  static const int dbVersion = 1;
  static const String tableName = 'timer';

  // Fields
  static const field_id = 'id';
  static const field_title = 'title';
  static const field_subtitle = 'subtitle';
  static const field_second = 'second';
  static const field_finished = 'finished';
}
