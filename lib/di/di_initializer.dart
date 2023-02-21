import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:take_home_assignment/modules/swiggyOtpLogin/data/swiggy_login_repository.dart';
import 'package:take_home_assignment/modules/weather/data/weather_repository.dart';
import 'package:take_home_assignment/resources/network/network_connectivity.dart';
import 'package:take_home_assignment/webservice/http/http_client.dart';
import 'package:take_home_assignment/webservice/http/uri_builder.dart';

import '../modules/weather/provider/db_provider.dart';

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
        // const openWeatherMapURL = 'api.openweathermap.org';
        const swiggyLoginURL = 'www.swiggy.com';
        return UriBuilder(baseUrlAuthority: swiggyLoginURL);
      },
      isSingleton: false,
    );

    //Http Client
    injector.map<HttpClient>(
      (injector) => AppHttpClient(uriBuilder: injector.get()),
      isSingleton: true,
    );

    //Weather Repository
    injector.map<WeatherRepository>(
      (injector) => WeatherRepositoryImpl(
        httpClient: injector.get(),
        uriBuilder: injector.get(),
        networkManager: injector.get(),
      ),
      isSingleton: false,
    );

    //SwiggyLogin Repository
    injector.map<SwiggyLoginRepository>(
      (injector) => SwiggyLoginRepositoryImpl(
        httpClient: injector.get(),
        uriBuilder: injector.get(),
        networkManager: injector.get(),
      ),
      isSingleton: false,
    );

    //DBProvider
    injector.map<DBProvider>(
      (injector) => DBProvider.db,
      isSingleton: true,
    );
  }
}
