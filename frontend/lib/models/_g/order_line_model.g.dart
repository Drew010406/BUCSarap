// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../order_line_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderLineModel _$OrderLineModelFromJson(Map<String, dynamic> json) =>
    _OrderLineModel(
      productID: (json['product_id'] as num?)?.toInt(),
      productName: json['product_name'] as String?,
      quantityOrdered: (json['quantity_ordered'] as num?)?.toInt(),
      unitPriceAtOrder: (json['unit_price_order'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OrderLineModelToJson(_OrderLineModel instance) =>
    <String, dynamic>{
      'product_id': instance.productID,
      'product_name': instance.productName,
      'quantity_ordered': instance.quantityOrdered,
      'unit_price_order': instance.unitPriceAtOrder,
    };
