import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:take_home_assignment/models/album_model.dart';
import 'package:take_home_assignment/modules/home/bloc/photo_bloc.dart';
import 'package:take_home_assignment/modules/home/services/image_cache_manager.dart';
import 'package:take_home_assignment/style/spacing.dart';

class AlbumRow extends StatefulWidget {
  AlbumRow({super.key, required this.album});

  final Album album;

  @override
  _AlbumRowState createState() => _AlbumRowState();
}

class _AlbumRowState extends State<AlbumRow>
    with AutomaticKeepAliveClientMixin {
  late ScrollController _horizontalController;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _horizontalController = ScrollController();

    // Fetch photos when row is created
    _setupVisibilityDetector();
  }

  @override
  void dispose() {
    _horizontalController.dispose();
    super.dispose();
  }

  void _setupVisibilityDetector() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_isVisible) {
        _isVisible = true;
        if (mounted) {
          context.read<PhotoBloc>().add(FetchPhotosForAlbum(widget.album.id));
        }
      }
    });
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildImageWithFallback(Photo photo) {
    return Container(
      width: Spacing.margin200,
      height: Spacing.margin200,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(Spacing.margin8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Spacing.margin8),
        child: Image(
          image: ImageCacheManager.getImage(photo.thumbnailUrl),
          fit: BoxFit.cover,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded || frame != null) {
              return child;
            }
            return _buildShimmer();
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.error_outline,
                    color: Colors.grey,
                    size: 32,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Image not available',
                    style: TextStyle(color: Colors.grey),
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
    super.build(context);
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
          child: BlocBuilder<PhotoBloc, PhotoState>(
            builder: (context, state) {
              if (state is PhotoLoading) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3, // Show 3 shimmer placeholders
                  itemBuilder: (context, index) {
                    return Padding(
                      key: UniqueKey(),
                      padding: EdgeInsets.all(8.0),
                      child: _buildShimmer(),
                    );
                  },
                );
              }

              if (state is PhotoError) {
                return Center(child: Text(state.message));
              }

              if (state is PhotoLoaded) {
                return ListView.builder(
                  controller: _horizontalController,
                  scrollDirection: Axis.horizontal,
                  itemCount: null, // Infinite
                  itemBuilder: (context, index) {
                    final adjustedIndex =
                        index % (state.photos.data ?? []).length;
                    final photo = (state.photos.data ?? [])[adjustedIndex];

                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: _buildImageWithFallback(photo),
                    );
                  },
                );
              }

              return Container();
            },
          ),
        ),
        Divider(),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
