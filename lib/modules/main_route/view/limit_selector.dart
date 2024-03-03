import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_assignment/components/app_button.dart';
import 'package:take_home_assignment/modules/main_route/view/plan_selector.dart';
import 'package:take_home_assignment/modules/main_route/bloc/main_route_bloc.dart';
import 'package:take_home_assignment/navigation/routes.dart';
import 'package:take_home_assignment/resources/strings/app_strings.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';
import 'package:take_home_assignment/style/app_dimens.dart';
import 'package:take_home_assignment/style/spacing.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:take_home_assignment/utils/utils.dart';

class LimitSelector extends StatefulWidget {
  const LimitSelector({
    Key? key,
  }) : super(key: key);

  @override
  State<LimitSelector> createState() => _LimitSelectorState();
}

class _LimitSelectorState extends State<LimitSelector> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Size? listTileSize;
  double initialVal = 150000;

  @override
  void initState() {
    BlocProvider.of<MainRouteBloc>(context)
      .add(InitStackSheetEvent(initialVal));
    super.initState();
  }

  void displayLimitSelectorPersistentBottomSheet(double? selectedVal) {
    _scaffoldKey.currentState?.showBottomSheet<void>(
      (BuildContext ctx) {
        return GestureDetector(
          onVerticalDragStart: (_) {},
          child: PlanSelector(
            stackHeight: MediaQuery.of(context).size.height / 1.23,
            selectedVal: selectedVal,
          ),
        );
      },
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainRouteBloc, MainRouteState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            BlocProvider.of<MainRouteBloc>(context)
              .add(
                CollapsePlanSelectorExpandLimitSelectorSheetEvent(
                  initialVal,
                ),
              );
            return true;
          },
          child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              leading: CloseButton(
                color: AppColors.greyLite,
                onPressed: () async =>
                    await Navigator.pushNamed(context, Routes.mainScreen),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.help_outline_rounded),
                  onPressed: () {},
                )
              ],
              backgroundColor: AppColors.color12141A,
              elevation: 0,
            ),
            backgroundColor: AppColors.color12141A,
            body: state is ExpandedLimitSelectorState
                ? Stack(
                    children: [
                      SizedBox.expand(
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight:
                                    Radius.circular(Dimensions.largeRadius30),
                                topLeft:
                                    Radius.circular(Dimensions.largeRadius30),
                              ),
                              color: AppColors.color171922),
                          padding: const EdgeInsets.symmetric(
                              horizontal: Spacing.margin24,
                              vertical: Spacing.margin40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'nikunj, how much do you need?',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.boldRoboto(
                                  FontSize.title,
                                  AppColors.white,
                                ),
                              ),
                              Spacing.sizeBoxHt24,
                              Center(
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          Dimensions.largeRadius30),
                                    ),
                                  ),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: Spacing.margin40,
                                    ),
                                    child: SleekCircularSlider(
                                      min: 1,
                                      max: 200000,
                                      initialValue:
                                      state.initialVal ?? 150000,
                                      onChange: (double value) {
                                        setState(() {
                                          initialVal = double.parse(value.toStringAsFixed(0));
                                        });
                                      },
                                      innerWidget: (double value) {
                                        return Center(
                                          child: Text(
                                            RupeeFormatter.indianRupeesFormat.format(value),
                                            style: AppTextStyles.boldRoboto(
                                              FontSize.large,
                                              AppColors.black,
                                            ),
                                          ),
                                        );
                                      },
                                      appearance: CircularSliderAppearance(
                                        customWidths: CustomSliderWidths(
                                            progressBarWidth: 20,
                                            trackWidth: 20),
                                        customColors: CustomSliderColors(
                                          dotColor: HexColor('#FFB1B2'),
                                          trackColor: HexColor('#FEE9DC'),
                                          progressBarColors: [
                                            HexColor('##D08C72'),
                                            HexColor('##D08C72'),
                                          ],
                                          shadowColor: HexColor('#FFB1B2'),
                                          shadowMaxOpacity: 0.05,
                                        ),
                                        angleRange: 360,
                                        counterClockwise: false,
                                        startAngle: 270,
                                        size: 200,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: AppButton(
                            onTap: () {
                              BlocProvider.of<MainRouteBloc>(context)
                                .add(
                                    ExpandPlanSelectorCollapseLimitSelectorSheetEvent(
                                        initialVal));
                            },
                            content: Text(
                              AppStrings.limitSelectionCta,
                              style: AppTextStyles.boldRoboto(
                                FontSize.subtitle,
                                AppColors.white,
                              ),
                            )),
                      ),
                    ],
                  )
                : (state is CollapsedLimitSelectorState)
                    ? SizedBox.expand(
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight:
                                    Radius.circular(Dimensions.largeRadius30),
                                topLeft:
                                    Radius.circular(Dimensions.largeRadius30),
                              ),
                              color: AppColors.color171922),
                          child: ListTile(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topRight:
                                  Radius.circular(Dimensions.largeRadius30),
                              topLeft:
                                  Radius.circular(Dimensions.largeRadius30),
                            )),
                            onTap: () {
                              BlocProvider.of<MainRouteBloc>(context)
                                .add(
                                    CollapsePlanSelectorExpandLimitSelectorSheetEvent(state.selectedVal));
                              Navigator.pop(context);
                            },
                            trailing: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: AppColors.white,
                            ),
                            title: Text(
                              'credit amount',
                              style: AppTextStyles.boldRoboto(
                                  FontSize.small, AppColors.color707070),
                            ),
                            subtitle: Text(
                              RupeeFormatter.indianRupeesFormat.format(state.selectedVal),
                              style: AppTextStyles.boldRoboto(
                                  FontSize.subtitle, AppColors.color707070),
                            ),
                            tileColor: AppColors.color171922,
                          ),
                        ),
                      )
                    : Container(),
          ),
        );
      },
      listener: (context, state) {
        if (state is ExpandedPlanSelectorState) {
          displayLimitSelectorPersistentBottomSheet(state.selectedVal);
        }
      },
      buildWhen: (prev, curr) =>
          curr is ExpandedLimitSelectorState ||
          curr is CollapsedLimitSelectorState,
    );
  }
}
