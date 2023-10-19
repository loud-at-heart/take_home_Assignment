import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:take_home_assignment/modules/news/data/news_repository.dart';
import 'package:take_home_assignment/modules/todo/data/todo_repository.dart';
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
        const _uRL = 'mocki.io';
        return UriBuilder(baseUrlAuthority: _uRL);
      },
      isSingleton: false,
    );

    //Http Client
    injector.map<HttpClient>(
      (injector) => AppHttpClient(uriBuilder: injector.get()),
      isSingleton: true,
    );

    //News Repository
    injector.map<NewsRepository>(
      (injector) => NewsRepositoryImpl(
        httpClient: injector.get(),
        uriBuilder: injector.get(),
        networkManager: injector.get(),
      ),
    );

    //Todoo Repository
    injector.map<TodoRepository>(
      (injector) => TodoRepositoryImpl(
        httpClient: injector.get(),
        uriBuilder: injector.get(),
        networkManager: injector.get(),
      ),
    );
  }
}
