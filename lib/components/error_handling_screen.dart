import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/strings/app_strings.dart';
import '../style/app_colors.dart';
import '../style/app_text_styles.dart';
import '../style/spacing.dart';
import 'app_button_widget.dart';

class ErrorHandlingScreen extends StatefulWidget {
  const ErrorHandlingScreen(
      {Key? key, required this.errorHandlingType, this.onButtonPressed})
      : super(key: key);
  final ErrorHandlingEnum errorHandlingType;
  final VoidCallback? onButtonPressed;

  @override
  State<ErrorHandlingScreen> createState() => _ErrorHandlingScreenState();
}

class _ErrorHandlingScreenState extends State<ErrorHandlingScreen> {
  Map<ErrorHandlingEnum, _ErrorArticle> _articles = {};

  void _buttonHandler() => widget.onButtonPressed!.call();

  @override
  void initState() {
    _articles = {
      ErrorHandlingEnum.SERVER_DOWN: _ErrorArticle(
        title: AppStrings.serverDownTitle,
        subtitle: AppStrings.serverDownSub,
        buttonText: AppStrings.serverDownTitle,
        image: AppStrings.serverNotWorking,
      ),
      ErrorHandlingEnum.NO_INTERNET: _ErrorArticle(
        title: AppStrings.noInternetTitle,
        subtitle: AppStrings.noInternetSub,
        buttonText: AppStrings.noInternetButtonText,
        image: AppStrings.lostConnection,
      ),
      ErrorHandlingEnum.ERROR: _ErrorArticle(
        title: AppStrings.somethingWentWrongText,
        subtitle: AppStrings.errorSub,
        image: AppStrings.somethingWentWrong,
        isButtonReqd: false,
      ),
      ErrorHandlingEnum.NO_PERMISSION: _ErrorArticle(
        title: AppStrings.permissionDeniedDialogTitle,
        subtitle: AppStrings.permissionDeniedDialogSubtitle,
        buttonText: AppStrings.permissionDeniedDialogGoToSettings,
      )
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.onButtonPressed?.call();
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            Spacer(),
            if ((_articles[widget.errorHandlingType]?.image ?? "")
                .isNotEmpty) ...[
              SvgPicture.asset(
                  _articles[widget.errorHandlingType]?.image ?? ""),
              Spacing.sizeBoxHt62,
            ],
            Text(
              _articles[widget.errorHandlingType]?.title ?? "",
              style: AppTextStyles.bold(
                FontSize.large22,
                AppColors.color191919,
              ),
            ),
            Spacing.sizeBoxHt24,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.margin24,
              ),
              child: Text(
                _articles[widget.errorHandlingType]?.subtitle ?? "",
                style: AppTextStyles.regular(
                  FontSize.subtitle,
                  AppColors.color737373,
                ),
              ),
            ),
            if (_articles[widget.errorHandlingType]!.isButtonReqd) ...[
              SizedBox(
                height: 96,
              ),
              AppButtonWidget(
                buttonColor: AppColors.color9E45EC,
                textStyle: AppTextStyles.bold(
                  16,
                  AppColors.white,
                ),
                borderRadius: 12,
                margin: Spacing.defaultMargin,
                text: _articles[widget.errorHandlingType]!.buttonText!,
                onPressed: () {
                  _buttonHandler.call();
                },
              ),
              SizedBox(
                height: 48,
              ),
            ] else ...[
              SizedBox(
                height: 192,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ErrorArticle {
  _ErrorArticle({
    this.image,
    this.title,
    this.subtitle,
    this.isButtonReqd = true,
    this.buttonText,
  });

  final String? image;
  final String? title;
  final String? subtitle;
  final String? buttonText;
  final bool isButtonReqd;
}

enum ErrorHandlingEnum {
  NO_INTERNET,
  SERVER_DOWN,
  ERROR,
  NO_PERMISSION,
}
