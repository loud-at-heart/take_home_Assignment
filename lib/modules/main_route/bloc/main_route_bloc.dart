import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:take_home_assignment/modules/main_route/view/plan_selector.dart';

part 'main_route_event.dart';

part 'main_route_state.dart';

class MainRouteBloc extends Bloc<MainRouteEvent, MainRouteState> {
  MainRouteBloc() : super(MainRouteInitial()) {
    on<InitStackSheetEvent>(_openStackedSheetEvent);
    on<ExpandPlanSelectorCollapseLimitSelectorSheetEvent>(
        _openPlanSelectorEvent);
    on<CollapsePlanSelectorExpandLimitSelectorSheetEvent>(
        _closeAccountSelectorEvent);
  }

  Future<void> _openStackedSheetEvent(
      InitStackSheetEvent event, Emitter<MainRouteState> emit) async {
    emit(ExpandedLimitSelectorState(event.initialVal));
  }

  Future<void> _openPlanSelectorEvent(
      ExpandPlanSelectorCollapseLimitSelectorSheetEvent event,
      Emitter<MainRouteState> emit) async {
    emit(CollapsedLimitSelectorState(event.selectedVal));
    emit(ExpandedPlanSelectorState(event.selectedVal));
  }

  Future<void> _closeAccountSelectorEvent(
      CollapsePlanSelectorExpandLimitSelectorSheetEvent event,
      Emitter<MainRouteState> emit) async {
    emit(ExpandedLimitSelectorState(event.selectedVal));
  }
}
