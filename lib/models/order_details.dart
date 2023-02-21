import 'package:json_annotation/json_annotation.dart';

part "order_details.g.dart";

@JsonSerializable()
class Orders {
  Orders(
      {this.orderId,
      this.deliveryAddress,
      this.orderItems,
      this.restaurantId,
      this.restaurantName,
      this.restaurantAddress,
      this.restaurantLocality,
      this.restaurantType,
      this.restaurantCityCode,
      this.restaurantCityName,
      this.restaurantAreaCode,
      this.restaurantCuisine,
      this.restaurantClosingInMin,
      this.restaurantClosed,
      this.paymentMethod,
      this.paymentMethodInvolved,
      this.paymentTxnCreatedOn,
      this.paymentTransactions,
      this.orderDeliveryStatus,
      this.orderedTimeInSeconds,
      this.deliveredTimeInSeconds,
      this.deliveryTimeInSeconds,
      this.orderTotal,
      this.orderTotalWithTip,
      this.netTotal,
      this.itemTotal,
      this.restaurantFulfilmentCharges});

  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);

  @JsonKey(name: 'order_id')
  int? orderId;
  @JsonKey(name: 'delivery_address')
  DeliveryAddress? deliveryAddress;
  @JsonKey(name: 'order_items')
  List<OrderItems>? orderItems;
  @JsonKey(name: 'restaurant_id')
  String? restaurantId;
  @JsonKey(name: 'restaurant_name')
  String? restaurantName;
  @JsonKey(name: 'restaurant_address')
  String? restaurantAddress;
  @JsonKey(name: 'restaurant_locality')
  String? restaurantLocality;
  @JsonKey(name: 'restaurant_type')
  String? restaurantType;
  @JsonKey(name: 'restaurant_city_code')
  String? restaurantCityCode;
  @JsonKey(name: 'restaurant_city_name')
  String? restaurantCityName;
  @JsonKey(name: 'restaurant_area_code')
  String? restaurantAreaCode;
  @JsonKey(name: 'restaurant_cuisine')
  List<String>? restaurantCuisine;
  @JsonKey(name: 'restaurant_closing_in_min')
  int? restaurantClosingInMin;
  @JsonKey(name: 'restaurant_closed')
  bool? restaurantClosed;
  @JsonKey(name: 'payment_method')
  String? paymentMethod;
  @JsonKey(name: 'payment_method_involved')
  String? paymentMethodInvolved;
  @JsonKey(name: 'payment_txn_created_on')
  String? paymentTxnCreatedOn;
  @JsonKey(name: 'payment_transactions')
  List<PaymentTransactions>? paymentTransactions;
  @JsonKey(name: 'order_delivery_status')
  String? orderDeliveryStatus;
  @JsonKey(name: 'ordered_time_in_seconds')
  int? orderedTimeInSeconds;
  @JsonKey(name: 'delivered_time_in_seconds')
  String? deliveredTimeInSeconds;
  @JsonKey(name: 'delivery_time_in_seconds')
  String? deliveryTimeInSeconds;
  @JsonKey(name: 'order_total')
  double? orderTotal;
  @JsonKey(name: 'order_total_with_tip')
  double? orderTotalWithTip;
  @JsonKey(name: 'net_total')
  double? netTotal;
  @JsonKey(name: 'item_total')
  double? itemTotal;
  @JsonKey(name: 'restaurant_fulfilment_charges')
  double? restaurantFulfilmentCharges;

  Map<String, dynamic> toJson() => _$OrdersToJson(this);
}

@JsonSerializable()
class DeliveryAddress {
  DeliveryAddress(
      {this.id,
      this.version,
      this.name,
      this.addressLine1,
      this.addressLine2,
      this.address,
      this.landmark,
      this.area,
      this.mobile,
      this.alternateMobile,
      this.annotation,
      this.instructions,
      this.voiceDirectionsS3Uri,
      this.email,
      this.flatNo,
      this.city,
      this.lat,
      this.lng,
      this.isVerified,
      this.reverseGeoCodeFailed});

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) =>
      _$DeliveryAddressFromJson(json);
  String? id;
  double? version;
  String? name;
  @JsonKey(name: 'address_line1')
  String? addressLine1;
  @JsonKey(name: 'address_line2')
  String? addressLine2;
  String? address;
  String? landmark;
  String? area;
  String? mobile;
  @JsonKey(name: 'alternate_mobile')
  String? alternateMobile;
  String? annotation;
  String? instructions;
  @JsonKey(name: 'voice_directions_s3_uri')
  String? voiceDirectionsS3Uri;
  String? email;
  @JsonKey(name: 'flat_no')
  String? flatNo;
  String? city;
  String? lat;
  String? lng;
  @JsonKey(name: 'is_verified')
  bool? isVerified;
  @JsonKey(name: 'reverse_geo_code_failed')
  bool? reverseGeoCodeFailed;

  Map<String, dynamic> toJson() => _$DeliveryAddressToJson(this);
}

@JsonSerializable()
class OrderItems {
  OrderItems(
      {this.name,
      this.isVeg,
      this.variants,
      this.addons,
      this.imageId,
      this.quantity,
      this.freeItemQuantity,
      this.total,
      this.subtotal,
      this.finalPrice,
      this.basePrice,
      this.effectiveItemPrice,
      this.packingCharges,
      this.categoryDetails,
      this.itemCharges,
      this.itemTotalDiscount,
      this.itemDeliveryFeeReversal,
      this.mealQuantity,
      this.singleVariant,
      this.inStock});

