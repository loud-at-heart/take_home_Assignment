import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:take_home_assignment/session/session_manager.dart';
import 'package:take_home_assignment/webservice/http/uri_builder.dart';

abstract class HttpClient {
  Future<ServerResponse> sendRequest(http.BaseRequest request);
}

class AppHttpClient extends HttpClient {
  AppHttpClient({
    required this.uriBuilder,
  });

  final UriBuilder uriBuilder;

  Future<ServerResponse> _makeServerCall(http.BaseRequest request) async {
    var httpClient = http.Client();
    var serverResponse = ServerResponse();
    try {
      debugPrint('Sending request: ${request.method} ${request.url}');
      if (request is http.Request) {
        debugPrint('Request body: ${_createLogMessage(request.body)}');
      }
      var streamedResponse = await httpClient.send(request).timeout(
            const Duration(
              seconds: 20, // timeout
            ),
          );
      serverResponse.response =
          await http.Response.fromStream(streamedResponse);
      SessionManager().updateCookie(serverResponse.response);
      // if we get image - log message too long and useless
      debugPrint(
          'Response: ${_createLogMessage(serverResponse.getBodyJson())}');
    } catch (e) {
      debugPrint('Request failed: $e');
      serverResponse.exception = e;
    } finally {
      httpClient.close();
    }
    return Future.value(serverResponse);
  }

  @override
  Future<ServerResponse> sendRequest(http.BaseRequest request) async {
    _setRequestHeaders(request);
    var serverResponse = await _makeServerCall(request);

    return Future.value(serverResponse);
  }

  _setRequestHeaders(http.BaseRequest request) async {
    request.headers["Origin"] = 'https://www.swiggy.com';
    request.headers["Content-Type"] = 'application/json';
    if (SessionManager().getCookie != null)
      request.headers["cookie"] = SessionManager().getCookie ?? "";
  }
}

class ServerResponse {
  http.Response? response;
  Object? exception;

  bool isSuccessful() {
    getErrorType();
    return exception == null &&
        response != null &&
        response!.statusCode == StatusCodes.OK;
  }

  String getBodyJson() {
    return utf8.decode(response!.bodyBytes);
  }

  Map<String, dynamic>? getBodyJsonMap() {
    return jsonDecode(utf8.decode(response!.bodyBytes)) as Map<String, dynamic>;
  }

  getErrorType() {
    if (StatusCodes.CLIENT_ERROR_CODES.contains(response?.statusCode)) {
      debugPrint('Client Error: ${response!.statusCode}');
      //return Error.SERVER_ERROR;
    } else if (StatusCodes.SERVER_ERROR_CODES.contains(response?.statusCode)) {
      debugPrint('Server Error: ${response?.statusCode}');
      //return Error.SERVER_ERROR;
    } else {
      debugPrint('Response status code : ${response?.statusCode}');
      //return null;
    }
  }
}

http.Request createJSONRequest(
  String method,
  Uri uri, {
  String? body,
}) {
  var request = http.Request(method, uri);
  if (body != null) {
    request.body = body;
  }
  return request;
}

String _createLogMessage(String stringToLog) {
  if (stringToLog.isEmpty) {
    return stringToLog;
  }
  return stringToLog;
}

enum Error {
  SERVER_ERROR,
  CLIENT_ERROR,
  REQUEST_FAILED,
}

class StatusCodes {
  static const int UNAUTHORIZED = 401;
  static const List<int> CLIENT_ERROR_CODES = [
    400,
    403,
    404,
    405,
    408,
    414,
    415,
    429,
  ];
  static const List<int> SERVER_ERROR_CODES = [
    500,
    501,
    502,
    503,
    504,
    505,
    508,
    511,
  ];
  static const int OK = 200;
}

class RequestMethods {
  static const POST = 'POST';
  static const GET = 'GET';
  static const PUT = 'PUT';
  static const DELETE = 'DELETE';
}

enum HttpRequestType { GET, POST, PUT, DELETE }
