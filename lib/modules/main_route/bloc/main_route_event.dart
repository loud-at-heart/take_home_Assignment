part of 'main_route_bloc.dart';

@immutable
abstract class MainRouteEvent {}

class InitStackSheetEvent extends MainRouteEvent {
  final double? initialVal;

  InitStackSheetEvent(this.initialVal);
}

class ExpandLimitSelectorSheetEvent extends MainRouteEvent {}

class CollapseLimitSelectorSheetEvent extends MainRouteEvent {}

class ExpandPlanSelectorCollapseLimitSelectorSheetEvent extends MainRouteEvent {
  final double? selectedVal;

  ExpandPlanSelectorCollapseLimitSelectorSheetEvent(this.selectedVal);
}

class CollapsePlanSelectorExpandLimitSelectorSheetEvent extends MainRouteEvent {
  final double? selectedVal;

  CollapsePlanSelectorExpandLimitSelectorSheetEvent(this.selectedVal);
}

class ExpandAccountSelectorCollapsePlanSelectorSheetEvent
    extends MainRouteEvent {
  final double? selectedVal;
  final Map<String, String>? planSelected;

  ExpandAccountSelectorCollapsePlanSelectorSheetEvent(
    this.selectedVal,
    this.planSelected,
  );
}
