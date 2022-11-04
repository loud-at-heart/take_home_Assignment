import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:take_home_assignment/models/weather_data.dart';

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
}

class WeatherUtils {
  WeatherUtils._();

  static String get APPID => '82f222e0183fd53e4b0659126b2db31b';

  static String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  static String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  static String getWeatherWall(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  static List<WeatherData> getAverageWeatherData(List<WeatherData> rawData) {
    List<WeatherData> res = [];
    int lengthOfBatch = 0;
    int daysToConsider = 4;
    int daysConsidered = 0;
    double avgTemp = 0.0;
    int avgCondition = 0;
    int dayRecorded = DateTime.now().day;
    for (int i = 0; i < rawData.length; i++) {
      DateTime formattedTime = timestamp2DateTime(rawData[i].date);
      if (daysConsidered != daysToConsider && formattedTime.day >= dayRecorded) {
        if (formattedTime.day == dayRecorded) {
          lengthOfBatch = lengthOfBatch + 1;
          avgTemp += rawData[i].temp;
          avgCondition += rawData[i].condition ?? 0;
        } else {
          daysConsidered = daysConsidered + 1;
          avgCondition = (avgCondition / lengthOfBatch).round();
          avgTemp = (avgTemp / lengthOfBatch).toPrecision(2);
          dayRecorded = formattedTime.day;
          res.add(
            WeatherData(
              name: rawData[i].name,
              temp: avgTemp,
              main: rawData[i].main,
              icon: rawData[i].icon,
              condition: avgCondition,
              date: rawData[i].date,
            ),
          );
          avgCondition = 0;
          avgTemp = 0.0;
          lengthOfBatch = 0;
        }
      }
    }
    return res;
  }

  static Future<bool> internetConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static suffixFormat({
    required DateTime date,
    required String formatBeforeSuffix,
    required String formatAfterSuffix,
  }) {
    var suffix = "th";
    var digit = date.day % 10;
    if ((digit > 0 && digit < 4) && (date.day < 11 || date.day > 13)) {
      suffix = ["st", "nd", "rd"][digit - 1];
    }
    return new DateFormat(formatBeforeSuffix + suffix + formatAfterSuffix)
        .format(date);
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
