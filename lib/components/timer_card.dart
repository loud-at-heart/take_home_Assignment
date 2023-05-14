import 'package:flutter/material.dart';
import 'package:take_home_assignment/components/i_potato_timer.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_dimens.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';
import 'package:take_home_assignment/style/spacing.dart';

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
