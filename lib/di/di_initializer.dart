import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:take_home_assignment/modules/dashboard/data/home_repository.dart';
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
        const regresURL = 'reqres.in';
        return UriBuilder(baseUrlAuthority: regresURL);
      },
      isSingleton: false,
    );

    //Http Client
    injector.map<HttpClient>(
      (injector) => AppHttpClient(uriBuilder: injector.get()),
      isSingleton: true,
    );

    // //Weather Repository
    // injector.map<WeatherRepository>(
    //   (injector) => WeatherRepositoryImpl(
    //     httpClient: injector.get(),
    //     uriBuilder: injector.get(),
    //     networkManager: injector.get(),
    //   ),
    //   isSingleton: false,
    // );
    //Home Repository
    injector.map<HomeRepository>(
      (injector) => HomeRepositoryImpl(
        httpClient: injector.get(),
        uriBuilder: injector.get(),
        networkManager: injector.get(),
      ),
      isSingleton: false,
    );
  }
}
