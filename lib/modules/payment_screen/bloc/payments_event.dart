part of 'payments_bloc.dart';

@immutable
abstract class PaymentsEvent {}

class FetchScreenData extends PaymentsEvent {
  FetchScreenData({this.enteredAmount});

  final String? enteredAmount;
}

class InitiatePaymentEvent extends PaymentsEvent {}

class InitiateProgressScreenEvent extends PaymentsEvent {}
