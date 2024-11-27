import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_assignment/models/album_model.dart';
import 'package:take_home_assignment/modules/home/bloc/album_bloc.dart';

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
              photos: state.photos,
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

class InfiniteAlbumList extends StatefulWidget {

  InfiniteAlbumList({required this.albums, required this.photos});
  final List<Album> albums;
  final Map<int, List<Photo>> photos;

  @override
  _InfiniteAlbumListState createState() => _InfiniteAlbumListState();
}

class _InfiniteAlbumListState extends State<InfiniteAlbumList> {
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
    return ListView.builder(
      controller: _verticalController,
      itemCount: null, // Infinite
      itemBuilder: (context, index) {
        final adjustedIndex = index % widget.albums.length;
        final album = widget.albums[adjustedIndex];
        final photos = widget.photos[album.id] ?? [];

        return AlbumRow(
          album: album,
          photos: photos,
        );
      },
    );
  }
}

class AlbumRow extends StatefulWidget {

  AlbumRow({required this.album, required this.photos});
  final Album album;
  final List<Photo> photos;

  @override
  _AlbumRowState createState() => _AlbumRowState();
}

class _AlbumRowState extends State<AlbumRow> {
  late ScrollController _horizontalController;

  @override
  void initState() {
    super.initState();
    _horizontalController = ScrollController();
  }

  @override
  void dispose() {
    _horizontalController.dispose();
    super.dispose();
  }

  Widget _buildImageWithFallback(Photo photo) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          photo.thumbnailUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Colors.grey[600],
                    size: 32,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Image not available',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            widget.album.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            controller: _horizontalController,
            scrollDirection: Axis.horizontal,
            itemCount: null, // Infinite
            itemBuilder: (context, index) {
              if (widget.photos.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }
              final adjustedIndex = index % widget.photos.length;
              final photo = widget.photos[adjustedIndex];

              return Padding(
                padding: EdgeInsets.all(8.0),
                child: _buildImageWithFallback(photo),
              );
            },
          ),
        ),
        Divider(),
      ],
    );
  }
}