import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:take_home_assignment/stores/dashboard/add_timer_store.dart';

class TimerPicker extends StatelessWidget {
  TimerPicker({required this.store});

  final AddTimerStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => CupertinoTimerPicker(
        mode: CupertinoTimerPickerMode.hms,
        initialTimerDuration: store.duration,
        onTimerDurationChanged: (duration) => store.setTime(
          duration.inHours,
          duration.inMinutes % 60,
          duration.inSeconds % 60,
        ),
      ),
    );
  }
}