  factory OrderItems.fromJson(Map<String, dynamic> json) =>
      _$OrderItemsFromJson(json);
  String? name;
  @JsonKey(name: 'is_veg')
  String? isVeg;
  List<Variants>? variants;
  List<Addons>? addons;
  @JsonKey(name: 'image_id')
  String? imageId;
  String? quantity;
  @JsonKey(name: 'free_item_quantity')
  String? freeItemQuantity;
  String? total;
  String? subtotal;
  @JsonKey(name: 'final_price')
  String? finalPrice;
  @JsonKey(name: 'base_price')
  String? basePrice;
  @JsonKey(name: 'effective_item_price')
  String? effectiveItemPrice;
  @JsonKey(name: 'packing_charges')
  String? packingCharges;
  @JsonKey(name: 'category_details')
  CategoryDetails? categoryDetails;
  @JsonKey(name: 'item_charges')
  ItemCharges? itemCharges;
  @JsonKey(name: 'item_total_discount')
  double? itemTotalDiscount;
  @JsonKey(name: 'item_delivery_fee_reversal')
  int? itemDeliveryFeeReversal;
  @JsonKey(name: 'meal_quantity')
  String? mealQuantity;
  @JsonKey(name: 'single_variant')
  bool? singleVariant;
  @JsonKey(name: 'in_stock')
  int? inStock;

  Map<String, dynamic> toJson() => _$OrderItemsToJson(this);
}

@JsonSerializable()
class Variants {
  Variants(
      {this.variationId,
      this.groupId,
      this.name,
      this.price,
      this.externalChoiceId,
      this.variantTaxCharges});

  factory Variants.fromJson(Map<String, dynamic> json) =>
      _$VariantsFromJson(json);
  @JsonKey(name: 'variation_id')
  int? variationId;
  @JsonKey(name: 'group_id')
  int? groupId;
  String? name;
  double? price;
  @JsonKey(name: 'external_choice_id')
  String? externalChoiceId;
  @JsonKey(name: 'variant_tax_charges')
  VariantTaxCharges? variantTaxCharges;

  Map<String, dynamic> toJson() => _$VariantsToJson(this);
}

@JsonSerializable()
class VariantTaxCharges {
  VariantTaxCharges({this.gST});

  factory VariantTaxCharges.fromJson(Map<String, dynamic> json) =>
      _$VariantTaxChargesFromJson(json);
  @JsonKey(name: 'GST')
  String? gST;

  Map<String, dynamic> toJson() => _$VariantTaxChargesToJson(this);
}

@JsonSerializable()
class Addons {
  Addons(
      {this.choiceId,
      this.groupId,
      this.name,
      this.price,
      this.externalChoiceId,
      this.addonTaxCharges});

  factory Addons.fromJson(Map<String, dynamic> json) => _$AddonsFromJson(json);
  @JsonKey(name: 'choice_id')
  String? choiceId;
  @JsonKey(name: 'group_id')
  String? groupId;
  String? name;
  double? price;
  @JsonKey(name: 'external_choice_id')
  String? externalChoiceId;
  @JsonKey(name: 'addon_tax_charges')
  VariantTaxCharges? addonTaxCharges;

  Map<String, dynamic> toJson() => _$AddonsToJson(this);
}

@JsonSerializable()
class CategoryDetails {
  CategoryDetails({this.category, this.subCategory});

  factory CategoryDetails.fromJson(Map<String, dynamic> json) =>
      _$CategoryDetailsFromJson(json);

  String? category;
  @JsonKey(name: 'sub_category')
  String? subCategory;

  Map<String, dynamic> toJson() => _$CategoryDetailsToJson(this);
}

@JsonSerializable()
class ItemCharges {
  ItemCharges({this.vat, this.serviceCharges, this.serviceTax, this.gST});

  factory ItemCharges.fromJson(Map<String, dynamic> json) =>
      _$ItemChargesFromJson(json);
  @JsonKey(name: 'Vat')
  String? vat;
  @JsonKey(name: 'Service Charges')
  String? serviceCharges;
  @JsonKey(name: 'Service Tax')
  String? serviceTax;
  @JsonKey(name: 'GST')
  String? gST;

  Map<String, dynamic> toJson() => _$ItemChargesToJson(this);
}

@JsonSerializable()
class PaymentTransactions {
  PaymentTransactions(
      {this.paymentMethod,
      this.paymentMethodDisplayName,
      this.transactionId,
      this.amount,
      this.paymentMeta,
      this.transactionStatus,
      this.swiggyTransactionId,
      this.pgTransactionId,
      this.couponApplied,
      this.paymentGateway,
      this.pgResponseTime});

  factory PaymentTransactions.fromJson(Map<String, dynamic> json) =>
      _$PaymentTransactionsFromJson(json);

  String? paymentMethod;
  String? paymentMethodDisplayName;
  String? transactionId;
  String? amount;
  PaymentMeta? paymentMeta;
  String? transactionStatus;
  String? swiggyTransactionId;
  String? pgTransactionId;
  String? couponApplied;
  String? paymentGateway;
  String? pgResponseTime;

  Map<String, dynamic> toJson() => _$PaymentTransactionsToJson(this);
}

@JsonSerializable()
class PaymentMeta {
  PaymentMeta(
      {this.bankName,
      this.binNumber,
      this.pgType,
      this.cardNumber,
      this.payerVpa,
      this.intentApp,
      this.paymentQRUrl,
      this.extPGResponse});

  factory PaymentMeta.fromJson(Map<String, dynamic> json) =>
      _$PaymentMetaFromJson(json);

  String? bankName;
  String? binNumber;
  String? pgType;
  String? cardNumber;
  String? payerVpa;
  String? intentApp;
  String? paymentQRUrl;
  String? extPGResponse;

  Map<String, dynamic> toJson() => _$PaymentMetaToJson(this);
}
