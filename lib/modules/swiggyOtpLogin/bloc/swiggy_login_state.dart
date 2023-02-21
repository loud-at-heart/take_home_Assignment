part of 'swiggy_login_bloc.dart';

@immutable
abstract class SwiggyLoginState {}

class SwiggyLoginInitial extends SwiggyLoginState {
  SwiggyLoginInitial({
    this.enterOtp = false,
    this.isLoading = false,
    this.isPaginated = false,
    this.isPaginatedCompleted = false,
    this.customerDetails,
  });

  final bool enterOtp;
  final bool isLoading;
  final bool isPaginated;
  final bool isPaginatedCompleted;
  final CustomerDetails? customerDetails;
}

class ErrorState extends SwiggyLoginState {
  ErrorState({this.errorResponse});

  final String? errorResponse;
}
