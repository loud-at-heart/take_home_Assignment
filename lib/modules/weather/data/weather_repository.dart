import 'package:take_home_assignment/models/forecast_data.dart';
import 'package:take_home_assignment/models/weather_data.dart';

import '../../../models/error_response.dart';
import '../../../resources/network/network_connectivity.dart';
import '../../../webservice/base_repository.dart';
import '../../../webservice/data_load_result.dart';
import '../../../webservice/http/http_client.dart';
import '../../../webservice/http/uri_builder.dart';

abstract class WeatherRepository extends BaseRepository {
  WeatherRepository(AppConnectivity networkManager) : super(networkManager);

  Future<DataLoadResult<dynamic>> requestData({
    double? lat,
    double? long,
    bool isForecast = false,
  });
}

class WeatherRepositoryImpl extends WeatherRepository {
  WeatherRepositoryImpl({
    required this.httpClient,
    required AppConnectivity networkManager,
    required this.uriBuilder,
  }) : super(networkManager);

  final HttpClient httpClient;
  final UriBuilder uriBuilder;

  @override
  Future<DataLoadResult> requestData({
    double? lat,
    double? long,
    bool isForecast = false,
  }) async {
    final uri = uriBuilder.getWeatherData(
      lat: lat,
      long: long,
      isForecast: isForecast,
    );

    final request = createJSONRequest(RequestMethods.GET, uri);

    final response = await httpClient.sendRequest(request);

    if (response.isSuccessful()) {
      return isForecast
          ? DataLoadResult(
              data: ForecastData.fromJson(
                response.getBodyJsonMap()!,
                isForecastData: true,
              ),
            )
          : DataLoadResult(
              data: WeatherData.fromJson(
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
