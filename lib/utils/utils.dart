import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}

class RupeeFormatter {
  RupeeFormatter._();

  static NumberFormat indianRupeesFormat = NumberFormat.currency(
    name: "INR",
    locale: 'en_IN',
    decimalDigits: 0, // change it to get decimal places
    symbol: '₹',
  );

  static String moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d\d)+(\d)(?!\d))'), ',');
      return value;
    }
    return price;
  }
}

class NewsUtils {
  NewsUtils._();

  static Future<bool> internetConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}

bool isNullOrEmpty(String? str) {
  return str == null || str.isEmpty;
}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

DateTime timestamp2DateTime(dynamic date) =>
    DateTime.fromMillisecondsSinceEpoch((date as num).toInt() * 1000,
        isUtc: true);


class AppColorFilter {
  AppColorFilter._();

  static const ColorFilter disabledFilter = ColorFilter.matrix(<double>[
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ]);
}