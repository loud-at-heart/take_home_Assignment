// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TimerListStore on _TimerListStore, Store {
  late final _$timerListAtom =
      Atom(name: '_TimerListStore.timerList', context: context);

  @override
  ObservableList<ITimerModel> get timerList {
    _$timerListAtom.reportRead();
    return super.timerList;
  }

  @override
  set timerList(ObservableList<ITimerModel> value) {
    _$timerListAtom.reportWrite(value, super.timerList, () {
      super.timerList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_TimerListStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_TimerListStore.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$_loadListAsyncAction =
      AsyncAction('_TimerListStore._loadList', context: context);

  @override
  Future<void> _loadList() {
    return _$_loadListAsyncAction.run(() => super._loadList());
  }

  late final _$_TimerListStoreActionController =
      ActionController(name: '_TimerListStore', context: context);

  @override
  void addTimer(ITimerModel newTimer) {
    final _$actionInfo = _$_TimerListStoreActionController.startAction(
        name: '_TimerListStore.addTimer');
    try {
      return super.addTimer(newTimer);
    } finally {
      _$_TimerListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTimer(ITimerModel timer) {
    final _$actionInfo = _$_TimerListStoreActionController.startAction(
        name: '_TimerListStore.removeTimer');
    try {
      return super.removeTimer(timer);
    } finally {
      _$_TimerListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void finishedTimer(ITimerModel timer) {
    final _$actionInfo = _$_TimerListStoreActionController.startAction(
        name: '_TimerListStore.finishedTimer');
    try {
      return super.finishedTimer(timer);
    } finally {
      _$_TimerListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
timerList: ${timerList},
isLoading: ${isLoading}
    ''';
  }
}
