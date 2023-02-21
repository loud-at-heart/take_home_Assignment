import 'package:take_home_assignment/models/error_response.dart';
import 'package:take_home_assignment/models/customer_details.dart';
import 'package:take_home_assignment/resources/network/network_connectivity.dart';
import 'package:take_home_assignment/webservice/base_repository.dart';
import 'package:take_home_assignment/webservice/data_load_result.dart';
import 'package:take_home_assignment/webservice/http/http_client.dart';
import 'package:take_home_assignment/webservice/http/uri_builder.dart';

abstract class SwiggyLoginRepository extends BaseRepository {
  SwiggyLoginRepository(AppConnectivity networkManager) : super(networkManager);

  Future<DataLoadResult<dynamic>> requestOtp({String? phoneNo});

  Future<DataLoadResult<dynamic>> verifyOtp({String? otp});
  Future<DataLoadResult<dynamic>> fetchOrder({String? orderId});
}

class SwiggyLoginRepositoryImpl extends SwiggyLoginRepository {
  SwiggyLoginRepositoryImpl({
    required this.httpClient,
    required AppConnectivity networkManager,
    required this.uriBuilder,
  }) : super(networkManager);

  final HttpClient httpClient;
  final UriBuilder uriBuilder;

  @override
  Future<DataLoadResult> requestOtp({String? phoneNo}) async {
    final uri = uriBuilder.getLoginOtp();

    final _body = '{"mobile": $phoneNo}';

    final request = createJSONRequest(RequestMethods.POST, uri, body: _body);

    final response = await httpClient.sendRequest(
      request,
    );

    if (response.isSuccessful()) {
      return DataLoadResult(
        data: true,
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
  Future<DataLoadResult> verifyOtp({String? otp}) async {
    final uri = uriBuilder.verifyLoginOtp();

    final _body = '{"otp": $otp}';

    final request = createJSONRequest(RequestMethods.POST, uri, body: _body);

    final response = await httpClient.sendRequest(
      request,
    );

    if (response.isSuccessful()) {
      return DataLoadResult(
        data: CustomerDetails.fromJson(
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
  Future<DataLoadResult> fetchOrder({String? orderId}) async {
    final uri = uriBuilder.fetchOrders(orderId);

    final request = createJSONRequest(RequestMethods.GET, uri,);

    final response = await httpClient.sendRequest(
      request,
    );

    if(response.isSuccessful()){
      return DataLoadResult(
        data: CustomerDetails.fromJson(
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
