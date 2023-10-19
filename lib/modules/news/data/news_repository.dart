import 'package:take_home_assignment/models/comments_model.dart';
import 'package:take_home_assignment/models/news_model.dart';
import 'package:take_home_assignment/models/error_response.dart';
import 'package:take_home_assignment/resources/network/network_connectivity.dart';
import 'package:take_home_assignment/webservice/base_repository.dart';
import 'package:take_home_assignment/webservice/data_load_result.dart';
import 'package:take_home_assignment/webservice/http/http_client.dart';
import 'package:take_home_assignment/webservice/http/uri_builder.dart';

abstract class NewsRepository extends BaseRepository {
  NewsRepository(AppConnectivity networkManager) : super(networkManager);

  Future<DataLoadResult<dynamic>> requestData({
    int? id,
  });

  Future<DataLoadResult<dynamic>> requestCommentsData({
    int? id,
  });
}

class NewsRepositoryImpl extends NewsRepository {
  NewsRepositoryImpl({
    required this.httpClient,
    required AppConnectivity networkManager,
    required this.uriBuilder,
  }) : super(networkManager);

  final HttpClient httpClient;
  final UriBuilder uriBuilder;

  @override
  Future<DataLoadResult> requestData({
    int? id,
  }) async {
    final uri = uriBuilder.getNewsData(id: id);

    final request = createJSONRequest(RequestMethods.GET, uri);

    final response = await httpClient.sendRequest(request);

    if (response.isSuccessful()) {
      var updatedRes = {'newsModelList':response.getBodyList()};
      return DataLoadResult(
        data: NewsModelList.fromJson(
          updatedRes,
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
  Future<DataLoadResult> requestCommentsData({int? id}) async {
    final uri = uriBuilder.getCommentsData(id: id);

    final request = createJSONRequest(RequestMethods.GET, uri);

    final response = await httpClient.sendRequest(request);

    if (response.isSuccessful()) {
      var updatedRes = {'commentsModelList':response.getBodyList()};
      return DataLoadResult(
        data: CommentsModelList.fromJson(
          updatedRes,
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
