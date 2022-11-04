import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/weather_data.dart';
import '../style/app_colors.dart';
import '../style/app_text_styles.dart';
import '../utils/utils.dart';

class WeatherItem extends StatelessWidget {
  WeatherItem({Key? key, required this.weather}) : super(key: key);
  final WeatherData weather;

  DateTime get ts2DateTime => timestamp2DateTime(weather.date ?? 0);

  @override
  Widget build(BuildContext context) {
    DateFormat format = new DateFormat("MMM dd, yyyy");
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "${format.format(
                  timestamp2DateTime(weather.date),
                )}",
                style: new TextStyle(color: Colors.black)),
            Text(
              WeatherUtils.getWeatherIcon(
                weather.condition ?? 0,
              ),
              style: AppTextStyles.bold(
                FontSize.large32,
                AppColors.black,
                height: 1.5,
              ),
            ),
            Text('${weather.temp.toStringAsFixed(0)}°C',
                style: new TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
