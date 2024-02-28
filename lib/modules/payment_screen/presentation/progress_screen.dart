import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:take_home_assignment/components/animated_size_widget.dart';
import 'package:take_home_assignment/modules/payment_screen/bloc/payments_bloc.dart';
import 'package:take_home_assignment/modules/payment_screen/presentation/sign_contract_page.dart';
import 'package:take_home_assignment/resources/strings/app_strings.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';
import 'package:take_home_assignment/style/spacing.dart';

class ProgressScreen extends StatefulWidget {
  ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.color15803D,
                ),
                child: Center(
                  child: Image.asset('assets/icon/screen_background.png'),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: 1,
                child: Stack(
                  children: [
                    Lottie.asset(
                      "assets/svg_icons/backgroundLottie.json",
                      repeat: true,
                    ),
                    BlocConsumer<PaymentsBloc, PaymentsState>(
                      listener: (context, state) {
                        if (state
                            is NavigateToDocumentVerificationPendingState) {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (_, __, ___) => BlocProvider.value(
                                value: BlocProvider.of<PaymentsBloc>(context),
                                child: const SignContractPage(),
                              ),
                            ),
                          );
                        }else if (state
                            is RedirectToInitialState) {
                          Navigator.pop(context);
                        }
                      },
                      builder: (context, state) {
                        return Positioned(
                          top: MediaQuery.of(context).size.height * 0.22,
                          left: _getContentLeftPostion(state),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 111,
                                width: 111,
                                decoration: BoxDecoration(
                                    color: AppColors.color116631,
                                    borderRadius: BorderRadius.circular(13.5)),
                                child: AnimatedSizeWidget(
                                  duration: const Duration(milliseconds: 250),
                                  child: AnimatedSwitcher(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    child: _buildIconPanel(state),
                                  ),
                                ),
                              ),
                              Spacing.sizeBoxHt42,
                              AnimatedSizeWidget(
                                duration: const Duration(milliseconds: 250),
                                child: _buildDescPanel(state),
                              )
                            ],
                          ),
                        );
                      },
                      buildWhen: _buildWhen,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getContentLeftPostion(PaymentsState state) => state is FinalState
      ? MediaQuery.of(context).size.width * 0.25
      : MediaQuery.of(context).size.width * 0.15;

  Widget _buildIconPanel(PaymentsState state) {
    if (state is PaymentSuccessState) {
      return Stack(
        children: [
          AnimatedCheckBG(
            showAnimation: true,
          ),
          Positioned.fill(child: LogoApp()),
        ],
      );
    } else if (state is DocumentVerificationPendingState) {
      return SvgPicture.asset(
        AppStrings.docVerify,
      );
    } else if (state is FinalState) {
      return SvgPicture.asset(
        AppStrings.finalFlag,
      );
    }
    return SizedBox.shrink();
  }

  Widget _buildDescPanel(PaymentsState state) {
    if (state is PaymentSuccessState) {
      return Column(
        children: [
          Text(
            "Payment Done",
            style: AppTextStyles.semiBold(FontSize.subtitle, AppColors.white),
          ),
          Spacing.sizeBoxHt24,
          Text(
            "You are almost there!",
            style: AppTextStyles.regular(FontSize.small, AppColors.white),
          ),
          Spacing.sizeBoxHt8,
          Text(
            "Do not leave this page, or press the back button.",
            style: AppTextStyles.regular(FontSize.small, AppColors.white),
          ),
        ],
      );
    } else if (state is DocumentVerificationPendingState) {
      return Column(
        children: [
          Text(
            "Generating Contract",
            style: AppTextStyles.semiBold(FontSize.subtitle, AppColors.white),
          ),
          Spacing.sizeBoxHt24,
          Text(
            "You are almost there!",
            style: AppTextStyles.regular(FontSize.small, AppColors.white),
          ),
          Spacing.sizeBoxHt8,
          Text(
            "Do not leave this page, or press the back button.",
            style: AppTextStyles.regular(FontSize.small, AppColors.white),
          ),
        ],
      );
    } else if (state is FinalState) {
      return Column(
        children: [
          Text(
            "All Done!",
            style: AppTextStyles.semiBold(FontSize.subtitle, AppColors.white),
          ),
          Spacing.sizeBoxHt24,
          Text(
            "Redirecting you to the Dashboard.",
            style: AppTextStyles.regular(FontSize.small, AppColors.white),
          ),
        ],
      );
    }
    return SizedBox.shrink();
  }

  bool _buildWhen(PaymentsState previous, PaymentsState current) =>
      current is PaymentSuccessState ||
      current is DocumentVerificationPendingState ||
      current is FinalState;
}

class AnimatedCheckBG extends StatefulWidget {
  const AnimatedCheckBG({
    super.key,
    this.showAnimation = false,
  });

  final bool showAnimation;

  @override
  State<AnimatedCheckBG> createState() => _AnimatedCheckBGState();
}

class _AnimatedCheckBGState extends State<AnimatedCheckBG>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 5000),
        vsync: this,
        upperBound: pi * 2)
      ..repeat();
    if (widget.showAnimation) _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
        child: SvgPicture.asset(
          AppStrings.checkBackground,
        ),
      ),
    );
  }
}

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    controller.forward();
  }

  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Center(
        child: Icon(
          Icons.check_rounded,
          color: AppColors.color116631,
        ),
      ),
    );
  }
}
