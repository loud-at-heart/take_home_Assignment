import 'package:mobx/mobx.dart';
import 'package:take_home_assignment/data/local/datasources/db_manager.dart';
import 'package:take_home_assignment/di/components/di_initializer.dart';
import 'package:take_home_assignment/models/i_timer_model.dart';

part 'timer_list_store.g.dart';

class TimerListStore = _TimerListStore with _$TimerListStore;

abstract class _TimerListStore with Store {
  DBManager? dbManager;

  @observable
  ObservableList<ITimerModel> timerList = ObservableList<ITimerModel>();

  @observable
  bool isLoading = false;

  @action
  Future<void> init() async {
    isLoading = true;
    dbManager = getIt.get<DBManager>();
    await dbManager?.initializeDatabase();
    await _loadList();
  }

  @action
  Future<void> _loadList() async {
    timerList =
        ObservableList<ITimerModel>.of((await dbManager?.loadTimers())!);
    timerList.sort(
      (a, b) {
        if (b.finished) {
          return 1;
        }
        return -1;
      },
    );
    isLoading = false;
  }

  @action
  void addTimer(ITimerModel newTimer) {
    dbManager?.insertTimer(timerModel: newTimer);
    timerList.add(newTimer);
  }

  @action
  void removeTimer(ITimerModel timer) {
    dbManager?.deleteTimer(timer);
    timerList.removeWhere((t) => t.id == timer.id);
    _loadList();
  }

  @action
  void finishedTimer(ITimerModel timer) {
    var updatedTimer = ITimerModel(
      id: timer.id,
      title: timer.title,
      subtitle: timer.subtitle,
      second: timer.second,
      finished: true,
    );
    dbManager?.updateTimer(updatedTimer);
    timerList[timerList.indexWhere((t) => t.id == timer.id)] = updatedTimer;
    _loadList();
  }
}
