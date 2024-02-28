import 'dart:math';

import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:take_home_assignment/components/blinking_cursor.dart';
import 'package:take_home_assignment/components/payment_keyboard/payment_keyboard.dart';
import 'package:take_home_assignment/components/scroll_behaviour.dart';
import 'package:take_home_assignment/components/shake_widget.dart';
import 'package:take_home_assignment/modules/payment_screen/bloc/payments_bloc.dart';
import 'package:take_home_assignment/navigation/routes.dart';
import 'package:take_home_assignment/resources/strings/app_strings.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';
import 'package:take_home_assignment/style/spacing.dart';
import 'package:take_home_assignment/utils/utils.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen>
    with SingleTickerProviderStateMixin {
  String amount = '';
  bool showCursor = true;
  bool validAmount = true;
  bool notMeetingMinAmount = false;
  bool isLoading = false;
  final shakeKey = GlobalKey<ShakeWidgetState>();
  final _controller = ActionSliderController();

  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    _refetchScreenData;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 100,
      ),
    );
    offset = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 1),
    ).animate(controller);
    super.initState();
  }

  void get _refetchScreenData {
    return BlocProvider.of<PaymentsBloc>(context)
        .add(FetchScreenData(enteredAmount: amount));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.forward();
        showCursor = false;
        setState(() {});
      },
      child: Scaffold(
        backgroundColor: AppColors.colorFBFBF6,
        appBar: AppBar(
          backgroundColor: AppColors.colorFBFBF6,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          bottom: _buildAppBar(context),
        ),
        body: BlocConsumer<PaymentsBloc, PaymentsState>(
          buildWhen: (previous, current) => _isRebuildWidgetState(current),
          builder: (context, state) {
            if (state is CurateDataOnEnteredAmount) {
              return Stack(
                children: [
                  ScrollConfiguration(
                    behavior: BottomSheetBehavior(),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Divider(),
                          AspectRatio(
                            aspectRatio: 360 / 146,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "enter amount".toUpperCase(),
                                  style: AppTextStyles.semiBold(
                                    FontSize.small,
                                    AppColors.black.withOpacity(0.4),
                                  ).copyWith(letterSpacing: 1.7),
                                ),
                                Spacing.sizeBoxHt12,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "₹",
                                      style: AppTextStyles.medium(
                                        28,
                                        amount.isNotEmpty
                                            ? AppColors.color191919
                                            : AppColors.colorD0D0D0,
                                      ),
                                    ),
                                    Spacing.sizeBoxWt8,
                                    if (amount.isEmpty && showCursor)
                                      BlinkingCursor(),
                                    renderAmount(state),
                                    if (amount.isNotEmpty && showCursor)
                                      BlinkingCursor(),
                                  ],
                                ),
                                Spacing.sizeBoxHt12,
                                Visibility(
                                  visible: !validAmount,
                                  child: Text(
                                    isNullOrEmpty(amount)
                                        ? "Please enter an amount."
                                        : "Amount entered More than available balance",
                                    style: AppTextStyles.regular(
                                      FontSize.small,
                                      AppColors.colorB45309,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: notMeetingMinAmount,
                                  child: Text(
                                    "Minimum Purchasing amount is ₹${RupeeFormatter.moneyFormat(state.minAmount ?? '0')}",
                                    style: AppTextStyles.regular(
                                      FontSize.small,
                                      AppColors.colorB45309,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ..._buildPaymentDesc(state),
                          Visibility(
                            visible: showCursor,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const Spacer(),
                      _buildCTA(state),
                      Visibility(
                        visible: showCursor,
                        child: SlideTransition(
                          position: offset,
                          child: PaymentKeyboard(
                            onTextInput: (myText) {
                              if (!validAmount && isNullOrEmpty(amount))
                                setState(() {
                                  validAmount = true;
                                });
                              if (notMeetingMinAmount)
                                setState(() {
                                  notMeetingMinAmount = false;
                                });
                              onKeyTap(myText);
                              if ((double.tryParse(amount) ?? 0.0) >
                                  (double.parse(state.balance ?? "0"))) {
                                shakeKey.currentState?.shake();
                                HapticFeedback.vibrate();
                                setState(() => validAmount = false);
                              }
                            },
                            onBackspace: () {
                              onBackspacePress();
                              if ((double.tryParse(amount) ?? 0.0) <=
                                  (double.parse(state.balance ?? "0"))) {
                                setState(() => validAmount = true);
                                if (notMeetingMinAmount)
                                  setState(() {
                                    notMeetingMinAmount = false;
                                  });
                              }
                            },
                          ),
                        ),
                        replacement: SizedBox.shrink(),
                      ),
                    ],
                  ),
                ],
              );
            }
            return SizedBox.shrink();
          },
          listener: (BuildContext context, PaymentsState state) {
            if (state is LoadingState) {
              _controller.loading();
              setState(() {
                showCursor = false;
                isLoading = true;
              });
            } else if (state is SuccessState) {
              _controller.success();
              Navigator.pushReplacementNamed(
                context,
                Routes.progressScreen,
              );
            }
          },
        ),
      ),
    );
  }

  List<Widget> _buildPaymentDesc(CurateDataOnEnteredAmount state) {
    return [
      _buildDesc(
        "Total Return",
        RichText(
          text: TextSpan(
            style: AppTextStyles.medium(
              FontSize.subtitle,
              AppColors.color475569,
            ),
            children: [
              TextSpan(
                text: "₹ ",
                style: AppTextStyles.medium(
                  FontSize.normal,
                  AppColors.colorA8A29E,
                ),
              ),
              TextSpan(
                text:
                    '${RupeeFormatter.moneyFormat(state.totalReturns ?? '0')} ',
              ),
            ],
          ),
        ),
      ),
      Divider(),
      _buildDesc(
        "Net Yield",
        RichText(
          text: TextSpan(
            style: AppTextStyles.medium(
              FontSize.subtitle,
              AppColors.color475569,
            ),
            children: [
              TextSpan(
                text: '${state.netYield} ',
              ),
              TextSpan(
                text: "%",
                style: AppTextStyles.medium(
                  FontSize.normal,
                  AppColors.colorA8A29E,
                ),
              ),
            ],
          ),
        ),
        isIrrRequired: true,
      ),
      Divider(),
      _buildDesc(
        "Tenure",
        RichText(
          text: TextSpan(
            style: AppTextStyles.medium(
              FontSize.subtitle,
              AppColors.color475569,
            ),
            children: [
              TextSpan(
                text: '${state.tenure} ',
              ),
              TextSpan(
                text: "days",
                style: AppTextStyles.medium(
                  FontSize.normal,
                  AppColors.colorA8A29E,
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  Padding _buildDesc(String title, Widget subtitle,
      {bool isIrrRequired = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.margin24,
        vertical: Spacing.margin16,
      ),
      child: Row(
        children: [
          Expanded(
            flex: isIrrRequired ? 0 : 1,
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: AppTextStyles.regular(
                FontSize.small,
                AppColors.color475569,
              ),
            ),
          ),
          if (isIrrRequired) ...[
            Spacing.sizeBoxWt8,
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: AppTextStyles.medium(
                    FontSize.small,
                    AppColors.color15803D,
                  ),
                  children: [
                    const TextSpan(
                      text: "IRR ",
                    ),
                    WidgetSpan(
                      child: Icon(
                        Icons.info_outline_rounded,
                        color: AppColors.color15803D,
                        size: Spacing.margin14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          subtitle,
        ],
      ),
    );
  }

  PreferredSize _buildAppBar(BuildContext context) {
    return PreferredSize(
      child: Padding(
        padding: const EdgeInsets.only(
          left: Spacing.margin24,
          top: Spacing.margin16,
        ),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    AppStrings.back,
                  ),
                ),
                Spacing.sizeBoxHt32,
                Text(
                  "Purchasing",
                  style: AppTextStyles.semiBold(
                    FontSize.title,
                    AppColors.black,
                  ),
                ),
                Spacing.sizeBoxHt8,
                RichText(
                  text: TextSpan(
                    style: AppTextStyles.regular(
                      FontSize.normal,
                      AppColors.color78716C,
                    ),
                    children: [
                      const TextSpan(
                        text: "Agrizy",
                      ),
                      WidgetSpan(
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: AppColors.color9D9D9D,
                          size: Spacing.margin16,
                        ),
                      ),
                      TextSpan(
                        text: "Keshav Industries",
                      ),
                    ],
                  ),
                ),
                Spacing.sizeBoxHt24,
              ],
            ),
          ],
        ),
      ),
      preferredSize: Size(0.0, 100.0),
    );
  }

  void onKeyTap(String val) {
    if (!validAmount) return;
    if ((val == '0' || val == '.') && amount.isEmpty) {
      return;
    }
    if (val == '.' && amount.contains('.')) {
      return;
    }
    if (amount.isNotEmpty &&
        amount.contains('.') &&
        amount.split('.')[1].length == 2) return;
    setState(() {
      amount = amount + val;
    });
    _refetchScreenData;
  }

  void onBackspacePress() {
    if (amount.isEmpty) {
      return;
    }

    setState(() {
      amount = amount.substring(0, amount.length - 1);
    });
    _refetchScreenData;
  }

  String dp(double val, int places) {
    final num mod = pow(Spacing.margin10, places);
    return ((val * mod).round().toDouble() / mod).toString();
  }

  String displayValue() {
    if (amount.contains(".")) {
      final truncatedAmount = dp(double.parse(amount), 2);
      return '${RupeeFormatter.moneyFormat(truncatedAmount.split('.')[0])}.${truncatedAmount.split('.')[1]}';
    }
    return RupeeFormatter.moneyFormat(amount);
  }

  Center renderAmount(CurateDataOnEnteredAmount state) {
    String display = ' Min 50,000';
    TextStyle style =
        AppTextStyles.semiBold(FontSize.large24, AppColors.colorD9D9D9);

    if (amount.isNotEmpty) {
      display = displayValue();
      style = AppTextStyles.semiBold(FontSize.large24, AppColors.color191919);
    }
    return Center(
      child: GestureDetector(
        onTap: () {
          controller.reverse();
          FocusScope.of(context).unfocus();
          setState(() {
            showCursor = true;
          });
        },
        child: ShakeWidget(
          key: shakeKey,
          shakeOffset: Spacing.margin10,
          shakeDuration: const Duration(milliseconds: 500),
          child: Text(
            display,
            style: style,
          ),
        ),
      ),
    );
  }

  Widget _buildCTA(CurateDataOnEnteredAmount state) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.colorE5E5E5,
            blurRadius: Spacing.margin12,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              Spacing.margin24,
              Spacing.margin16,
              Spacing.margin24,
              Spacing.margin8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Balance: ₹${RupeeFormatter.moneyFormat(state.balance ?? '0')}",
                  style: AppTextStyles.regular(
                    FontSize.small,
                    AppColors.color44403C,
                  ),
                ),
                Text(
                  "Required: ₹0",
                  style: AppTextStyles.regular(
                    FontSize.small,
                    AppColors.color44403C,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.margin24,
            ),
            child: AbsorbPointer(
              absorbing: !validAmount && !isNullOrEmpty(amount),
              child: ColorFiltered(
                colorFilter: !validAmount && !isNullOrEmpty(amount)
                    ? AppColorFilter.disabledFilter
                    : const ColorFilter.mode(
                        AppColors.transparent,
                        BlendMode.color,
                      ),
                child: ActionSlider.custom(
                  sliderBehavior: SliderBehavior.stretch,
                  controller: _controller,
                  height: 45.0,
                  toggleWidth: 45.0,
                  toggleMargin: EdgeInsets.zero,
                  backgroundColor: Colors.green,
                  foregroundChild: Padding(
                    padding: EdgeInsets.all(
                      Spacing.verySmallMargin,
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: AppColors.color15803D,
                          borderRadius: BorderRadius.circular(Spacing.margin4)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(Spacing.margin12),
                            child: getSliderIcon,
                          ),
                        ],
                      ),
                    ),
                  ),
                  foregroundBuilder: (context, state, child) => child!,
                  outerBackgroundBuilder: (context, state, child) => Card(
                    margin: EdgeInsets.zero,
                    color: AppColors.colorE7E5E4,
                    elevation: 0.0,
                    child: Center(
                      child: Text(
                        "Swipe to pay".toUpperCase(),
                        style: AppTextStyles.semiBold(
                          FontSize.small,
                          AppColors.color1C1917,
                        ).copyWith(letterSpacing: 1.5),
                      ),
                    ),
                  ),
                  backgroundBorderRadius:
                      BorderRadius.circular(Spacing.margin6),
                  action: (controller) async {
                    if (isNullOrEmpty(amount)) {
                      controller.reset();
                      shakeKey.currentState?.shake();
                      HapticFeedback.vibrate();
                      setState(() => validAmount = false);
                    } else if ((double.tryParse(amount) ?? 0) <
                        (double.tryParse(state.minAmount ?? '0') ?? 0)) {
                      controller.reset();
                      setState(() => notMeetingMinAmount = true);
                    } else {
                      BlocProvider.of<PaymentsBloc>(context)
                          .add(InitiatePaymentEvent());
                    }
                  },
                ),
              ),
            ),
          ),
          Spacing.sizeBoxHt24,
        ],
      ),
    );
  }

  Widget get getSliderIcon {
    if (isLoading)
      return SizedBox(
        height: Spacing.margin16,
        width: Spacing.margin16,
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2,
        ),
      );
    return Icon(
      Icons.arrow_forward,
      color: Colors.white,
      size: Spacing.margin16,
    );
  }

  bool _isRebuildWidgetState(PaymentsState current) =>
      current is CurateDataOnEnteredAmount;
}
