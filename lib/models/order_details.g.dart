// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orders _$OrdersFromJson(Map<String, dynamic> json) => Orders(
      orderId: json['order_id'] as int?,
      deliveryAddress: json['delivery_address'] == null
          ? null
          : DeliveryAddress.fromJson(
              json['delivery_address'] as Map<String, dynamic>),
      orderItems: (json['order_items'] as List<dynamic>?)
          ?.map((e) => OrderItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      restaurantId: json['restaurant_id'] as String?,
      restaurantName: json['restaurant_name'] as String?,
      restaurantAddress: json['restaurant_address'] as String?,
      restaurantLocality: json['restaurant_locality'] as String?,
      restaurantType: json['restaurant_type'] as String?,
      restaurantCityCode: json['restaurant_city_code'] as String?,
      restaurantCityName: json['restaurant_city_name'] as String?,
      restaurantAreaCode: json['restaurant_area_code'] as String?,
      restaurantCuisine: (json['restaurant_cuisine'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      restaurantClosingInMin: json['restaurant_closing_in_min'] as int?,
      restaurantClosed: json['restaurant_closed'] as bool?,
      paymentMethod: json['payment_method'] as String?,
      paymentMethodInvolved: json['payment_method_involved'] as String?,
      paymentTxnCreatedOn: json['payment_txn_created_on'] as String?,
      paymentTransactions: (json['payment_transactions'] as List<dynamic>?)
          ?.map((e) => PaymentTransactions.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderDeliveryStatus: json['order_delivery_status'] as String?,
      orderedTimeInSeconds: json['ordered_time_in_seconds'] as int?,
      deliveredTimeInSeconds: json['delivered_time_in_seconds'] as String?,
      deliveryTimeInSeconds: json['delivery_time_in_seconds'] as String?,
      orderTotal: (json['order_total'] as num?)?.toDouble(),
      orderTotalWithTip: (json['order_total_with_tip'] as num?)?.toDouble(),
      netTotal: (json['net_total'] as num?)?.toDouble(),
      itemTotal: (json['item_total'] as num?)?.toDouble(),
      restaurantFulfilmentCharges:
          (json['restaurant_fulfilment_charges'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
      'order_id': instance.orderId,
      'delivery_address': instance.deliveryAddress,
      'order_items': instance.orderItems,
      'restaurant_id': instance.restaurantId,
      'restaurant_name': instance.restaurantName,
      'restaurant_address': instance.restaurantAddress,
      'restaurant_locality': instance.restaurantLocality,
      'restaurant_type': instance.restaurantType,
      'restaurant_city_code': instance.restaurantCityCode,
      'restaurant_city_name': instance.restaurantCityName,
      'restaurant_area_code': instance.restaurantAreaCode,
      'restaurant_cuisine': instance.restaurantCuisine,
      'restaurant_closing_in_min': instance.restaurantClosingInMin,
      'restaurant_closed': instance.restaurantClosed,
      'payment_method': instance.paymentMethod,
      'payment_method_involved': instance.paymentMethodInvolved,
      'payment_txn_created_on': instance.paymentTxnCreatedOn,
      'payment_transactions': instance.paymentTransactions,
      'order_delivery_status': instance.orderDeliveryStatus,
      'ordered_time_in_seconds': instance.orderedTimeInSeconds,
      'delivered_time_in_seconds': instance.deliveredTimeInSeconds,
      'delivery_time_in_seconds': instance.deliveryTimeInSeconds,
      'order_total': instance.orderTotal,
      'order_total_with_tip': instance.orderTotalWithTip,
      'net_total': instance.netTotal,
      'item_total': instance.itemTotal,
      'restaurant_fulfilment_charges': instance.restaurantFulfilmentCharges,
    };

DeliveryAddress _$DeliveryAddressFromJson(Map<String, dynamic> json) =>
    DeliveryAddress(
      id: json['id'] as String?,
      version: (json['version'] as num?)?.toDouble(),
      name: json['name'] as String?,
      addressLine1: json['address_line1'] as String?,
      addressLine2: json['address_line2'] as String?,
      address: json['address'] as String?,
      landmark: json['landmark'] as String?,
      area: json['area'] as String?,
      mobile: json['mobile'] as String?,
      alternateMobile: json['alternate_mobile'] as String?,
      annotation: json['annotation'] as String?,
      instructions: json['instructions'] as String?,
      voiceDirectionsS3Uri: json['voice_directions_s3_uri'] as String?,
      email: json['email'] as String?,
      flatNo: json['flat_no'] as String?,
      city: json['city'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      isVerified: json['is_verified'] as bool?,
      reverseGeoCodeFailed: json['reverse_geo_code_failed'] as bool?,
    );

Map<String, dynamic> _$DeliveryAddressToJson(DeliveryAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'name': instance.name,
      'address_line1': instance.addressLine1,
      'address_line2': instance.addressLine2,
      'address': instance.address,
      'landmark': instance.landmark,
      'area': instance.area,
      'mobile': instance.mobile,
      'alternate_mobile': instance.alternateMobile,
      'annotation': instance.annotation,
      'instructions': instance.instructions,
      'voice_directions_s3_uri': instance.voiceDirectionsS3Uri,
      'email': instance.email,
      'flat_no': instance.flatNo,
      'city': instance.city,
      'lat': instance.lat,
      'lng': instance.lng,
      'is_verified': instance.isVerified,
      'reverse_geo_code_failed': instance.reverseGeoCodeFailed,
    };

OrderItems _$OrderItemsFromJson(Map<String, dynamic> json) => OrderItems(
      name: json['name'] as String?,
      isVeg: json['is_veg'] as String?,
      variants: (json['variants'] as List<dynamic>?)
          ?.map((e) => Variants.fromJson(e as Map<String, dynamic>))
          .toList(),
      addons: (json['addons'] as List<dynamic>?)
          ?.map((e) => Addons.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageId: json['image_id'] as String?,
      quantity: json['quantity'] as String?,
      freeItemQuantity: json['free_item_quantity'] as String?,
      total: json['total'] as String?,
      subtotal: json['subtotal'] as String?,
      finalPrice: json['final_price'] as String?,
      basePrice: json['base_price'] as String?,
      effectiveItemPrice: json['effective_item_price'] as String?,
      packingCharges: json['packing_charges'] as String?,
      categoryDetails: json['category_details'] == null
          ? null
          : CategoryDetails.fromJson(
              json['category_details'] as Map<String, dynamic>),
      itemCharges: json['item_charges'] == null
          ? null
          : ItemCharges.fromJson(json['item_charges'] as Map<String, dynamic>),
      itemTotalDiscount: (json['item_total_discount'] as num?)?.toDouble(),
      itemDeliveryFeeReversal: json['item_delivery_fee_reversal'] as int?,
      mealQuantity: json['meal_quantity'] as String?,
      singleVariant: json['single_variant'] as bool?,
      inStock: json['in_stock'] as int?,
    );

Map<String, dynamic> _$OrderItemsToJson(OrderItems instance) =>
    <String, dynamic>{
      'name': instance.name,
      'is_veg': instance.isVeg,
      'variants': instance.variants,
      'addons': instance.addons,
      'image_id': instance.imageId,
      'quantity': instance.quantity,
      'free_item_quantity': instance.freeItemQuantity,
      'total': instance.total,
      'subtotal': instance.subtotal,
      'final_price': instance.finalPrice,
      'base_price': instance.basePrice,
      'effective_item_price': instance.effectiveItemPrice,
      'packing_charges': instance.packingCharges,
      'category_details': instance.categoryDetails,
      'item_charges': instance.itemCharges,
      'item_total_discount': instance.itemTotalDiscount,
      'item_delivery_fee_reversal': instance.itemDeliveryFeeReversal,
      'meal_quantity': instance.mealQuantity,
      'single_variant': instance.singleVariant,
      'in_stock': instance.inStock,
    };

Variants _$VariantsFromJson(Map<String, dynamic> json) => Variants(
      variationId: json['variation_id'] as int?,
      groupId: json['group_id'] as int?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      externalChoiceId: json['external_choice_id'] as String?,
      variantTaxCharges: json['variant_tax_charges'] == null
          ? null
          : VariantTaxCharges.fromJson(
              json['variant_tax_charges'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VariantsToJson(Variants instance) => <String, dynamic>{
      'variation_id': instance.variationId,
      'group_id': instance.groupId,
      'name': instance.name,
      'price': instance.price,
      'external_choice_id': instance.externalChoiceId,
      'variant_tax_charges': instance.variantTaxCharges,
    };

VariantTaxCharges _$VariantTaxChargesFromJson(Map<String, dynamic> json) =>
    VariantTaxCharges(
      gST: json['GST'] as String?,
    );

Map<String, dynamic> _$VariantTaxChargesToJson(VariantTaxCharges instance) =>
    <String, dynamic>{
      'GST': instance.gST,
    };

Addons _$AddonsFromJson(Map<String, dynamic> json) => Addons(
      choiceId: json['choice_id'] as String?,
      groupId: json['group_id'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      externalChoiceId: json['external_choice_id'] as String?,
      addonTaxCharges: json['addon_tax_charges'] == null
          ? null
          : VariantTaxCharges.fromJson(
              json['addon_tax_charges'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddonsToJson(Addons instance) => <String, dynamic>{
      'choice_id': instance.choiceId,
      'group_id': instance.groupId,
      'name': instance.name,
      'price': instance.price,
      'external_choice_id': instance.externalChoiceId,
      'addon_tax_charges': instance.addonTaxCharges,
    };

CategoryDetails _$CategoryDetailsFromJson(Map<String, dynamic> json) =>
    CategoryDetails(
      category: json['category'] as String?,
      subCategory: json['sub_category'] as String?,
    );

Map<String, dynamic> _$CategoryDetailsToJson(CategoryDetails instance) =>
    <String, dynamic>{
      'category': instance.category,
      'sub_category': instance.subCategory,
    };

ItemCharges _$ItemChargesFromJson(Map<String, dynamic> json) => ItemCharges(
      vat: json['Vat'] as String?,
      serviceCharges: json['Service Charges'] as String?,
      serviceTax: json['Service Tax'] as String?,
      gST: json['GST'] as String?,
    );

Map<String, dynamic> _$ItemChargesToJson(ItemCharges instance) =>
    <String, dynamic>{
      'Vat': instance.vat,
      'Service Charges': instance.serviceCharges,
      'Service Tax': instance.serviceTax,
      'GST': instance.gST,
    };

PaymentTransactions _$PaymentTransactionsFromJson(Map<String, dynamic> json) =>
    PaymentTransactions(
      paymentMethod: json['paymentMethod'] as String?,
      paymentMethodDisplayName: json['paymentMethodDisplayName'] as String?,
      transactionId: json['transactionId'] as String?,
      amount: json['amount'] as String?,
      paymentMeta: json['paymentMeta'] == null
          ? null
          : PaymentMeta.fromJson(json['paymentMeta'] as Map<String, dynamic>),
      transactionStatus: json['transactionStatus'] as String?,
      swiggyTransactionId: json['swiggyTransactionId'] as String?,
      pgTransactionId: json['pgTransactionId'] as String?,
      couponApplied: json['couponApplied'] as String?,
      paymentGateway: json['paymentGateway'] as String?,
      pgResponseTime: json['pgResponseTime'] as String?,
    );

Map<String, dynamic> _$PaymentTransactionsToJson(
        PaymentTransactions instance) =>
    <String, dynamic>{
      'paymentMethod': instance.paymentMethod,
      'paymentMethodDisplayName': instance.paymentMethodDisplayName,
      'transactionId': instance.transactionId,
      'amount': instance.amount,
      'paymentMeta': instance.paymentMeta,
      'transactionStatus': instance.transactionStatus,
      'swiggyTransactionId': instance.swiggyTransactionId,
      'pgTransactionId': instance.pgTransactionId,
      'couponApplied': instance.couponApplied,
      'paymentGateway': instance.paymentGateway,
      'pgResponseTime': instance.pgResponseTime,
    };

PaymentMeta _$PaymentMetaFromJson(Map<String, dynamic> json) => PaymentMeta(
      bankName: json['bankName'] as String?,
      binNumber: json['binNumber'] as String?,
      pgType: json['pgType'] as String?,
      cardNumber: json['cardNumber'] as String?,
      payerVpa: json['payerVpa'] as String?,
      intentApp: json['intentApp'] as String?,
      paymentQRUrl: json['paymentQRUrl'] as String?,
      extPGResponse: json['extPGResponse'] as String?,
    );

Map<String, dynamic> _$PaymentMetaToJson(PaymentMeta instance) =>
    <String, dynamic>{
      'bankName': instance.bankName,
      'binNumber': instance.binNumber,
      'pgType': instance.pgType,
      'cardNumber': instance.cardNumber,
      'payerVpa': instance.payerVpa,
      'intentApp': instance.intentApp,
      'paymentQRUrl': instance.paymentQRUrl,
      'extPGResponse': instance.extPGResponse,
    };
