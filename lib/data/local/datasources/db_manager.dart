import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:take_home_assignment/models/i_timer_model.dart';

part 'constants/db_constants.dart';

class DBManager {
  Database? _database;

  Future<void> initializeDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, DBConstants.dbName);

    _database = await openDatabase(
      path,
      version: DBConstants.dbVersion,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE ${DBConstants.tableName} (${DBConstants.field_id} INTEGER PRIMARY KEY, ${DBConstants.field_title} TEXT, ${DBConstants.field_subtitle} TEXT, ${DBConstants.field_second} INTEGER,${DBConstants.field_finished} INTEGER)');
      },
    );
  }

  Future<void> insertTimer({required ITimerModel timerModel}) async {
    await _database?.insert(
      DBConstants.tableName,
      {
        DBConstants.field_id: timerModel.id,
        DBConstants.field_title: timerModel.title,
        DBConstants.field_subtitle: timerModel.subtitle,
        DBConstants.field_second: timerModel.second,
        DBConstants.field_finished: timerModel.finished ? 1 : 0,
      },
    );
  }

  Future<void> updateTimer(ITimerModel timerModel) async {
    await _database?.update(DBConstants.tableName, timerModel.toDbJson, where: '${DBConstants.field_id} = ?', whereArgs: [timerModel.id]);
  }

  Future<void> deleteTimer(ITimerModel timer) async {
    await _database?.delete(DBConstants.tableName, where: '${DBConstants.field_id} = ?', whereArgs: [timer.id]);
  }

  Future<Iterable<ITimerModel>?> loadTimers() async {
    final timersData = await _database?.query(DBConstants.tableName);
    debugPrint("$timersData");
    return timersData?.map((t) => ITimerModel.parse(data: t));
  }
}
