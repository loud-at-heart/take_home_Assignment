import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:take_home_assignment/navigation/routes.dart';
import 'package:take_home_assignment/resources/images/app_images.dart';
import 'package:take_home_assignment/style/spacing.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(
        context,
        Routes.mainScreen,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.splashImage),
            Spacing.sizeBoxHt58,
            SvgPicture.asset(AppImages.splashTitle),
          ],
        ),
      ),
    );
  }
}
