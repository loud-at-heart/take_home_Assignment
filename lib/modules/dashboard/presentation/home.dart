import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:take_home_assignment/components/add_timer_dialog.dart';
import 'package:take_home_assignment/components/loading_widget.dart';
import 'package:take_home_assignment/components/timer_card.dart';
import 'package:take_home_assignment/di/components/di_initializer.dart';
import 'package:take_home_assignment/generated/l10n.dart';
import 'package:take_home_assignment/models/i_timer_model.dart';
import 'package:take_home_assignment/resources/images/app_images.dart';
import 'package:take_home_assignment/stores/dashboard/timer_list_store.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';
import 'package:take_home_assignment/style/spacing.dart';

class TimerHome extends StatefulWidget {
  TimerHome({Key? key}) : super(key: key);

  @override
  State<TimerHome> createState() => _TimerHomeState();
}

class _TimerHomeState extends State<TimerHome> {
  //stores:---------------------------------------------------------------------
  late TimerListStore _timerListStore;

  @override
  void initState() {
    _timerListStore = getIt.get<TimerListStore>();
    super.initState();
  }

  @override
  Future<void> didChangeDependencies() async {
    await _timerListStore.init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      floatingActionButton: _buildFab(context),
      body: _buildBody,
    );
  }

  PreferredSize _buildAppbar(BuildContext context) {
    return PreferredSize(
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
    );
  }

  Widget _buildFab(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (_timerListStore.timerList.length == 0 && !_timerListStore.isLoading)
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: Spacing.margin14,
                  ),
                  child:
                      Text(AppLocalizations.of(context).noTimerLabel),
                ),
                SvgPicture.asset(
                  AppImages.iGuide,
                ),
              ],
            ),
          Spacing.sizeBoxHt14,
          SizedBox(
            width: Spacing.margin78,
            height: Spacing.margin78,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () async {
                  final newTimer = await showDialog<ITimerModel>(
                    context: context,
                    builder: (context) => TimerDialogForm(),
                  );
                  if (newTimer != null) {
                    _timerListStore.addTimer(newTimer);
                  }
                },
                child: SvgPicture.asset(
                  AppImages.iAdd,
                  height: Spacing.margin28,
                  width: Spacing.margin28,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget get _buildBody {
    return Padding(
      padding: EdgeInsets.only(
        right: Spacing.margin16,
        left: Spacing.margin16,
        top: Spacing.margin16,
      ),
      child: Observer(
        builder: (context) {
          return _timerListStore.isLoading
              ? LoadingScreen()
              : ListView.builder(
                  itemCount: _timerListStore.timerList.length,
                  itemBuilder: (context, index) {
                    return _timerListStore.timerList.length > 0
                        ? ListTile(
                            title: TimerCard(
                              timerModel: _timerListStore.timerList[index],
                              onStop: () => _timerListStore.removeTimer(
                                  _timerListStore.timerList[index]),
                              onFinished: () => _timerListStore.finishedTimer(
                                  _timerListStore.timerList[index]),
                              isFinished:
                                  _timerListStore.timerList[index].finished,
                            ),
                          )
                        : SizedBox.shrink();
                  },
                );
        },
      ),
    );
  }
}
