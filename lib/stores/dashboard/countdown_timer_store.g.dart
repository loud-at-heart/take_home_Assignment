// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countdown_timer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CountdownTimerStore on _CountdownTimerStoreBase, Store {
  Computed<String>? _$timerTextComputed;

  @override
  String get timerText =>
      (_$timerTextComputed ??= Computed<String>(() => super.timerText,
              name: '_CountdownTimerStoreBase.timerText'))
          .value;

  late final _$secondsRemainingAtom =
      Atom(name: '_CountdownTimerStoreBase.secondsRemaining', context: context);

  @override
  int get secondsRemaining {
    _$secondsRemainingAtom.reportRead();
    return super.secondsRemaining;
  }

  @override
  set secondsRemaining(int value) {
    _$secondsRemainingAtom.reportWrite(value, super.secondsRemaining, () {
      super.secondsRemaining = value;
    });
  }

  late final _$isRunningAtom =
      Atom(name: '_CountdownTimerStoreBase.isRunning', context: context);

  @override
  bool get isRunning {
    _$isRunningAtom.reportRead();
    return super.isRunning;
  }

  @override
  set isRunning(bool value) {
    _$isRunningAtom.reportWrite(value, super.isRunning, () {
      super.isRunning = value;
    });
  }

  late final _$_CountdownTimerStoreBaseActionController =
      ActionController(name: '_CountdownTimerStoreBase', context: context);

  @override
  void toggleTimer() {
    final _$actionInfo = _$_CountdownTimerStoreBaseActionController.startAction(
        name: '_CountdownTimerStoreBase.toggleTimer');
    try {
      return super.toggleTimer();
    } finally {
      _$_CountdownTimerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopTimer() {
    final _$actionInfo = _$_CountdownTimerStoreBaseActionController.startAction(
        name: '_CountdownTimerStoreBase.stopTimer');
    try {
      return super.stopTimer();
    } finally {
      _$_CountdownTimerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
secondsRemaining: ${secondsRemaining},
isRunning: ${isRunning},
timerText: ${timerText}
    ''';
  }
}
