import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:take_home_assignment/components/notification/custom_notification.dart';
import 'package:take_home_assignment/modules/swiggyOtpLogin/bloc/swiggy_login_bloc.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_dimens.dart';
import 'package:take_home_assignment/style/spacing.dart';

class OtpAutoFill extends StatefulWidget {
  OtpAutoFill({
    this.isInvalid,
  });

  final bool? isInvalid;

  @override
  _OtpAutoFillState createState() => _OtpAutoFillState();
}

class _OtpAutoFillState extends State<OtpAutoFill> {
  String? otpValue = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.size60,
      child: PinFieldAutoFill(
        autoFocus: true,
        currentCode: otpValue,
        keyboardType: TextInputType.number,
        decoration: BoxLooseDecoration(
          gapSpace: Dimensions.size12,
          strokeWidth: Spacing.verySmallMargin,
          strokeColorBuilder: (widget.isInvalid ?? false)
              ? PinListenColorBuilder(AppColors.darkRed, AppColors.colorB2B2B2)
              : PinListenColorBuilder(AppColors.purple, AppColors.colorB2B2B2),
          bgColorBuilder: null,
          obscureStyle: ObscureStyle(
            isTextObscure: false,
            obscureText: '☺️',
          ),
        ),
        codeLength: 6,
        onCodeChanged: (value) {
          otpValue = value;
          BlocProvider.of<SwiggyLoginBloc>(context).add(
            OTPChangedEvent(
              otp: otpValue,
            ),
          );

          //Drop off the keyboard after done typing code
          if (value!.length == 6) {
            FocusManager.instance.primaryFocus!.unfocus();
            if (value.isNotEmpty) {
              BlocProvider.of<SwiggyLoginBloc>(context).add(
                VerifyOTPEvent(),
              );
            } else {
              CustomNotification.notify(
                  context, NotificationType.error, "OTP cannot be empty");
            }
          }
        },
        onCodeSubmitted: (value) async {
          otpValue = value;
          BlocProvider.of<SwiggyLoginBloc>(context).add(
            OTPChangedEvent(
              otp: otpValue,
            ),
          );
        },
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
      ),
    );
  }
}
