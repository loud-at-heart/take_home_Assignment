import 'package:json_annotation/json_annotation.dart';

part "error_response.g.dart";

@JsonSerializable(createToJson: false)
class ErrorResponse {
  ErrorResponse();

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
  Error? error;
}

@JsonSerializable(createToJson: false)
class Error {
  Error();

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
  String? errorCode;
  String? type;
  String? message;
  int? code;
}
