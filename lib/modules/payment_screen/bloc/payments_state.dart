part of 'payments_bloc.dart';

@immutable
abstract class PaymentsState {}

class PaymentsInitial extends PaymentsState {}

class CurateDataOnEnteredAmount extends PaymentsState {
  CurateDataOnEnteredAmount({
    this.balance,
    this.totalReturns,
    this.netYield,
    this.tenure,
    this.minAmount,
  });

  final String? balance;
  final String? totalReturns;
  final String? netYield;
  final String? tenure;
  final String? minAmount;
}

class LoadingState extends PaymentsState {}

class SuccessState extends PaymentsState {}

class PaymentSuccessState extends PaymentsState {}

class DocumentVerificationPendingState extends PaymentsState {}

class NavigateToDocumentVerificationPendingState extends PaymentsState {}

class FinalState extends PaymentsState {}

class RedirectToInitialState extends PaymentsState {}
