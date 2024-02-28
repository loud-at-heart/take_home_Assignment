import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:take_home_assignment/components/app_button_widget.dart';
import 'package:take_home_assignment/components/scroll_behaviour.dart';
import 'package:take_home_assignment/navigation/routes.dart';
import 'package:take_home_assignment/resources/strings/app_strings.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_dimens.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';
import 'package:take_home_assignment/style/spacing.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late PageController controller;
  int? _value = 2;
  List<String> choiceChipData = [
    "FUNDING",
    "TRACTION",
    "FINANCIALS",
    "COMPETITION"
  ];

  @override
  void initState() {
    controller = PageController(
      viewportFraction: 0.9,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorFBFBF6,
      appBar: AppBar(
        backgroundColor: AppColors.colorFBFBF6,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: Row(
          children: [
            BackButton(
              color: AppColors.color15803D,
              onPressed: () {},
            ),
            Expanded(
              child: Text(
                AppStrings.backToDeals,
                style: AppTextStyles.medium(
                  FontSize.normal,
                  AppColors.color15803D,
                ),
              ),
            ),
          ],
        ),
        leadingWidth: 150,
      ),
      body: ScrollConfiguration(
        behavior: BottomSheetBehavior(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLogo(),
              Spacing.sizeBoxHt12,
              _buildDesc(),
              Spacing.sizeBoxHt24,
              _buildDescTable(),
              Spacing.sizeBoxHt24,
              ..._buildPartners,
              _buildProductHighlight(context),
              ..._buildKeyMetrics,
              _buildDocuments,
              Spacing.sizeBoxHt124,
            ],
          ),
        ),
      ),
      floatingActionButton: _buildCTA(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildCTA() {
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
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(Spacing.margin16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.filled,
                  style: AppTextStyles.semiBold(
                    FontSize.tiny,
                    AppColors.color78716C,
                  ).copyWith(
                    letterSpacing: 1.2,
                  ),
                ),
                Spacing.sizeBoxHt6,
                Text(
                  "30%",
                  style: AppTextStyles.medium(
                    FontSize.subtitle,
                    AppColors.black,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          AppButtonWidget(
            width: 143,
            buttonColor: AppColors.color16A34A,
            margin: Spacing.margin16,
            borderRadius: Dimensions.radius12,
            text: "Tap to Invest",
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.paymentsScreen,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget get _buildDocuments {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Spacing.margin28,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.margin24,
            ),
            child: Text(
              AppStrings.documents,
              style: AppTextStyles.medium(
                FontSize.subtitle,
                AppColors.color44403C,
              ),
            ),
          ),
          Spacing.sizeBoxHt16,
          _buildDocumentCard(
            image: AppStrings.contract,
            title: AppStrings.contractTitle,
            subtitle: AppStrings.contractSub,
          ),
          Spacing.sizeBoxHt16,
          _buildDocumentCard(
            image: AppStrings.pitchDeck,
            title: AppStrings.pitchDeckTitle,
            subtitle: AppStrings.pitchDeckSub,
          )
        ],
      ),
    );
  }

  Widget _buildDocumentCard(
      {required String image,
      required String title,
      required String subtitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.margin24,
      ),
      child: Container(
        padding: EdgeInsets.all(Spacing.margin16),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.colorE7E5E4,
          ),
          borderRadius: BorderRadius.circular(Spacing.margin8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              image,
            ),
            Spacing.sizeBoxHt16,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.medium(
                          FontSize.normal,
                          AppColors.color44403C,
                        ),
                      ),
                      Spacing.sizeBoxHt8,
                      Text(
                        subtitle,
                        style: AppTextStyles.regular(
                            FontSize.normal, AppColors.color78716C,
                            height: 1.5),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(Spacing.margin8),
                  child: Icon(
                    Icons.arrow_circle_down_rounded,
                    color: AppColors.color78716C,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> get _buildKeyMetrics {
    return [
      Divider(),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Spacing.margin28,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.margin24,
              ),
              child: Text(
                AppStrings.keyMetrics,
                style: AppTextStyles.medium(
                  FontSize.subtitle,
                  AppColors.color44403C,
                ),
              ),
            ),
            Spacing.sizeBoxHt16,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Spacing.sizeBoxWt24,
                  ...List.generate(
                    choiceChipData.length,
                    (int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: Spacing.margin6),
                        child: ChoiceChip(
                          padding: EdgeInsets.all(8),
                          label: Text(choiceChipData[index],
                              style: AppTextStyles.semiBold(
                                FontSize.tiny,
                                _value == index
                                    ? AppColors.white
                                    : AppColors.color78716C,
                              )),
                          selectedColor: AppColors.color15803D,
                          backgroundColor: AppColors.colorE7E5E4,
                          selected: _value == index,
                          onSelected: (bool selected) {
                            setState(() {
                              _value = selected ? index : null;
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              Spacing.margin4,
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList()
                ],
              ),
            ),
            Spacing.sizeBoxHt16,
            _buildMetricsTable(),
          ],
        ),
      ),
      Divider(),
    ];
  }

  Widget _buildProductHighlight(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.margin24,
        vertical: Spacing.margin28,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.highlights,
            style: AppTextStyles.medium(
              FontSize.subtitle,
              AppColors.color44403C,
            ),
          ),
          Spacing.sizeBoxHt16,
          AspectRatio(
              aspectRatio: 300 / 173,
              child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: PageView(
                  controller: controller,
                  scrollBehavior: BottomSheetBehavior(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: Spacing.margin16,
                      ),
                      child: _buildHighlights(),
                    ),
                    _buildHighlights(),
                  ],
                ),
              )),
          Spacing.sizeBoxHt16,
        ],
      ),
    );
  }

  Widget _buildHighlights() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Spacing.margin8,
          ),
          border: Border.all(color: AppColors.colorE7E5E4)),
      padding: EdgeInsets.all(
        Spacing.margin16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            AppStrings.tip,
          ),
          Spacing.sizeBoxHt16,
          Text(
            AppStrings.cardData,
            style: AppTextStyles.regular(
              FontSize.subtitle,
              AppColors.color78716C,
              height: 1.5,
            ),
          )
        ],
      ),
    );
  }

  List<Widget> get _buildPartners => [
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.margin24,
            vertical: Spacing.margin16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.clients,
                style: AppTextStyles.medium(
                  FontSize.subtitle,
                  AppColors.color44403C,
                ),
              ),
              Spacing.sizeBoxHt8,
              SvgPicture.asset(
                AppStrings.partners,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.margin24,
            vertical: Spacing.margin16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.backedBy,
                style: AppTextStyles.medium(
                  FontSize.subtitle,
                  AppColors.color44403C,
                ),
              ),
              Spacing.sizeBoxHt8,
              SvgPicture.asset(
                AppStrings.partners,
              ),
            ],
          ),
        ),
        Spacing.sizeBoxHt16,
        Divider(),
      ];

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.margin24,
      ),
      child: SvgPicture.asset(
        AppStrings.agrizyLogo,
      ),
    );
  }

  Widget _buildDesc() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.margin24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: AppTextStyles.semiBold(
                FontSize.title,
                AppColors.color152420,
              ),
              children: [
                const TextSpan(
                  text: AppStrings.agrizy,
                ),
                WidgetSpan(
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: AppColors.color9D9D9D,
                    size: Spacing.margin22,
                  ),
                ),
                TextSpan(
                  text: AppStrings.keshavIndustries,
                  style: AppTextStyles.semiBold(
                    FontSize.title,
                    AppColors.color78716C,
                  ),
                ),
              ],
            ),
          ),
          Spacing.sizeBoxHt6,
          Text(
            AppStrings.productDesc,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.regular(FontSize.normal, AppColors.color78716C,
                height: 1.5),
          )
        ],
      ),
    );
  }

  Widget _buildDescTable() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.margin24,
      ),
      child: Container(
        color: Color(0xfff6f6f1),
        child: Table(
          border: TableBorder.all(
            width: 1.0,
            color: Color(0xffD6D3D1),
            borderRadius: BorderRadius.circular(
              Spacing.margin6,
            ),
          ),
          children: [
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(Spacing.margin16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.minInv,
                      style: AppTextStyles.semiBold(
                        FontSize.tiny,
                        AppColors.color78716C,
                      ).copyWith(
                        letterSpacing: 1.2,
                      ),
                    ),
                    Spacing.sizeBoxHt6,
                    RichText(
                      text: TextSpan(
                        style: AppTextStyles.medium(
                          FontSize.subtitle,
                          AppColors.black,
                        ),
                        children: [
                          TextSpan(
                            text: '₹ ',
                            style: AppTextStyles.medium(
                              FontSize.subtitle,
                              AppColors.black.withOpacity(0.4),
                            ),
                          ),
                          const TextSpan(
                            text: '1 ',
                          ),
                          TextSpan(
                            text: "Lakh",
                            style: AppTextStyles.medium(
                              FontSize.subtitle,
                              AppColors.black.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Spacing.margin16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.tenure,
                      style: AppTextStyles.semiBold(
                        FontSize.tiny,
                        AppColors.color78716C,
                      ).copyWith(
                        letterSpacing: 1.2,
                      ),
                    ),
                    Spacing.sizeBoxHt6,
                    RichText(
                      text: TextSpan(
                        style: AppTextStyles.medium(
                          FontSize.subtitle,
                          AppColors.black,
                        ),
                        children: [
                          const TextSpan(
                            text: '61 ',
                          ),
                          TextSpan(
                            text: "days",
                            style: AppTextStyles.medium(
                              FontSize.subtitle,
                              AppColors.black.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(Spacing.margin16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.netYield,
                      style: AppTextStyles.semiBold(
                        FontSize.tiny,
                        AppColors.color78716C,
                      ).copyWith(
                        letterSpacing: 1.2,
                      ),
                    ),
                    Spacing.sizeBoxHt6,
                    RichText(
                      text: TextSpan(
                        style: AppTextStyles.medium(
                          FontSize.subtitle,
                          AppColors.black,
                        ),
                        children: [
                          const TextSpan(
                            text: '13.23 ',
                          ),
                          TextSpan(
                            text: "%",
                            style: AppTextStyles.medium(
                              FontSize.subtitle,
                              AppColors.black.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Spacing.margin16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.raised,
                      style: AppTextStyles.semiBold(
                        FontSize.tiny,
                        AppColors.color78716C,
                      ).copyWith(
                        letterSpacing: 1.2,
                      ),
                    ),
                    Spacing.sizeBoxHt6,
                    RichText(
                      text: TextSpan(
                        style: AppTextStyles.medium(
                          FontSize.subtitle,
                          AppColors.black,
                        ),
                        children: [
                          const TextSpan(
                            text: '70 ',
                          ),
                          TextSpan(
                            text: "%",
                            style: AppTextStyles.medium(
                              FontSize.subtitle,
                              AppColors.black.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricsTable() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.margin24,
      ),
      child: Container(
        color: Color(0xfff6f6f1),
        child: Table(
          border: TableBorder.all(
            width: 1.0,
            color: Color(0xffD6D3D1),
            borderRadius: BorderRadius.circular(
              Spacing.margin6,
            ),
          ),
          children: [
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(Spacing.margin16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.activeDeals,
                      style: AppTextStyles.semiBold(
                        FontSize.tiny,
                        AppColors.color78716C,
                      ).copyWith(
                        letterSpacing: 1.2,
                      ),
                    ),
                    Spacing.sizeBoxHt6,
                    RichText(
                      text: TextSpan(
                        style: AppTextStyles.medium(
                          FontSize.subtitle,
                          AppColors.black,
                        ),
                        children: [
                          const TextSpan(
                            text: '6 ',
                          ),
                          TextSpan(
                            text: "of 18",
                            style: AppTextStyles.medium(
                              FontSize.subtitle,
                              AppColors.black.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Spacing.margin16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.raised,
                      style: AppTextStyles.semiBold(
                        FontSize.tiny,
                        AppColors.color78716C,
                      ).copyWith(
                        letterSpacing: 1.2,
                      ),
                    ),
                    Spacing.sizeBoxHt6,
                    RichText(
                      text: TextSpan(
                        style: AppTextStyles.medium(
                          FontSize.subtitle,
                          AppColors.black,
                        ),
                        children: [
                          TextSpan(
                            text: '₹ ',
                            style: AppTextStyles.medium(
                              FontSize.subtitle,
                              AppColors.black.withOpacity(0.4),
                            ),
                          ),
                          const TextSpan(
                            text: '6.94 ',
                          ),
                          TextSpan(
                            text: "Cr",
                            style: AppTextStyles.medium(
                              FontSize.subtitle,
                              AppColors.black.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(Spacing.margin16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.maturedDeals,
                      style: AppTextStyles.semiBold(
                        FontSize.tiny,
                        AppColors.color78716C,
                      ).copyWith(
                        letterSpacing: 1.2,
                      ),
                    ),
                    Spacing.sizeBoxHt6,
                    RichText(
                      text: TextSpan(
                        style: AppTextStyles.medium(
                          FontSize.subtitle,
                          AppColors.black,
                        ),
                        children: [
                          const TextSpan(
                            text: '12 ',
                          ),
                          TextSpan(
                            text: "of 18",
                            style: AppTextStyles.medium(
                              FontSize.subtitle,
                              AppColors.black.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Spacing.margin16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.onTimePayments,
                      style: AppTextStyles.semiBold(
                        FontSize.tiny,
                        AppColors.color78716C,
                      ).copyWith(
                        letterSpacing: 1.2,
                      ),
                    ),
                    Spacing.sizeBoxHt6,
                    RichText(
                      text: TextSpan(
                        style: AppTextStyles.medium(
                          FontSize.subtitle,
                          AppColors.black,
                        ),
                        children: [
                          const TextSpan(
                            text: '100 ',
                          ),
                          TextSpan(
                            text: "%",
                            style: AppTextStyles.medium(
                              FontSize.subtitle,
                              AppColors.black.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
