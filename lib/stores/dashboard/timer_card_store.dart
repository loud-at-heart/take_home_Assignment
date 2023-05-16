import 'package:mobx/mobx.dart';
import 'package:take_home_assignment/data/local/datasources/db_manager.dart';
import 'package:take_home_assignment/models/i_timer_model.dart';

part 'timer_card_store.g.dart';

class TimerCardStore = _TimerCardStore with _$TimerCardStore;

abstract class _TimerCardStore with Store {
  DBManager? dbManager;

  @observable
  bool isFinished = false;

  @action
  Future<void> finishedTimer(ITimerModel timer) async {
    isFinished = true;
    var updatedTimer = ITimerModel(
      id: timer.id,
      title: timer.title,
      subtitle: timer.subtitle,
      second: timer.second,
      finished: isFinished,
    );
    await dbManager?.updateTimer(updatedTimer);
  }
}
