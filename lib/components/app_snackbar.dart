import 'package:flutter/material.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_dimens.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';
import 'package:take_home_assignment/style/spacing.dart';

class AppSnackBar {
  factory AppSnackBar() => _instance;

  AppSnackBar._();

  static final AppSnackBar _instance = AppSnackBar._();

  void showSnackBar(
    BuildContext context, {
    String? text,
    SnackBarAction? snackBarAction,
    ValueSetter<SnackBarClosedReason>? onComplete,
    Duration snackbarDuration = const Duration(
      seconds: 5,
    ),
    EdgeInsetsGeometry? margin,
  }) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(
                  Icons.error_outline_rounded,
                  color: AppColors.white,
                ),
                Spacing.sizeBoxWt12,
                Expanded(
                  child: Text(
                    text ?? "",
                    style: AppTextStyles.medium(
                      FontSize.normal,
                      AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
            behavior: SnackBarBehavior.floating,
            margin: margin,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  Dimensions.radius12,
                ),
              ),
            ),
            action: snackBarAction,
            duration: snackbarDuration,
          ),
        )
        .closed
        .then((value) => onComplete);
  }
}
