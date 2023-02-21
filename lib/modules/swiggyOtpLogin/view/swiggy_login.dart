import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:take_home_assignment/components/notification/custom_notification.dart';
import 'package:take_home_assignment/components/scroll_behaviour.dart';
import 'package:take_home_assignment/models/order_details.dart';
import 'package:take_home_assignment/modules/swiggyOtpLogin/bloc/swiggy_login_bloc.dart';
import 'package:take_home_assignment/modules/swiggyOtpLogin/view/pincode_field.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_dimens.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';
import 'package:take_home_assignment/style/spacing.dart';

class SwiggyLoginView extends StatefulWidget {
  const SwiggyLoginView({Key? key}) : super(key: key);

  @override
  State<SwiggyLoginView> createState() => _SwiggyLoginViewState();
}

class _SwiggyLoginViewState extends State<SwiggyLoginView> {
  String? _phoneNo = "";
  int value = 0;
  bool positive = true;
  bool loading = false;
  final PageController _pageController = PageController();

  String currencyInterpolate(String data) => data.contains('.')
      ? "${_currencyFormat.format(double.parse(data.split('.')[0]))}${'.${data.split('.')[1]}'}"
      : "${_currencyFormat.format(double.parse(data))}";

  get _currencyFormat => NumberFormat.currency(
        symbol: '₹',
        locale: "HI",
        decimalDigits: 0,
      );

  @override
  void initState() {
    super.initState();
    _listenOtp();
  }

