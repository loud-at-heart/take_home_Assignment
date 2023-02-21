import 'dart:async';
import 'dart:convert';
import 'dart:developer' as devlog;

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:take_home_assignment/models/customer_details.dart';
import 'package:take_home_assignment/modules/swiggyOtpLogin/data/swiggy_login_repository.dart';

part 'swiggy_login_event.dart';

part 'swiggy_login_state.dart';

class SwiggyLoginBloc extends Bloc<SwiggyLoginEvent, SwiggyLoginState> {
  SwiggyLoginBloc({required this.swiggyLoginRepository})
      : super(SwiggyLoginInitial()) {
    on<LoadDataEvent>(_handleLoadDataEvent);
    on<PhoneChangedEvent>(_handlePhoneChangedEvent);
    on<OTPChangedEvent>(_handleOTPChangedEvent);
    on<RequestOTPEvent>(_handleRequestOTPEvent);
    on<VerifyOTPEvent>(_handleVerifyOTPEvent);
    on<GetOrderEvent>(_handleGetOrderEvent);
  }

  final SwiggyLoginRepository swiggyLoginRepository;

  String? _otp = '';
  String? _phoneNo = '';
  CustomerDetails? _customerDetails;

  Future<void> _handlePhoneChangedEvent(
    PhoneChangedEvent event,
    Emitter<SwiggyLoginState> emit,
  ) async {
    _phoneNo = event.phoneNo;
    emit(SwiggyLoginInitial());
  }

  Future<void> _handleOTPChangedEvent(
    OTPChangedEvent event,
    Emitter<SwiggyLoginState> emit,
  ) async {
    _otp = event.otp;
    emit(SwiggyLoginInitial(enterOtp: true));
  }

  Future<void> _handleRequestOTPEvent(
    RequestOTPEvent event,
    Emitter<SwiggyLoginState> emit,
  ) async {
    emit(SwiggyLoginInitial(
      isLoading: true,
    ));
    var otpSentResponse = await swiggyLoginRepository.requestOtp(
      phoneNo: _phoneNo,
    );
    if (otpSentResponse.isSuccessful()) {
      emit(SwiggyLoginInitial(enterOtp: true));
    } else {
      emit(ErrorState(errorResponse: otpSentResponse.errorMessage));
    }
  }

  Future<void> _handleVerifyOTPEvent(
    VerifyOTPEvent event,
    Emitter<SwiggyLoginState> emit,
  ) async {
    emit(SwiggyLoginInitial(
      isLoading: true,
    ));
    var otpSentResponse = await swiggyLoginRepository.verifyOtp(
      otp: _otp,
    );
    if (otpSentResponse.isSuccessful()) {
      _customerDetails = otpSentResponse.data as CustomerDetails;
      emit(SwiggyLoginInitial(customerDetails: _customerDetails));
      add(GetOrderEvent());
    } else {
      emit(ErrorState(errorResponse: otpSentResponse.errorMessage));
    }
  }

  Future<void> _handleGetOrderEvent(
    GetOrderEvent event,
    Emitter<SwiggyLoginState> emit,
  ) async {
    var orderDetailsResponse = await swiggyLoginRepository.fetchOrder(
      orderId: event.orderId,
    );

    if (orderDetailsResponse.isSuccessful()) {
      if (event.orderId == null) {
        _customerDetails?.data?.orders =
            (orderDetailsResponse.data as CustomerDetails).data?.orders;
      } else {
        _customerDetails?.data?.orders = [
          ...?_customerDetails?.data?.orders,
          ...?(orderDetailsResponse.data as CustomerDetails).data?.orders
        ].toSet().toList();
      }
      devlog.log(
          "${jsonEncode((orderDetailsResponse.data as CustomerDetails).toJson())}",
          name: 'Pritam DebugLog');
      emit(SwiggyLoginInitial(
          customerDetails: _customerDetails,
          isPaginated: event.orderId != null,
          isPaginatedCompleted:
              ((orderDetailsResponse.data as CustomerDetails).data?.orders ??
                      [])
                  .isEmpty));
    } else {
      emit(ErrorState(errorResponse: orderDetailsResponse.errorMessage));
    }
  }

  Future<void> _handleLoadDataEvent(
    LoadDataEvent event,
    Emitter<SwiggyLoginState> emit,
  ) async {
    emit(SwiggyLoginInitial(customerDetails: _customerDetails));
  }
}
