import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_assignment/components/app_button.dart';
import 'package:take_home_assignment/components/dot_widget.dart';
import 'package:take_home_assignment/modules/main_route/bloc/main_route_bloc.dart';
import 'package:take_home_assignment/resources/strings/app_strings.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_dimens.dart';
import 'package:take_home_assignment/style/app_dimens.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';
import 'package:take_home_assignment/style/spacing.dart';
import 'package:take_home_assignment/utils/utils.dart';

class PlanSelector extends StatefulWidget {
  const PlanSelector({
    Key? key,
    required this.stackHeight,
    this.selectedVal,
  }) : super(key: key);
  final double stackHeight;
  final double? selectedVal;

  @override
  State<PlanSelector> createState() => _PlanSelectorState();
}

class _PlanSelectorState extends State<PlanSelector> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final List<_PlanArticle> _articles = [];
  int _currentPage = 0;
  int? _selectedIndex;
  _PlanArticle? _article;
  PageController? _pageController;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 0.5,
      initialPage: 0,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _articles.addAll(
      [
        //TODO add images when provided
        _PlanArticle(
          emi: (widget.selectedVal ?? 0.0) / 12,
          month: 12,
          color: HexColor('#43343D'),
        ),
        _PlanArticle(
          emi: (widget.selectedVal ?? 0.0) / 9,
          month: 9,
          color: Colors.grey.shade400,
        ),
        _PlanArticle(
          emi: (widget.selectedVal ?? 0.0) / 6,
          month: 6,
          color: Colors.blueGrey,
        ),
        _PlanArticle(
            emi: (widget.selectedVal ?? 0.0) / 3, month: 3, color: Colors.grey),
      ],
    );
  }

  void displayLimitSelectorPersistentBottomSheet() {
    _scaffoldKey.currentState?.showBottomSheet<void>(
      (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black)),
              color: Colors.red),
          child: Padding(
            padding: const EdgeInsets.all(120.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Show BottomSheet'),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainRouteBloc, MainRouteState>(
      builder: (context, state) {
        return DecoratedBox(
          decoration: BoxDecoration(color: AppColors.color171922),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(Dimensions.largeRadius30),
              topLeft: Radius.circular(Dimensions.largeRadius30),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: widget.stackHeight,
              child: Scaffold(
                key: _scaffoldKey,
                backgroundColor: AppColors.color171922,
                body: state is ExpandedPlanSelectorState
                    ? Stack(
                        children: [
                          SizedBox.expand(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.color1A1C29,
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: Spacing.margin24,
                                  vertical: Spacing.margin40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'how do you wish to repay ${RupeeFormatter.indianRupeesFormat.format(widget.selectedVal)}?',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.boldRoboto(
                                      FontSize.title,
                                      AppColors.white,
                                    ),
                                  ),
                                  Spacing.sizeBoxHt24,
                                  AspectRatio(
                                    aspectRatio: 65 / 48,
                                    child: OverflowBox(
                                      maxWidth:
                                          MediaQuery.of(context).size.width,
                                      child: PageView.builder(
                                        itemCount: _articles.length,
                                        itemBuilder: (context, i) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: Spacing.margin12,
                                              horizontal: Spacing.margin6),
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _selectedIndex = i;
                                                _article = _articles[i];
                                              });
                                            },
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                    Dimensions.largeRadius20,
                                                  ),
                                                ),
                                              ),
                                              color: _articles[i].color,
                                              child: Padding(
                                                padding: EdgeInsets.all(Spacing.margin16),
    child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Spacer(),
                                                  if (_selectedIndex == i)...
                                                    [Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(
                                                            Dimensions
                                                                .largeRadius100,
                                                          ),
                                                        ),
                                                      ),
                                                      color: AppColors.black,
                                                      child: Icon(
                                                        Icons.check,
                                                        color:
                                                            AppColors.green20,
                                                        size: 20,
                                                      ),
                                                    ),Spacing.sizeBoxHt48],
                                                  RichText(
                                                    text: TextSpan(
                                                        text:
                                                            "${RupeeFormatter.indianRupeesFormat.format(_articles[i].emi)}",
                                                        style: AppTextStyles
                                                            .boldRoboto(
                                                                FontSize
                                                                    .large20,
                                                                AppColors
                                                                    .white),
                                                        children: [
                                                          TextSpan(
                                                              text: " / mo",
                                                              style: AppTextStyles
                                                                  .regularRoboto(
                                                                      FontSize
                                                                          .normal,
                                                                      AppColors
                                                                          .greyLite))
                                                        ]),
                                                  ),
                                                  Text(
                                                    'for ${_articles[i].month} months',
                                                    style: AppTextStyles
                                                        .mediumRoboto(
                                                      FontSize.title,
                                                      AppColors.greyLite,
                                                    ),
                                                  ),
                                                  Spacing.sizeBoxHt32
                                                ],
                                              ),
),
                                            ),
                                          ),
                                        ),
                                        controller: _pageController,
                                        onPageChanged: (value) {
                                          setState(() {
                                            _currentPage = value;
                                          });
                                        },
                                        scrollBehavior: BottomSheetBehavior(),
                                      ),
                                    ),
                                  ),
                                  Spacing.sizeBoxHt2,
                                  DotGroupWidget(
                                    totalDots: _articles.length,
                                    currentPageIndex: _currentPage,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: AppButton(
                                onTap: () {
                                  // BlocProvider.of<MainRouteBloc>(context)
                                  //   ..add(
                                  //       ExpandPlanSelectorCollapseLimitSelectorSheetEvent());
                                },
                                content: Text(
                                  AppStrings.planSelectionCta,
                                  style: AppTextStyles.boldRoboto(
                                    FontSize.subtitle,
                                    AppColors.white,
                                  ),
                                )),
                          ),
                        ],
                      )
                    : (state is CollapsedLimitSelectorState)
                        ? GestureDetector(
                            onTap: () {},
                            child: Container(),
                          )
                        : Container(),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is ExpandedPlanSelectorState)
          displayLimitSelectorPersistentBottomSheet();
      },
    );
  }
}

class _PlanArticle {
  final double? emi;
  final int? month;
  final Color? color;

  _PlanArticle({
    this.emi,
    this.month,
    this.color,
  });
}

class BottomSheetBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
