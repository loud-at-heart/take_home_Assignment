import 'package:mobx/mobx.dart';

part 'add_timer_store.g.dart';

class AddTimerStore = _AddTimerStore with _$AddTimerStore;

abstract class _AddTimerStore with Store {
  @observable
  int hours = 0;

  @observable
  int minutes = 0;

  @observable
  int seconds = 0;

  @observable
  bool showDurationError = false;

  @action
  void setTime(int hours, int minutes, int seconds) {
    this.hours = hours;
    this.minutes = minutes;
    this.seconds = seconds;
  }

  @action
  void setDurationError(bool res) {
    this.showDurationError = res;
  }

  @computed
  Duration get duration =>
      Duration(hours: hours, minutes: minutes, seconds: seconds);

  @computed
  int get t2s => timeToSeconds(duration);
}


int timeToSeconds(Duration time) {
  return time.inSeconds;
}