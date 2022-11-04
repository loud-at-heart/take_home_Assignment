import 'dart:async';

import 'package:flutter/material.dart';
import 'package:take_home_assignment/navigation/routes.dart';

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
            ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 300,
          textColor: Colors.blue,
          style: FlutterLogoStyle.stacked,
        ),
      ),
    );
  }
}
