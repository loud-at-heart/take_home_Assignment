import 'package:take_home_assignment/style/app_colors.dart';
import 'package:flutter/material.dart';

class DotWidget extends StatelessWidget {
  final int? _currentPageIndex;
  final int _index;
  final bool useExtendedWidth;

  const DotWidget(
      this._currentPageIndex,
      this._index, {
        this.useExtendedWidth = true,
      });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 8),
      height: 6,
      width: _currentPageIndex == _index && useExtendedWidth
          ? 16
          : 6,
      decoration: BoxDecoration(
        color: _currentPageIndex == _index
            ?AppColors.greyLite
            : AppColors.colorD0D0D0,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class DotGroupWidget extends StatelessWidget {
  final int? currentPageIndex;
  final int? totalDots;
  final bool useExtendedWidth;

  const DotGroupWidget({
    this.currentPageIndex,
    this.totalDots,
    this.useExtendedWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = List<Widget>.generate(
        totalDots!,
            (index) => DotWidget(
          currentPageIndex,
          index,
          useExtendedWidth: useExtendedWidth,
        ));
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widgets,
      ),
    );
  }
}
