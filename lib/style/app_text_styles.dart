import 'package:flutter/material.dart';

class AppFontFamilies {
  static const String Montserrat = "Montserrat";
  static const String Poppins = "Poppins";
  static const String Roboto = "Roboto";
  static const String SpartanMB = "Spartan MB";
}

class AppTextStyles {

  static TextStyle regular(double textFont, Color textColor,
      {double? height}) {
    return TextStyle(
      fontSize: textFont,
      fontWeight: AppFontWeight.normal,
      color: textColor,
      height: height ?? 1.0,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle medium(double textFont, Color textColor) {
    return TextStyle(
      fontSize: textFont,
      fontWeight: AppFontWeight.medium,
      color: textColor,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle bold(double textFont, Color textColor,
      {double? height}) {
    return TextStyle(
      fontSize: textFont,
      fontWeight: AppFontWeight.bold,
      color: textColor,
      decoration: TextDecoration.none,
      height: height ?? 1.0,
    );
  }
}

class AppFontWeight {
  static const normal = FontWeight.normal;
  static const medium = FontWeight.w500;
  static const semiBold = FontWeight.w600;
  static const bold = FontWeight.bold;
}

class FontSize {
  static const double large100 = 100.0;
  static const double large60 = 60.0;
  static const double large48 = 48.0;
  static const double large40 = 40.0;
  static const double large30 = 30.0;
  static const double large36 = 36.0;
  static const double large32 = 32.0;
  static const double large28 = 28.0;
  static const double large22 = 22;
  static const double large20 = 20;
  static const double large24 = 24;
  static const double large = 20;
  static const double title = 18;
  static const double subtitle = 16;
  static const double normal = 14;
  static const double medium = 13;
  static const double small = 12;
  static const double tiny = 10;
  static const double small9 = 9;
  static const double small8 = 8;
  static const double small6 = 6;
  static const double small5 = 5;
  static const double small4 = 4;
}