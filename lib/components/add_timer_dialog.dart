import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:take_home_assignment/components/time_picker.dart';
import 'package:take_home_assignment/generated/l10n.dart';
import 'package:take_home_assignment/models/i_timer_model.dart';
import 'package:take_home_assignment/stores/dashboard/add_timer_store.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_dimens.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';
import 'package:take_home_assignment/style/spacing.dart';

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
      content: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.mediumRadius),
                        borderSide: BorderSide(
                          color: AppColors.darkRed,
                          width: 1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.mediumRadius),
                        borderSide: BorderSide(
                          color: AppColors.darkRed,
                          width: 1,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context).titleError;
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
                    minLines: 5,
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
                      errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.mediumRadius),
                        borderSide: BorderSide(
                          color: AppColors.darkRed,
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.mediumRadius),
                        borderSide: BorderSide(
                          color: AppColors.darkRed,
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
                        return AppLocalizations.of(context).subtitleError;
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
                      addTimerStore.setDurationError(false);
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
                                hint: AppLocalizations.of(context).hourHint,
                              ),
                              SingleTimerSeparator(),
                              SingleTimerBox(
                                body: addTimerStore.minutes.toString(),
                                hint: AppLocalizations.of(context).minHint,
                              ),
                              SingleTimerSeparator(),
                              SingleTimerBox(
                                body: addTimerStore.seconds.toString(),
                                hint: AppLocalizations.of(context).secHint,
                              ),
                            ],
                          ),
                          addTimerStore.showDurationError
                              ? Text(
                                  'Set a duration',
                                  style: AppTextStyles.regular(
                                    FontSize.small,
                                    AppColors.darkRed,
                                  ),
                                )
                              : SizedBox.shrink(),
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
                      child: Text(
                        AppLocalizations.of(context).addTask,
                        style: AppTextStyles.medium(
                            FontSize.normal, AppColors.color191919),
                      ),
                    ),
                  ),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (addTimerStore.duration == Duration.zero) {
                        addTimerStore.setDurationError(true);
                      } else {
                        Navigator.of(context).pop(
                          ITimerModel.generate(
                            title: titleController.text.trim(),
                            subtitle: descController.text.trim(),
                            second: addTimerStore.t2s,
                          ),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
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

  Widget SingleTimerSeparator() => Padding(
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
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
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
