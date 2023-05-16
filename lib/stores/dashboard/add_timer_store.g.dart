// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_timer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddTimerStore on _AddTimerStore, Store {
  Computed<Duration>? _$durationComputed;

  @override
  Duration get duration =>
      (_$durationComputed ??= Computed<Duration>(() => super.duration,
              name: '_AddTimerStore.duration'))
          .value;
  Computed<int>? _$t2sComputed;

  @override
  int get t2s => (_$t2sComputed ??=
          Computed<int>(() => super.t2s, name: '_AddTimerStore.t2s'))
      .value;

  late final _$hoursAtom = Atom(name: '_AddTimerStore.hours', context: context);

  @override
  int get hours {
    _$hoursAtom.reportRead();
    return super.hours;
  }

  @override
  set hours(int value) {
    _$hoursAtom.reportWrite(value, super.hours, () {
      super.hours = value;
    });
  }

  late final _$minutesAtom =
      Atom(name: '_AddTimerStore.minutes', context: context);

  @override
  int get minutes {
    _$minutesAtom.reportRead();
    return super.minutes;
  }

  @override
  set minutes(int value) {
    _$minutesAtom.reportWrite(value, super.minutes, () {
      super.minutes = value;
    });
  }

  late final _$secondsAtom =
      Atom(name: '_AddTimerStore.seconds', context: context);

  @override
  int get seconds {
    _$secondsAtom.reportRead();
    return super.seconds;
  }

  @override
  set seconds(int value) {
    _$secondsAtom.reportWrite(value, super.seconds, () {
      super.seconds = value;
    });
  }

  late final _$showDurationErrorAtom =
      Atom(name: '_AddTimerStore.showDurationError', context: context);

  @override
  bool get showDurationError {
    _$showDurationErrorAtom.reportRead();
    return super.showDurationError;
  }

  @override
  set showDurationError(bool value) {
    _$showDurationErrorAtom.reportWrite(value, super.showDurationError, () {
      super.showDurationError = value;
    });
  }

  late final _$_AddTimerStoreActionController =
      ActionController(name: '_AddTimerStore', context: context);

  @override
  void setTime(int hours, int minutes, int seconds) {
    final _$actionInfo = _$_AddTimerStoreActionController.startAction(
        name: '_AddTimerStore.setTime');
    try {
      return super.setTime(hours, minutes, seconds);
    } finally {
      _$_AddTimerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDurationError(bool res) {
    final _$actionInfo = _$_AddTimerStoreActionController.startAction(
        name: '_AddTimerStore.setDurationError');
    try {
      return super.setDurationError(res);
    } finally {
      _$_AddTimerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hours: ${hours},
minutes: ${minutes},
seconds: ${seconds},
showDurationError: ${showDurationError},
duration: ${duration},
t2s: ${t2s}
    ''';
  }
}
