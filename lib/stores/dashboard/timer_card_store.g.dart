// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_card_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TimerCardStore on _TimerCardStore, Store {
  late final _$isFinishedAtom =
      Atom(name: '_TimerCardStore.isFinished', context: context);

  @override
  bool get isFinished {
    _$isFinishedAtom.reportRead();
    return super.isFinished;
  }

  @override
  set isFinished(bool value) {
    _$isFinishedAtom.reportWrite(value, super.isFinished, () {
      super.isFinished = value;
    });
  }

  late final _$finishedTimerAsyncAction =
      AsyncAction('_TimerCardStore.finishedTimer', context: context);

  @override
  Future<void> finishedTimer(ITimerModel timer) {
    return _$finishedTimerAsyncAction.run(() => super.finishedTimer(timer));
  }

  @override
  String toString() {
    return '''
isFinished: ${isFinished}
    ''';
  }
}
