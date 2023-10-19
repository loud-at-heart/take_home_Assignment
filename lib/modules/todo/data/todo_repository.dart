import 'package:take_home_assignment/models/error_response.dart';
import 'package:take_home_assignment/models/todo_model.dart';
import 'package:take_home_assignment/resources/network/network_connectivity.dart';
import 'package:take_home_assignment/webservice/base_repository.dart';
import 'package:take_home_assignment/webservice/data_load_result.dart';
import 'package:take_home_assignment/webservice/http/http_client.dart';
import 'package:take_home_assignment/webservice/http/uri_builder.dart';

abstract class TodoRepository extends BaseRepository {
  TodoRepository(AppConnectivity networkManager) : super(networkManager);

  Future<DataLoadResult<dynamic>> requestData();
}

class TodoRepositoryImpl extends TodoRepository {
  TodoRepositoryImpl({
    required this.httpClient,
    required AppConnectivity networkManager,
    required this.uriBuilder,
  }) : super(networkManager);

  final HttpClient httpClient;
  final UriBuilder uriBuilder;

  @override
  Future<DataLoadResult> requestData() async {
    final uri = uriBuilder.getTodoData();

    final request = createJSONRequest(RequestMethods.GET, uri);

    final response = await httpClient.sendRequest(request);

    if (response.isSuccessful()) {
      var updatedRes = {'todoModelList': response.getBodyList()};
      return DataLoadResult(
        data: TodoModelList.fromJson(
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
