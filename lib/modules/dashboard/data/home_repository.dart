import 'package:take_home_assignment/models/listview_data.dart';
import 'package:take_home_assignment/resources/network/network_connectivity.dart';
import 'package:take_home_assignment/webservice/base_repository.dart';
import 'package:take_home_assignment/webservice/http/http_client.dart';
import 'package:take_home_assignment/webservice/http/uri_builder.dart';

abstract class HomeRepository extends BaseRepository {
  HomeRepository(AppConnectivity networkManager) : super(networkManager);

  Future<ListViewModel?> getListViewData();
}

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl({
    required AppConnectivity networkManager,
    required this.httpClient,
    required this.uriBuilder,
  }) : super(networkManager);

  final HttpClient httpClient;
  final UriBuilder uriBuilder;

  @override
  Future<ListViewModel?> getListViewData() async {
    //Get uri
    Uri uri = uriBuilder.getPageDat();

    //Get request
    var request = createJSONRequest(
      RequestMethods.GET,
      uri,
    );
    var serverResponse = await httpClient.sendRequest(
      request,
    );
    if (serverResponse.isSuccessful()) {
      final listViewData =
          ListViewModel.fromJson(serverResponse.getBodyJsonMap() ?? {});
      return listViewData;
    }
    return null;
  }
}
