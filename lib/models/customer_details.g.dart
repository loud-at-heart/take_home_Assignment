// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDetails _$CustomerDetailsFromJson(Map<String, dynamic> json) =>
    CustomerDetails(
      statusCode: json['statusCode'] as int?,
      statusMessage: json['statusMessage'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      tid: json['tid'] as String?,
      sid: json['sid'] as String?,
      deviceId: json['deviceId'] as String?,
    );

Map<String, dynamic> _$CustomerDetailsToJson(CustomerDetails instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'data': instance.data,
      'tid': instance.tid,
      'sid': instance.sid,
      'deviceId': instance.deviceId,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      preferences: json['preferences'] == null
          ? null
          : Preferences.fromJson(json['preferences'] as Map<String, dynamic>),
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => Addresses.fromJson(e as Map<String, dynamic>))
          .toList(),
      swiggyOneDeviceLimit: json['swiggyOneDeviceLimit'] as String?,
      verified: json['verified'] as bool?,
      mobile: json['mobile'] as String?,
      otp: json['otp'] as String?,
      attempt: json['attempt'] as int?,
      token: json['token'] as String?,
      emailVerified: json['emailVerified'] as bool?,
      swiggyOneAbuseBreach: json['swiggyOneAbuseBreach'] as bool?,
      signupSource: json['signupSource'] as String?,
      referralCode: json['referralCode'] as String?,
      name: json['name'] as String?,
      hasWallet: json['hasWallet'] as bool?,
      customerId: json['customerId'] as String?,
      email: json['email'] as String?,
      mobileUpdateVerified: json['mobileUpdateVerified'] as bool?,
      totalOrders: json['total_orders'] as int?,
      customerCareNumber: json['customer_care_number'] as String?,
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => Orders.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'preferences': instance.preferences,
      'addresses': instance.addresses,
      'swiggyOneDeviceLimit': instance.swiggyOneDeviceLimit,
      'verified': instance.verified,
      'mobile': instance.mobile,
      'otp': instance.otp,
      'attempt': instance.attempt,
      'token': instance.token,
      'emailVerified': instance.emailVerified,
      'swiggyOneAbuseBreach': instance.swiggyOneAbuseBreach,
      'signupSource': instance.signupSource,
      'referralCode': instance.referralCode,
      'name': instance.name,
      'hasWallet': instance.hasWallet,
      'customerId': instance.customerId,
      'email': instance.email,
      'mobileUpdateVerified': instance.mobileUpdateVerified,
      'total_orders': instance.totalOrders,
      'customer_care_number': instance.customerCareNumber,
      'orders': instance.orders,
    };

Preferences _$PreferencesFromJson(Map<String, dynamic> json) => Preferences(
      sms: json['sms'] as bool?,
    );

Map<String, dynamic> _$PreferencesToJson(Preferences instance) =>
    <String, dynamic>{
      'sms': instance.sms,
    };

Addresses _$AddressesFromJson(Map<String, dynamic> json) => Addresses(
      area: json['area'] as String?,
      updatedOn: json['updatedOn'] as String?,
      annotation: json['annotation'] as String?,
      address: json['address'] as String?,
      reverseGeoCodeFailed: json['reverseGeoCodeFailed'] as bool?,
      lng: json['lng'] as String?,
      city: json['city'] as String?,
      mobile: json['mobile'] as String?,
      isEdited: json['isEdited'] as String?,
      defaultVal: json['default'] as String?,
      isDeleted: json['isDeleted'] as String?,
      flatNo: json['flatNo'] as String?,
      createdOn: json['createdOn'] as String?,
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      updatedBy: json['updatedBy'] as String?,
      id: json['id'] as String?,
      landmark: json['landmark'] as String?,
      lat: json['lat'] as String?,
    );

Map<String, dynamic> _$AddressesToJson(Addresses instance) => <String, dynamic>{
      'area': instance.area,
      'updatedOn': instance.updatedOn,
      'annotation': instance.annotation,
      'address': instance.address,
      'reverseGeoCodeFailed': instance.reverseGeoCodeFailed,
      'lng': instance.lng,
      'city': instance.city,
      'mobile': instance.mobile,
      'isEdited': instance.isEdited,
      'default': instance.defaultVal,
      'isDeleted': instance.isDeleted,
      'flatNo': instance.flatNo,
      'createdOn': instance.createdOn,
      'userId': instance.userId,
      'name': instance.name,
      'updatedBy': instance.updatedBy,
      'id': instance.id,
      'landmark': instance.landmark,
      'lat': instance.lat,
    };
