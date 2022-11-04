// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse()
      ..error = json['error'] == null
          ? null
          : Error.fromJson(json['error'] as Map<String, dynamic>);

Error _$ErrorFromJson(Map<String, dynamic> json) => Error()
  ..errorCode = json['errorCode'] as String?
  ..type = json['type'] as String?
  ..message = json['message'] as String?
  ..code = json['code'] as int?;
