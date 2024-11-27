import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_assignment/modules/home/bloc/album_bloc.dart';
import 'package:take_home_assignment/modules/home/components/infinite_album_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite Albums'),
      ),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is AlbumLoaded) {
            return InfiniteAlbumList(
              albums: state.albums,
            );
          } else if (state is AlbumError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
