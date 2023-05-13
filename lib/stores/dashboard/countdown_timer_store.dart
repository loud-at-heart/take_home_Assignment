import 'dart:async';
import 'package:mobx/mobx.dart';
part 'countdown_timer_store.g.dart';

class CountdownTimerStore = _CountdownTimerStoreBase with _$CountdownTimerStore;

abstract class _CountdownTimerStoreBase with Store {
  @observable
  int secondsRemaining = 100;

  @observable
  bool isRunning = false;

  Timer? _timer;

  @action
  void toggleTimer() {
    if (isRunning) {
      _timer?.cancel();
    } else {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        secondsRemaining--;
        if (secondsRemaining == 0) {
          _timer?.cancel();
        }
      });
    }
    isRunning = !isRunning;
  }

  @action
  void stopTimer() {
    _timer?.cancel();
    secondsRemaining = 100;
    isRunning = false;
  }

  @computed
  String get timerText {
    if (secondsRemaining == 0) {
      return '00:00:00';
    } else {
      int hours = secondsRemaining ~/ 3600;
      int minutes = (secondsRemaining % 3600) ~/ 60;
      int seconds = secondsRemaining % 60;
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
  }
}
