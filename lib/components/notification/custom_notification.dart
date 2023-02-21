import 'package:flutter/material.dart';
import 'package:take_home_assignment/style/app_colors.dart';

class CustomNotification {
  CustomNotification();

  static void notify(
      BuildContext context, NotificationType type, String message) {
    Color color = AppColors.lightBlack;
    switch (type) {
      case NotificationType.error:
        color = AppColors.dangerColor;
        break;
      case NotificationType.success:
        color = AppColors.successColor;
        break;
      case NotificationType.info:
        color = AppColors.lightBlack;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: color,
        content: Text(
          message,
          style: Theme.of(context)
              .snackBarTheme
              .contentTextStyle
              ?.copyWith(color: AppColors.white),
        )));
  }
}

enum NotificationType {
  error,
  success,
  info,
}
