import 'package:json_annotation/json_annotation.dart';

import 'order_details.dart';

part "customer_details.g.dart";

@JsonSerializable()
class CustomerDetails {
  CustomerDetails(
      {this.statusCode,
      this.statusMessage,
      this.data,
      this.tid,
      this.sid,
      this.deviceId});

  factory CustomerDetails.fromJson(Map<String, dynamic> json) =>
      _$CustomerDetailsFromJson(json);
  int? statusCode;
  String? statusMessage;
  Data? data;
  String? tid;
  String? sid;
  String? deviceId;

  Map<String, dynamic> toJson() => _$CustomerDetailsToJson(this);
}

@JsonSerializable()
class Data {
  Data(
      {this.preferences,
      this.addresses,
      this.swiggyOneDeviceLimit,
      this.verified,
      this.mobile,
      this.otp,
      this.attempt,
      this.token,
      this.emailVerified,
      this.swiggyOneAbuseBreach,
      this.signupSource,
      this.referralCode,
      this.name,
      this.hasWallet,
      this.customerId,
      this.email,
      this.mobileUpdateVerified,
      this.totalOrders,
      this.customerCareNumber,
      this.orders});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Preferences? preferences;
  List<Addresses>? addresses;
  String? swiggyOneDeviceLimit;
  bool? verified;
  String? mobile;
  String? otp;
  int? attempt;
  String? token;
  bool? emailVerified;
  bool? swiggyOneAbuseBreach;
  String? signupSource;
  String? referralCode;
  String? name;
  bool? hasWallet;
  String? customerId;
  String? email;
  bool? mobileUpdateVerified;
  @JsonKey(name: 'total_orders')
  int? totalOrders;
  @JsonKey(name: 'customer_care_number')
  String? customerCareNumber;
  List<Orders>? orders;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Preferences {
  Preferences({this.sms});

  factory Preferences.fromJson(Map<String, dynamic> json) =>
      _$PreferencesFromJson(json);
  bool? sms;

  Map<String, dynamic> toJson() => _$PreferencesToJson(this);
}

@JsonSerializable()
class Addresses {
  Addresses(
      {this.area,
      this.updatedOn,
      this.annotation,
      this.address,
      this.reverseGeoCodeFailed,
      this.lng,
      this.city,
      this.mobile,
      this.isEdited,
      this.defaultVal,
      this.isDeleted,
      this.flatNo,
      this.createdOn,
      this.userId,
      this.name,
      this.updatedBy,
      this.id,
      this.landmark,
      this.lat});

  factory Addresses.fromJson(Map<String, dynamic> json) =>
      _$AddressesFromJson(json);
  String? area;
  String? updatedOn;
  String? annotation;
  String? address;
  bool? reverseGeoCodeFailed;
  String? lng;
  String? city;
  String? mobile;
  String? isEdited;
  @JsonKey(name: 'default')
  String? defaultVal;
  String? isDeleted;
  String? flatNo;
  String? createdOn;
  String? userId;
  String? name;
  String? updatedBy;
  String? id;
  String? landmark;
  String? lat;

  Map<String, dynamic> toJson() => _$AddressesToJson(this);
}
