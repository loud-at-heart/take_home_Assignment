import 'package:take_home_assignment/models/album_model.dart';
import 'package:take_home_assignment/models/error_response.dart';
import 'package:take_home_assignment/resources/network/network_connectivity.dart';
import 'package:take_home_assignment/webservice/base_repository.dart';
import 'package:take_home_assignment/webservice/data_load_result.dart';
import 'package:take_home_assignment/webservice/http/http_client.dart';
import 'package:take_home_assignment/webservice/http/uri_builder.dart';

abstract class HomeRepository extends BaseRepository {
  HomeRepository(AppConnectivity networkManager) : super(networkManager);

  Future<DataLoadResult<dynamic>> getAlbumData({int offset = 0});

  Future<DataLoadResult<dynamic>> getImageData(
      {String albumId = '', int offset = 0});
}

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl({
    required this.httpClient,
    required AppConnectivity networkManager,
    required this.uriBuilder,
  }) : super(networkManager);

  final HttpClient httpClient;
  final UriBuilder uriBuilder;

  @override
  Future<DataLoadResult> getAlbumData({int offset = 0}) async {
    final uri = uriBuilder.getAlbumData(offset: offset);

    final request = createJSONRequest(RequestMethods.GET, uri);

    final response = await httpClient.sendRequest(request);

    if (response.isSuccessful()) {
      final List<dynamic> albumJson = response.getBodyList();
      return DataLoadResult(
        data: AlbumList(
            data: albumJson.map((json) => Album.fromJson(json)).toList()),
      );
    }
    return DataLoadResult<ErrorResponse>(
      error: LoadingError.HTTP_INTERNAL_SERVER_ERROR,
      data: ErrorResponse.fromJson(
        response.getBodyJsonMap()!,
      ),
    );
  }

  @override
  Future<DataLoadResult> getImageData(
      {String albumId = '', int offset = 0}) async {
    final uri = uriBuilder.getImageForAlbum(albumId: albumId, offset: offset);

    final request = createJSONRequest(RequestMethods.GET, uri);

    final response = await httpClient.sendRequest(request);

    if (response.isSuccessful()) {
      final List<dynamic> photoJson = response.getBodyList();
      return DataLoadResult(
        data: PhotoList(
            data: photoJson.map((json) => Photo.fromJson(json)).toList()),
      );
    }
    return DataLoadResult<ErrorResponse>(
      error: LoadingError.HTTP_INTERNAL_SERVER_ERROR,
      data: ErrorResponse.fromJson(
        response.getBodyJsonMap()!,
      ),
    );
  }
}
