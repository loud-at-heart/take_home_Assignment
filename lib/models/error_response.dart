import 'package:json_annotation/json_annotation.dart';
part "error_response.g.dart";

@JsonSerializable(createToJson: false)
class ErrorResponse {
  Error? error;

  ErrorResponse();

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class Error {
  String? errorCode;
  String? type;
  String? message;
  int? code;

  Error();

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
}
