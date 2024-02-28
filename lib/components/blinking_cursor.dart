import 'package:flutter/material.dart';
import 'package:take_home_assignment/style/app_colors.dart';

class BlinkingCursor extends StatefulWidget {
  final int interval;

  BlinkingCursor({this.interval = 500});

  @override
  _BlinkingCursorState createState() => _BlinkingCursorState();
}

class _BlinkingCursorState extends State<BlinkingCursor>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _currentWidget = 0;

  List<Widget> children = [
    Container(
      height: 31,
      width: 2.5,
      color: AppColors.black,
    ),
    Container(
      height: 31,
      width: 2.5,
    ),
  ];

  initState() {
    super.initState();

    _controller = new AnimationController(
      duration: Duration(milliseconds: widget.interval),
      vsync: this,
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          if (++_currentWidget == children.length) {
            _currentWidget = 0;
          }
        });

        _controller.forward(from: 0.0);
      }
    });

    _controller.forward();
  }

  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: children[_currentWidget],
    );
  }
}
