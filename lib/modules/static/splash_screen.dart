import 'dart:async';

import 'package:flutter/material.dart';
import 'package:take_home_assignment/navigation/routes.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';
import 'package:take_home_assignment/utils/utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;
  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeIn);
    controller?.forward();
    Timer(
        const Duration(seconds: 3),
        () async => await NewsUtils.internetConnectivity()
            ? Navigator.pushReplacementNamed(
                context,
                Routes.mainScreen,
              )
            : Navigator.pushReplacementNamed(
                context,
                Routes.noInternet,
              ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          height: double.infinity,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FadeTransition(
                opacity: animation!,
                child: Hero(
                  tag: 'Flutter',
                  child: Center(
                    child: Image.asset('assets/icon/tap_invest.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
