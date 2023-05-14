import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:take_home_assignment/components/scroll_behaviour.dart';
import 'package:take_home_assignment/components/time_picker.dart';
import 'package:take_home_assignment/components/timer_card.dart';
import 'package:take_home_assignment/generated/l10n.dart';
import 'package:take_home_assignment/resources/images/app_images.dart';
import 'package:take_home_assignment/stores/dashboard/add_timer_store.dart';
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
      floatingActionButton: SizedBox(
        width: Spacing.margin78,
        height: Spacing.margin78,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () async {
              final newTimer = await showDialog(
                context: context,
                builder: (context) => TimerDialogForm(),
              );
            },
            child: SvgPicture.asset(
              AppImages.iAdd,
              height: Spacing.margin28,
              width: Spacing.margin28,
            ),
          ),
        ),
      ),
    );
  }
}

class TimerDialogForm extends StatelessWidget {
  TimerDialogForm({
    Key? key,
  }) : super(key: key);

  final AddTimerStore addTimerStore = AddTimerStore();

  final titleController = TextEditingController();
  final descController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        AppLocalizations.of(context).addTask,
        style: AppTextStyles.regular(
          FontSize.large32,
          AppColors.hintColor,
        ),
      ),
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.only(
        left: Spacing.margin32,
        top: Spacing.margin42,
        bottom: Spacing.margin20,
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.margin32,
              ),
              child: TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: AppLocalizations.of(context).hintTitleText,
                  labelText: AppLocalizations.of(context).titleText,
                  labelStyle: TextStyle(
                    color: AppColors.timerSubtitleColor,
                    backgroundColor: AppColors.white,
                  ),
                  hintStyle: AppTextStyles.regular(
                    FontSize.subtitle,
                    AppColors.hintTbColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.mediumRadius),
                    borderSide: BorderSide(
                      color: AppColors.color737373,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.mediumRadius),
                    borderSide: BorderSide(
                      color: AppColors.subtitleColor,
                      width: 2,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
            ),
            Spacing.sizeBoxHt36,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.margin32,
              ),
              child: TextFormField(
                controller: descController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                minLines: 6,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: AppLocalizations.of(context).hintSubtitleText,
                  labelText: AppLocalizations.of(context).subtitleText,
                  labelStyle: TextStyle(
                    color: AppColors.timerSubtitleColor,
                    backgroundColor: AppColors.white,
                  ),
                  hintStyle: AppTextStyles.regular(
                    FontSize.subtitle,
                    AppColors.hintTbColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.mediumRadius),
                    borderSide: BorderSide(
                      color: AppColors.color737373,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.mediumRadius),
                    borderSide: BorderSide(
                      color: AppColors.subtitleColor,
                      width: 2,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
              ),
            ),
            Spacing.sizeBoxHt28,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.margin32,
              ),
              child: GestureDetector(
                onTap: () {
                  showCupertinoModalPopup<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return _buildContainer(
                        picker: TimerPicker(
                          store: addTimerStore,
                        ),
                        context: context,
                      );
                    },
                  );
                },
                child: Observer(builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context).duration,
                        style: AppTextStyles.medium(
                          FontSize.small,
                          AppColors.hintColor,
                          height: 1.3,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleTimerBox(
                            body: addTimerStore.hours.toString(),
                            hint: "HH",
                          ),
                          SingleTimerSeperator(),
                          SingleTimerBox(
                            body: addTimerStore.minutes.toString(),
                            hint: "MM",
                          ),
                          SingleTimerSeperator(),
                          SingleTimerBox(
                            body: addTimerStore.seconds.toString(),
                            hint: "SS",
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ),
            Spacing.sizeBoxHt60,
            InkWell(
              child: Container(
                height: Spacing.margin60,
                width: MediaQuery.of(context).size.width,
                color: AppColors.buttonColor,
                child: Center(
                    child: Text('Add Task',
                        style: AppTextStyles.medium(
                            FontSize.normal, AppColors.color191919))),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(
          Spacing.margin20,
        ),
      )),
    );
  }

  Widget SingleTimerSeperator() => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Spacing.margin6,
          vertical: Spacing.margin8,
        ),
        child: Text(
          ':',
          style: AppTextStyles.medium(
            FontSize.small,
            AppColors.timerSubtitleColor,
          ),
        ),
      );

  Widget SingleTimerBox({
    String? body,
    String? hint,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(Spacing.halfSmallMargin),
            color: Color(0xffA7F5A7),
            child: Text(
              (body ?? '0').padLeft(2, '0'),
              style: AppTextStyles.regular(
                FontSize.large24,
                Color(0xff216C2E),
              ),
            ),
          ),
          Text(
            hint ?? "",
            style: AppTextStyles.medium(
              FontSize.small,
              AppColors.hintColor,
              height: 1.5,
            ),
          )
        ],
      );

  Widget _buildContainer({
    required Widget picker,
    required BuildContext context,
  }) {
    return AspectRatio(
      aspectRatio: MediaQuery.of(context).size.width / 275,
      child: Container(
        padding: const EdgeInsets.only(top: 6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              Spacing.margin20,
            ),
          ),
          color: CupertinoColors.white,
        ),
        child: DefaultTextStyle(
          style: const TextStyle(
            color: CupertinoColors.black,
            fontSize: 22.0,
          ),
          child: GestureDetector(
            onTap: () {},
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Done"))
                    ],
                  ),
                  picker,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
