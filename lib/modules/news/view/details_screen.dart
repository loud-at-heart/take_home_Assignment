import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_assignment/components/app_snackbar.dart';
import 'package:take_home_assignment/components/scroll_behaviour.dart';
import 'package:take_home_assignment/models/comments_model.dart';
import 'package:take_home_assignment/models/news_model.dart';
import 'package:take_home_assignment/modules/news/bloc/news_bloc.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';
import 'package:take_home_assignment/style/spacing.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.model});

  final NewsModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: BackButton(
          color: AppColors.black,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: BlocConsumer<NewsBloc, NewsState>(
        listener: (context, state) {
          if (state is NoInternetState) {
            AppSnackBar().showSnackBar(
              context,
              text: "No Internet connection ...",
            );
          } else if (state is RequestFailedWithMessageState) {
            AppSnackBar().showSnackBar(
              context,
              text: state.errorMessage ?? "Something went wrong ...",
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.margin24,
                  vertical: Spacing.margin16,
                ),
                child: Text(
                  model.title ?? '',
                  style: AppTextStyles.bold(
                    FontSize.title,
                    AppColors.color191919,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.margin24,
                ),
                child: Text(
                  model.body ?? '',
                  style: AppTextStyles.regular(
                    FontSize.normal,
                    AppColors.color737373,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Spacing.sizeBoxHt24,
              if (state is PopulateCommentsDataState) ...[
                Text(
                    "Comments (${state.commentList?.commentsModelList?.length ?? "0"})"
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Spacing.margin24),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ScrollConfiguration(
                      behavior: BottomSheetBehavior(),
                      child: ListView.builder(
                          itemCount:
                              state.commentList?.commentsModelList?.length,
                          itemBuilder: (context, index) {
                            CommentsModel? model =
                                state.commentList?.commentsModelList?[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Spacing.margin10)),
                                elevation: Spacing.margin5,
                                // color: DynamicColor().getColor(1.0),

                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          Spacing.margin10)),
                                  onTap: () {
                                    // HapticFeedback.heavyImpact();
                                    // Navigator.pushNamed(
                                    //   context,
                                    //   Routes.detailsScreen,
                                    //   arguments: model,
                                    // );
                                  },
                                  tileColor: AppColors.white,
                                  contentPadding:
                                      EdgeInsets.all(Spacing.margin8),
                                  title: Text(
                                    "${model?.body ?? "Comments not available"} ...",
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                )
              ] else
                CircularProgressIndicator(),
            ],
          );
        },
        buildWhen: _rebuildState,
      ),
    );
  }

  bool _rebuildState(NewsState previous, NewsState current) =>
      current is PopulateCommentsDataState;
}