  void _listenOtp() async {
    var _ = SmsAutoFill().listenForCode;
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
        ),
        body: BlocConsumer<SwiggyLoginBloc, SwiggyLoginState>(
          listener: (context, state) {
            if (state is ErrorState) {
              CustomNotification.notify(context, NotificationType.error,
                  state.errorResponse ?? "Something went wrong!");
            }
          },
          builder: (context, state) {
            return state is SwiggyLoginInitial
                ? ScrollConfiguration(
                    behavior: BottomSheetBehavior(),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Spacing.margin24,
                            vertical: Spacing.margin24),
                        child: Column(
                          children: [
                            TextFormField(
                              style: AppTextStyles.regular(
                                FontSize.normal,
                                AppColors.black,
                              ),
                              cursorColor: AppColors.primary,
                              decoration: InputDecoration(
                                hintText: "Enter mobile number",
                                hintStyle: AppTextStyles.regular(
                                  FontSize.subtitle,
                                  AppColors.grey9f,
                                ),
                                label: Container(
                                  child: Text(
                                    "Enter mobile number",
                                    style: AppTextStyles.regular(
                                      FontSize.normal,
                                      AppColors.primary,
                                    ),
                                  ),
                                ),
                                iconColor: AppColors.white,
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                    color: AppColors.primary,
                                    width: 1,
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                    color: AppColors.primary,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                    color: AppColors.primary,
                                    width: 2,
                                  ),
                                ),
                              ),
                              // key: _textFieldKey,
                              // controller: _amountController,
                              onChanged: (value) {
                                _phoneNo = value;
                                BlocProvider.of<SwiggyLoginBloc>(context).add(
                                  PhoneChangedEvent(
                                    phoneNo: _phoneNo,
                                  ),
                                );
                              },
                              enabled: !state.enterOtp && !state.isLoading,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                            ),
                            if (!state.enterOtp && !state.isLoading) ...[
                              Spacing.sizeBoxHt18,
                              ElevatedButton(
                                onPressed: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  BlocProvider.of<SwiggyLoginBloc>(context).add(
                                    RequestOTPEvent(),
                                  );
                                },
                                child: Text("Get OTP"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                ),
                              ),
                            ] else if (state.enterOtp && !state.isLoading) ...[
                              Spacing.sizeBoxHt18,
                              OtpAutoFill(),
                            ] else ...[
                              Spacing.sizeBoxHt18,
                              CircularProgressIndicator(
                                  color: AppColors.primary),
                            ],
                            Spacing.sizeBoxHt32,
                            if (state.customerDetails != null) ...[
                              AnimatedToggleSwitch<bool>.dual(
                                current: positive,
                                first: false,
                                second: true,
                                dif: 80.0,
                                borderColor: Colors.transparent,
                                borderWidth: 5.0,
                                height: 55,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(0, 1.5),
                                  ),
                                ],
                                onChanged: (b) {
                                  setState(() => positive = b);
                                  !positive
                                      ? _pageController.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeIn,
                                        )
                                      : _pageController.previousPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeIn,
                                        );
                                  return Future.delayed(Duration(seconds: 2));
                                },
                                colorBuilder: (b) => b
                                    ? AppColors.primary
                                    : AppColors.orangeButtonGradient2,
                                iconBuilder: (value) => value
                                    ? Icon(
                                        Icons.fastfood_rounded,
                                        color: AppColors.white,
                                      )
                                    : Icon(
                                        Icons.location_on_rounded,
                                        color: AppColors.white,
                                      ),
                                textBuilder: (value) => value
                                    ? Center(child: Text('Addresses'))
                                    : Center(child: Text('Food order')),
                                loading: loading,
                              ),
                              Spacing.sizeBoxHt24,
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.55,
                                child: PageView(
                                  scrollDirection: Axis.horizontal,
                                  controller: _pageController,
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollBehavior: BottomSheetBehavior(),
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.55,
                                      child: ListView.builder(
                                        itemCount: state.customerDetails?.data
                                            ?.addresses?.length,
                                        itemBuilder: (ctx, i) {
                                          var address = state.customerDetails
                                              ?.data?.addresses?[i];
                                          return Card(
                                            child: ListTile(
                                              title: Row(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(
                                                        Spacing
                                                            .halfSmallMargin),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(
                                                          Dimensions
                                                              .defaultRadius,
                                                        ),
                                                      ),
                                                      color:
                                                          AppColors.colorFF822E,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        address?.annotation ??
                                                            '',
                                                        style: AppTextStyles
                                                            .regular(
                                                          FontSize.small,
                                                          AppColors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              subtitle: Column(
                                                children: [
                                                  Text(address?.address ?? ""),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.55,
                                      child:
                                          state.customerDetails?.data?.orders !=
                                                  null
                                              ? NotificationListener<
                                                  ScrollNotification>(
                                                  onNotification:
                                                      (notification) {
                                                    if (notification
                                                        .metrics.atEdge) {
                                                      if (notification
                                                              .metrics.pixels !=
                                                          0) {
                                                        if (!state
                                                                .isPaginated &&
                                                            !state
                                                                .isPaginatedCompleted) {
                                                          BlocProvider.of<
                                                                      SwiggyLoginBloc>(
                                                                  context)
                                                              .add(
                                                            GetOrderEvent(
                                                                orderId: state
                                                                    .customerDetails
                                                                    ?.data
                                                                    ?.orders
                                                                    ?.last
                                                                    .orderId
                                                                    .toString()),
                                                          );
                                                        }
                                                      }
                                                    }
                                                    return true;
                                                  },
                                                  child: ListView.builder(
                                                    itemCount: state.isPaginated
                                                        ? (state
                                                                    .customerDetails
                                                                    ?.data
                                                                    ?.orders
                                                                    ?.length ??
                                                                0) +
                                                            1
                                                        : state
                                                            .customerDetails
                                                            ?.data
                                                            ?.orders
                                                            ?.length,
                                                    itemBuilder: (ctx, i) {
                                                      Orders? orderDetails;
                                                      if (i !=
                                                          (state
                                                                      .customerDetails
                                                                      ?.data
                                                                      ?.orders
                                                                      ?.length ??
                                                                  0) +
                                                              1) {
                                                        orderDetails = state
                                                            .customerDetails
                                                            ?.data
                                                            ?.orders?[i];
                                                      }
                                                      return (i ==
                                                                  (state.customerDetails?.data?.orders
                                                                              ?.length ??
                                                                          0) +
                                                                      1) &&
                                                              state.isPaginated
                                                          ? Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: AppColors
                                                                    .primary,
                                                              ),
                                                            )
                                                          : Card(
                                                              child: ListTile(
                                                                title: Row(
                                                                  children: [
                                                                    Container(
                                                                      padding: EdgeInsets.all(
                                                                          Spacing
                                                                              .halfSmallMargin),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                          Radius
                                                                              .circular(
                                                                            Dimensions.defaultRadius,
                                                                          ),
                                                                        ),
                                                                        color: AppColors
                                                                            .primary,
                                                                      ),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          (orderDetails?.orderId ?? '0')
                                                                              .toString(),
                                                                          style:
                                                                              AppTextStyles.regular(
                                                                            FontSize.small,
                                                                            AppColors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                subtitle:
                                                                    Column(
                                                                  children: [
                                                                    for (var j =
                                                                            0;
                                                                        j < (orderDetails?.orderItems ?? []).length;
                                                                        j++) ...[
                                                                      Row(
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Text(orderDetails?.orderItems?[j].name ?? ""),
                                                                          ),
                                                                          Spacer(),
                                                                          Text(currencyInterpolate(orderDetails?.orderItems?[j].finalPrice ??
                                                                              "")),
                                                                        ],
                                                                      ),
                                                                      Spacing
                                                                          .sizeBoxHt8,
                                                                    ]
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                    },
                                                  ),
                                                )
                                              : Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: AppColors.primary,
                                                  ),
                                                ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  )
                : Container();
          },
        ),
      ),
    );
  }
}
