part of 'swiggy_login_bloc.dart';

@immutable
abstract class SwiggyLoginEvent {}

class LoadDataEvent extends SwiggyLoginEvent {}

class PhoneChangedEvent extends SwiggyLoginEvent {
  PhoneChangedEvent({
    this.phoneNo,
  });

  final String? phoneNo;
}

class OTPChangedEvent extends SwiggyLoginEvent {
  OTPChangedEvent({
    this.otp,
  });

  final String? otp;
}

class RequestOTPEvent extends SwiggyLoginEvent {}

class VerifyOTPEvent extends SwiggyLoginEvent {}

class GetOrderEvent extends SwiggyLoginEvent {
  GetOrderEvent({this.orderId});

  final String? orderId;
}
