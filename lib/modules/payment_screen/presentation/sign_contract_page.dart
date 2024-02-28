import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_assignment/components/app_button_widget.dart';
import 'package:take_home_assignment/modules/payment_screen/bloc/payments_bloc.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_dimens.dart';
import 'package:take_home_assignment/style/spacing.dart';

class SignContractPage extends StatelessWidget {
  const SignContractPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/icon/agreement.png'),
          ),
          Spacing.sizeBoxHt32,
          AppButtonWidget(
            width: 150,
            buttonColor: AppColors.color16A34A,
            margin: Spacing.margin16,
            borderRadius: Dimensions.radius12,
            text: "Sign Contract",
            onPressed: () {
              BlocProvider.of<PaymentsBloc>(context).isDocumentSigningDone = true;
              BlocProvider.of<PaymentsBloc>(context)
                  .add(InitiateProgressScreenEvent());
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
