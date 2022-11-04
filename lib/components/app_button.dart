import 'package:flutter/material.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_dimens.dart';
import 'package:take_home_assignment/style/spacing.dart';

class AppButton extends StatelessWidget {
  const AppButton({Key? key, required this.content, this.onTap})
      : super(key: key);
  final Widget content;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          print('Tapped');
          onTap?.call();
        },
        child: AspectRatio(
          aspectRatio: MediaQuery.of(context).size.width / 72,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.largeRadius20),
                topLeft: Radius.circular(Dimensions.largeRadius20),
              ),
            ),
            child: Center(
              child: content,
            ),
          ),
        ));
  }
}
