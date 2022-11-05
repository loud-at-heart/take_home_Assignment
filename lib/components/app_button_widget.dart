import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_text_styles.dart';

class AppButtonWidget extends StatelessWidget {
  AppButtonWidget({
    this.textStyle = const TextStyle(
        fontFamily: AppFontFamilies.Poppins,
        color: AppColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16.0),
    this.text = '',
    this.width = double.infinity,
    this.height = 50,
    this.onPressed,
    this.borderRadius = 0.0,
    this.ignoreCondition = false,
    this.margin = 0,
    this.padding = 0,
    this.buttonColor,
    this.decoration,
    this.textAlign = TextAlign.left,
    this.borderColor = AppColors.transparent,
  });

  final double height;
  final double width;
  final bool ignoreCondition;
  final double borderRadius;
  final Color borderColor;
  final Function? onPressed;
  final String text;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final Color? buttonColor;
  final double margin;
  final double padding;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      padding: EdgeInsets.all(padding),
      height: height,
      width: width,
      decoration: decoration,
      child: IgnorePointer(
        ignoring: ignoreCondition,
        child: MaterialButton(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                borderRadius,
              ),
              side: BorderSide(color: borderColor)),
          onPressed: onPressed as void Function()?,
          child: Text(
            text,
            style: textStyle,
            textAlign: textAlign,
          ),
          color: buttonColor,
        ),
      ),
    );
  }
}
