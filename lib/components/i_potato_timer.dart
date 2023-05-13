import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:take_home_assignment/resources/images/app_images.dart';
import 'package:take_home_assignment/stores/dashboard/countdown_timer_store.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';
import 'package:take_home_assignment/style/spacing.dart';

class IPotatoTimer extends StatefulWidget {
  IPotatoTimer({
    Key? key,
  }) : super(key: key);

  @override
  State<IPotatoTimer> createState() => _IPotatoTimerState();
}

class _IPotatoTimerState extends State<IPotatoTimer> {
  //stores:---------------------------------------------------------------------
  final CountdownTimerStore _countdownTimerStore = CountdownTimerStore();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Provider(
      create: (_) => _countdownTimerStore,
      child: Observer(builder: (context) {
        return _countdownTimerStore.secondsRemaining != 0
            ? Row(
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
                      onTap: _countdownTimerStore.toggleTimer,
                      child: SvgPicture.asset(
                        _countdownTimerStore.isRunning
                            ? AppImages.iPause
                            : AppImages.iPlay,
                      ),
                    );
                  }),
                  Spacing.sizeBoxWt8,
                  InkWell(
                    onTap: _countdownTimerStore.stopTimer,
                    child: SvgPicture.asset(
                      AppImages.iStop,
                    ),
                  ),
                ],
              )
            : Row(
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
      }),
    );
  }
}
