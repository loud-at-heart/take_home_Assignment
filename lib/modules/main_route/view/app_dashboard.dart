import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_assignment/components/app_button.dart';
import 'package:take_home_assignment/modules/main_route/view/limit_selector.dart';
import 'package:take_home_assignment/modules/main_route/bloc/main_route_bloc.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_dimens.dart';

class AppDashboard extends StatefulWidget {
  const AppDashboard({Key? key}) : super(key: key);

  @override
  State<AppDashboard> createState() => _AppDashboardState();
}

class _AppDashboardState extends State<AppDashboard> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  void displayLimitSelectorPersistentBottomSheet() {
    _scaffoldKey.currentState?.showBottomSheet<void>(
          (BuildContext context) {
        return GestureDetector(
          onVerticalDragStart: (_) {},
          child: LimitSelector(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    displayLimitSelectorPersistentBottomSheet();
                  },
                  child: Text('Show Stack Sheet'))
            ],
          ),
        ),
      ),
    );;
  }
}
