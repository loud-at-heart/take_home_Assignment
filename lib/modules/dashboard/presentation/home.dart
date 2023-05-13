import 'package:flutter/material.dart';
import 'package:take_home_assignment/components/i_potato_timer.dart';
import 'package:take_home_assignment/components/scroll_behaviour.dart';
import 'package:take_home_assignment/generated/l10n.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_dimens.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';
import 'package:take_home_assignment/style/spacing.dart';

class TimerHome extends StatelessWidget {
  TimerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(124.0),
        child: AppBar(
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(
              left: Spacing.margin32,
              bottom: Spacing.margin12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).homeTitle,
                  style: AppTextStyles.regular(
                    FontSize.large32,
                    AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Spacing.margin32,
        ),
        child: ScrollConfiguration(
          behavior: BottomSheetBehavior(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Spacing.sizeBoxHt10,
                TimerCard(),
                TimerCard(),
                TimerCard(),
                TimerCard(),
                TimerCard(),
                TimerCard(),
                TimerCard(),
                TimerCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimerCard extends StatefulWidget {
  const TimerCard({
    Key? key,
  }) : super(key: key);

  @override
  State<TimerCard> createState() => _TimerCardState();
}

class _TimerCardState extends State<TimerCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.timerCardColor,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.largeRadius20),
      ),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.defaultMargin),
        child: Column(
          children: [
            Spacing.sizeBoxHt25,
            IPotatoTimer(),
            ListTile(
              title: Text(
                'Egg Boiling',
                style: AppTextStyles.regular(
                  FontSize.large22,
                  AppColors.timerTitleColor,
                  height: 1.3,
                ),
              ),
              subtitle: Text(
                'Need to take out the egg from the boiler when this timer ends',
                style: AppTextStyles.regular(
                  FontSize.normal,
                  AppColors.timerSubtitleColor,
                  height: 1.3,
                ),
              ),
            ),
            Spacing.sizeBoxHt25,
          ],
        ),
      ),
    );
  }
}
