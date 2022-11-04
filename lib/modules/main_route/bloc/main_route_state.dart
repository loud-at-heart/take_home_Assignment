part of 'main_route_bloc.dart';

@immutable
abstract class MainRouteState {}

class MainRouteInitial extends MainRouteState {}

// States which will be used hand in hand for this project

class ExpandedLimitSelectorState extends MainRouteState {
  final double? initialVal;

  ExpandedLimitSelectorState(this.initialVal);
}

class CollapsedLimitSelectorState extends MainRouteState {
  final double? selectedVal;

  CollapsedLimitSelectorState(this.selectedVal);
}

class ExpandedPlanSelectorState extends MainRouteState {
  final double? selectedVal;

  ExpandedPlanSelectorState(this.selectedVal);
}

class CollapsedPlanSelectorState extends MainRouteState {}
