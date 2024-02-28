import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:take_home_assignment/utils/utils.dart';

part 'payments_event.dart';

part 'payments_state.dart';

class PaymentsBloc extends Bloc<PaymentsEvent, PaymentsState> {
  PaymentsBloc() : super(PaymentsInitial()) {
    on<FetchScreenData>(_onFetchScreenData);
    on<InitiatePaymentEvent>(_onInitiatePaymentEvent);
    on<InitiateProgressScreenEvent>(_onInitiateProgressScreenEvent);
  }

  String? totalReturn;
  String? minAmount = "50000";
  bool isPaymentSuccessViewed = false;
  bool isDocumentSigningDone = false;

  Future<void> _onFetchScreenData(
    FetchScreenData event,
    Emitter<PaymentsState> emit,
  ) async {
    double enteredAmount = double.tryParse(event.enteredAmount ?? '0') ?? 1.0;
    if (isNullOrEmpty(event.enteredAmount))
      totalReturn = "56555";
    else if (enteredAmount >= 50000 && enteredAmount <= 100000) {
      totalReturn = (((double.tryParse(event.enteredAmount ?? '0') ?? 1.0) /
                  (double.tryParse(minAmount ?? '0') ?? 1.0)) *
              56555)
          .toStringAsFixed(0);
    } else {
      totalReturn = '-';
    }
    emit(
      CurateDataOnEnteredAmount(
        totalReturns: totalReturn,
        balance: "100000",
        minAmount: "50000",
        netYield: "13.11",
        tenure: "61",
      ),
    );
  }

  Future<void> _onInitiatePaymentEvent(
    InitiatePaymentEvent event,
    Emitter<PaymentsState> emit,
  ) async {
    emit(LoadingState());
    await Future.delayed(
      Duration(seconds: 3),
      () async => emit(SuccessState()),
    );
  }

  Future<void> _onInitiateProgressScreenEvent(
    InitiateProgressScreenEvent event,
    Emitter<PaymentsState> emit,
  ) async {
    print("isDocumentSigningDone $isDocumentSigningDone\nisPaymentSuccessViewed $isPaymentSuccessViewed\n");
    if(isPaymentSuccessViewed){
      if(isDocumentSigningDone){
        emit(FinalState());
        await Future.delayed(
          Duration(seconds: 2),
              () async => emit(RedirectToInitialState()),
        );
      }else{
        await Future.delayed(
          Duration(seconds: 2),
              () async => emit(DocumentVerificationPendingState()),
        );
        await Future.delayed(
          Duration(seconds: 2),
              () async => emit(NavigateToDocumentVerificationPendingState()),
        );
      }
    }else{
      emit(PaymentSuccessState());
      isPaymentSuccessViewed = true;
      add(InitiateProgressScreenEvent());
    }
  }
}
