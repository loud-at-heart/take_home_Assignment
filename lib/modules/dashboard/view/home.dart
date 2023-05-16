import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_assignment/components/loading_widget.dart';
import 'package:take_home_assignment/models/listview_data.dart';
import 'package:take_home_assignment/modules/dashboard/bloc/home_bloc.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_dimens.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() => BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is DataState) {
            return Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: state.listViewModel.data?.length,
                        itemBuilder: (ctx, index) {
                          List<Data>? _data = state.listViewModel.data;
                          return Card(
                            child: ListTile(
                              leading: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.largeRadius20)),
                                child: Image.network(_data?[index].avatar ??
                                    'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541'),
                              ),
                              title: Text(
                                "${_data?[index].firstName} ${_data?[index].lastName}",
                                style: AppTextStyles.medium(
                                  FontSize.subtitle,
                                  AppColors.color191919,
                                ),
                              ),
                              subtitle: Text(
                                "${_data?[index].email}",
                                style: AppTextStyles.regular(
                                  FontSize.normal,
                                  AppColors.color191919,
                                ),
                              ),
                            ),
                          );
                        }))
              ],
            );
          }
          return LoadingScreen();
        },
        buildWhen: (prev, curr) => curr is LoadingState || curr is DataState,
        listenWhen: (prev, curr) =>
            !(curr is LoadingState || curr is DataState),
      );
}
