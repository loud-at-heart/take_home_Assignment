import 'dart:convert';
import 'package:http/http.dart' as http;

mixin MockServer {
  Future<http.Response> mockApiCall({
    dynamic body,
  }) async {
    return http.Response(jsonEncode(body), 200);
  }
}
