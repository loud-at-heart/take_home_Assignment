import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:take_home_assignment/components/i_potato_timer.dart';
import 'package:take_home_assignment/generated/l10n.dart';
import 'package:take_home_assignment/models/i_timer_model.dart';
import 'package:take_home_assignment/stores/dashboard/timer_card_store.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_dimens.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';
import 'package:take_home_assignment/style/spacing.dart';

class TimerCard extends StatefulWidget {
  const TimerCard({
    Key? key,
    this.timerModel,
    this.onStop,
  }) : super(key: key);

  final ITimerModel? timerModel;
  final VoidCallback? onStop;

  @override
  State<TimerCard> createState() => _TimerCardState();
}

class _TimerCardState extends State<TimerCard> {
  late TimerCardStore _timerCardStore;

  @override
  void initState() {
    _timerCardStore = TimerCardStore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      key: UniqueKey(),
      color: AppColors.timerCardColor,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.largeRadius20),
      ),
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          Spacing.sizeBoxHt25,
          Observer(builder: (context) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Spacing.defaultMargin),
              child: IPotatoTimer(
                timerModel: widget.timerModel,
                onStop: widget.onStop,
                onFinished: () async {
                  await _timerCardStore.finishedTimer(widget.timerModel!);
                },
                isFinished: _timerCardStore.isFinished,
              ),
            );
          }),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: Spacing.defaultMargin),
            child: ListTile(
              title: Text(
                widget.timerModel?.title ?? '',
                style: AppTextStyles.regular(
                  FontSize.large22,
                  AppColors.timerTitleColor,
                  height: 1.3,
                ),
              ),
              subtitle: Text(
                widget.timerModel?.subtitle ?? '',
                style: AppTextStyles.regular(
                  FontSize.normal,
                  AppColors.timerSubtitleColor,
                  height: 1.3,
                ),
              ),
            ),
          ),
          Observer(builder: (context) {
            return _timerCardStore.isFinished
                ? InkWell(
                    child: Container(
                      height: Spacing.margin40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.largeRadius20),
                        color: AppColors.buttonColor,
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context).markComplete,
                          style: AppTextStyles.medium(
                              FontSize.normal, AppColors.color191919),
                        ),
                      ),
                    ),
                    onTap: widget.onStop,
                  )
                : Spacing.sizeBoxHt25;
          }),
        ],
      ),
    );
  }
}
