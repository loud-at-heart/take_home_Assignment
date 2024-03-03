import 'package:flutter/material.dart';
import 'package:take_home_assignment/modules/main_route/view/limit_selector.dart';

class AppDashboard extends StatefulWidget {
  const AppDashboard({Key? key}) : super(key: key);

  @override
  State<AppDashboard> createState() => _AppDashboardState();
}

class _AppDashboardState extends State<AppDashboard> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void displayLimitSelectorPersistentBottomSheet() {
    _scaffoldKey.currentState?.showBottomSheet<void>(
      (BuildContext context) {
        return GestureDetector(
          onVerticalDragStart: (_) {},
          child: const LimitSelector(),
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
                  child: const Text('Show Stack Sheet'))
            ],
          ),
        ),
      ),
    );
  }
}
