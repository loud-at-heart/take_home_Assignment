import 'package:take_home_assignment/models/error_response.dart';
import 'package:take_home_assignment/models/gif_model.dart';
import 'package:take_home_assignment/resources/network/network_connectivity.dart';
import 'package:take_home_assignment/webservice/base_repository.dart';
import 'package:take_home_assignment/webservice/data_load_result.dart';
import 'package:take_home_assignment/webservice/http/http_client.dart';
import 'package:take_home_assignment/webservice/http/uri_builder.dart';

abstract class HomeRepository extends BaseRepository {
  HomeRepository(AppConnectivity networkManager) : super(networkManager);

  Future<DataLoadResult<dynamic>> requestData({int offset = 0});
  Future<DataLoadResult<dynamic>> searchData({String query ='',int offset = 0});
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
  Future<DataLoadResult> requestData({int offset = 0}) async {
    final uri = uriBuilder.getTrendingGifs(offset: offset);

    final request = createJSONRequest(RequestMethods.GET, uri);

    final response = await httpClient.sendRequest(request);

    if (response.isSuccessful()) {
      return DataLoadResult(
        data: GifModelList.fromJson(
          response.getBodyJsonMap()!,
        ),
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
  Future<DataLoadResult> searchData({String query = '', int offset = 0}) async {
    final uri = uriBuilder.getSearchedGifs(query: query,offset: offset);

    final request = createJSONRequest(RequestMethods.GET, uri);

    final response = await httpClient.sendRequest(request);

    if (response.isSuccessful()) {
      return DataLoadResult(
        data: GifModelList.fromJson(
          response.getBodyJsonMap()!,
        ),
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
