import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:take_home_assignment/components/app_snackbar.dart';
import 'package:take_home_assignment/models/gif_model.dart';
import 'package:take_home_assignment/modules/home/bloc/home_bloc.dart';
import 'package:take_home_assignment/modules/home/components/search_widget.dart';
import 'package:take_home_assignment/navigation/routes.dart';
import 'package:take_home_assignment/style/spacing.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var scroll = ScrollController();
  var preventCall = false;

  @override
  initState() {
    scroll.addListener(onScroll);
    super.initState();
  }

  @override
  void dispose() {
    scroll.removeListener(onScroll);
    super.dispose();
  }

  void onScroll() {
    var position = scroll.position.pixels;
    if (position >= scroll.position.maxScrollExtent - 10) {
      BlocProvider.of<HomeBloc>(context)
          .add(LoadNextDataEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if(state is NoInternetState){
          Navigator.pushReplacementNamed(
            context,
            Routes.noInternet,
          );
        }else if(state is RequestFailedWithMessageState){
          AppSnackBar().showSnackBar(
            context,
            text: state.errorMessage ?? "Something went wrong ...",
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top:
                      MediaQuery.of(context).viewPadding.top + Spacing.margin24,
                  right: Spacing.margin24,
                  left: Spacing.margin24,
                  bottom: Spacing.margin24,
                ),
                child: SearchWidget(
                  onDebounceStart: () => BlocProvider.of<HomeBloc>(context)
                      .add(StartLoadingEvent()),
                  onChanged: (query) => BlocProvider.of<HomeBloc>(context)
                      .add(SearchGifEvent(query: query)),
                ),
              ),
              if (state is ShowAllTrendingGifState)
                Expanded(
                  child: MasonryGridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    itemCount: state.data?.data?.length,
                    controller: scroll,
                    itemBuilder: (context, index) {
                      return ImageTile(
                        data: state.data?.data?[index],
                      );
                    },
                  ),
                )
              else
                Center(child: CircularProgressIndicator())
            ],
          ),
        );
      },
      buildWhen: _buildWhen,
    );
  }

  bool _buildWhen(HomeState previous, HomeState current) =>
      current is ShowAllTrendingGifState;
}

class ImageTile extends StatelessWidget {
  const ImageTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  final GifModel? data;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://i.giphy.com/media/${data?.id}/200.gif',
    );
  }
}
