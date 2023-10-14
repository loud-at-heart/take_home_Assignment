import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_assignment/components/app_snackbar.dart';
import 'package:take_home_assignment/components/loading_widget.dart';
import 'package:take_home_assignment/components/scroll_behaviour.dart';
import 'package:take_home_assignment/models/news_model.dart';
import 'package:take_home_assignment/modules/news/bloc/news_bloc.dart';
import 'package:take_home_assignment/navigation/routes.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';
import 'package:take_home_assignment/style/spacing.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsBloc, NewsState>(
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
        return SafeArea(
          child: Scaffold(
            body: (state is PopulateDataState)
                ? NestedScrollView(
                    physics: const ClampingScrollPhysics(),
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                          pinned: true,
                          expandedHeight: 120,
                          backgroundColor: Colors.white,
                          elevation: 0.0,
                          flexibleSpace: FlexibleSpaceBar(
                            title: Text(
                              'Flutter News',
                              style: AppTextStyles.bold(
                                FontSize.large30,
                                Color(0xff5E56E7),
                              ),
                            ),
                            titlePadding: EdgeInsets.all(15),
                          ),
                          automaticallyImplyLeading: false,
                        ),
                      ];
                    },
                    body: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Spacing.margin24),
                      child: Column(
                        children: [
                          Expanded(
                            child: ScrollConfiguration(
                              behavior: BottomSheetBehavior(),
                              child: ListView.builder(
                                  itemCount:
                                      state.newsRes?.newsModelList?.length,
                                  itemBuilder: (context, index) {
                                    NewsModel? model =
                                        state.newsRes?.newsModelList?[index];
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
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Spacing.margin10)),
                                          onTap: () {
                                            HapticFeedback.heavyImpact();
                                            Navigator.pushNamed(
                                              context,
                                              Routes.detailsScreen,
                                              arguments: model,
                                            );
                                          },
                                          tileColor: AppColors.white,
                                          contentPadding: EdgeInsets.all(8.0),
                                          subtitle: Text(
                                            "${model?.body?.substring(0, 20) ?? "Description not available"} ...",
                                          ),
                                          title: Text(
                                            model?.title ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                          ),
                                          isThreeLine: true,
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : LoadingScreen(),
          ),
        );
      },
    );
  }
}
