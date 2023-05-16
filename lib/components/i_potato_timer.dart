import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:take_home_assignment/models/i_timer_model.dart';
import 'package:take_home_assignment/resources/images/app_images.dart';
import 'package:take_home_assignment/stores/dashboard/countdown_timer_store.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';
import 'package:take_home_assignment/style/spacing.dart';

class IPotatoTimer extends StatefulWidget {
  IPotatoTimer({
    Key? key,
    this.timerModel,
    this.isFinished = false,
    this.onStop,
    this.onFinished,
  }) : super(key: key);

  final ITimerModel? timerModel;
  final bool isFinished;
  final VoidCallback? onStop;
  final VoidCallback? onFinished;

  @override
  State<IPotatoTimer> createState() => _IPotatoTimerState();
}

class _IPotatoTimerState extends State<IPotatoTimer> {
  //stores:---------------------------------------------------------------------
  final CountdownTimerStore _countdownTimerStore = CountdownTimerStore();

  @override
  void initState() {
    _countdownTimerStore.secondsRemaining = widget.timerModel?.second ?? 1;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return !widget.isFinished
          ? _countdownTimerStore.secondsRemaining != 0
              ? _buildTimerPanel()
              : _buildFinishedPanel()
          : _buildFinishedPanel();
    });
  }

  Widget _buildTimerPanel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Observer(builder: (context) {
          return Text(
            _countdownTimerStore.timerText,
            style: AppTextStyles.regular(
              FontSize.large32,
              AppColors.timerSubtitleColor,
            ),
          );
        }),
        Spacing.sizeBoxWt6,
        Observer(builder: (context) {
          return InkWell(
            onTap: () => _countdownTimerStore.toggleTimer(widget.timerModel),
            child: SvgPicture.asset(
              _countdownTimerStore.isRunning
                  ? AppImages.iPause
                  : AppImages.iPlay,
            ),
          );
        }),
        Spacing.sizeBoxWt8,
        InkWell(
          onTap: () => {
            _countdownTimerStore.stopTimer(widget.timerModel?.second ?? 0),
            widget.onStop?.call(),
          },
          child: SvgPicture.asset(
            AppImages.iStop,
          ),
        ),
      ],
    );
  }

  Widget _buildFinishedPanel() {
    if (_countdownTimerStore.secondsRemaining == 0) {
      widget.onFinished?.call();
    }
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(
          AppImages.iWave,
        ),
        Text(
          "Finished",
          style: AppTextStyles.regular(
            FontSize.large32,
            AppColors.timerSubtitleColor,
          ),
        ),
        SvgPicture.asset(
          AppImages.iWave,
        ),
      ],
    );
  }
}
