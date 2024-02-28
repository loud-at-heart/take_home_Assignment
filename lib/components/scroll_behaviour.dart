import 'package:flutter/material.dart';

class BottomSheetBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context,
      Widget child,
      ScrollableDetails scrollableDetails,
      ) {
    return child;
  }
}
