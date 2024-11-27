import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:take_home_assignment/models/album_model.dart';
import 'package:take_home_assignment/modules/home/bloc/photo_bloc.dart';
import 'package:take_home_assignment/modules/home/components/album_row.dart';
import 'package:take_home_assignment/modules/home/services/db_helper.dart';

class InfiniteAlbumList extends StatefulWidget {
  InfiniteAlbumList({
    required this.albums,
  });

  final AlbumList albums;

  @override
  _InfiniteAlbumListState createState() => _InfiniteAlbumListState();
}

class _InfiniteAlbumListState extends State<InfiniteAlbumList>
    with AutomaticKeepAliveClientMixin {
  late ScrollController _verticalController;

  @override
  void initState() {
    super.initState();
    _verticalController = ScrollController();
  }

  @override
  void dispose() {
    _verticalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      controller: _verticalController,
      itemCount: null, // Infinite
      itemBuilder: (context, index) {
        final albumList = widget.albums.data ?? [];
        final adjustedIndex = index % (albumList).length;
        final album = albumList[adjustedIndex];

        return BlocProvider(
          create: (context) => PhotoBloc(
            homeRepository: Injector().get(),
            dbHelper: DatabaseHelper.instance,
          ),
          child: AlbumRow(
            key: UniqueKey(),
            album: album,
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
