import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:take_home_assignment/models/news_model.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';
import 'package:take_home_assignment/style/spacing.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.model});

  final NewsModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: BackButton(
          color: AppColors.black,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.margin24,
              vertical: Spacing.margin16,
            ),
            child: Text(
              model.title ?? '',
              style: AppTextStyles.bold(
                FontSize.title,
                AppColors.color191919,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.margin24,
            ),
            child: Text(
              model.body ?? '',
              style: AppTextStyles.regular(
                FontSize.normal,
                AppColors.color737373,
              ),
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
