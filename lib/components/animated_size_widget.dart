import 'package:flutter/widgets.dart';

class AnimatedSizeWidget extends StatefulWidget {
  const AnimatedSizeWidget({
    Key? key,
    required this.child,
    required this.duration,
  }) : super(key: key);
  final Widget child;
  final Duration duration;

  @override
  _AnimatedSizeWidgetState createState() => _AnimatedSizeWidgetState();
}

class _AnimatedSizeWidgetState extends State<AnimatedSizeWidget>
    with TickerProviderStateMixin {
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: widget.duration,
      child: widget.child,
      curve: Curves.bounceInOut,
    );
  }
}