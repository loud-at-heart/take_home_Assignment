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

  @action
  void setTime(int hours, int minutes, int seconds) {
    this.hours = hours;
    this.minutes = minutes;
    this.seconds = seconds;
  }

  @computed
  Duration get duration =>
      Duration(hours: hours, minutes: minutes, seconds: seconds);
}
