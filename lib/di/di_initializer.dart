import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:take_home_assignment/modules/home/repository/home_repository.dart';
import 'package:take_home_assignment/resources/network/network_connectivity.dart';
import 'package:take_home_assignment/webservice/http/http_client.dart';
import 'package:take_home_assignment/webservice/http/uri_builder.dart';

class DI {
  initialize() {
    var injector = Injector();

    //Network Manager
    injector.map<AppConnectivity>(
      (injector) => AppConnectivity(),
      isSingleton: false,
    );

    //URI Builder
    injector.map<UriBuilder>(
      (injector) {
        const _url = 'api.giphy.com';
        return UriBuilder(baseUrlAuthority: _url);
      },
      isSingleton: false,
    );

    //Http Client
    injector.map<HttpClient>(
      (injector) => AppHttpClient(uriBuilder: injector.get()),
      isSingleton: true,
    );

    //Gif Repository
    injector.map<HomeRepository>(
          (injector) => HomeRepositoryImpl(
        httpClient: injector.get(),
        uriBuilder: injector.get(),
        networkManager: injector.get(),
      ),
    );
  }
}
