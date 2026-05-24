// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_line_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderLineModel _$OrderLineModelFromJson(Map<String, dynamic> json) =>
    _OrderLineModel(
      orderID: (json['order_id'] as num?)?.toInt(),
      productID: (json['product_id'] as num?)?.toInt(),
      productName: json['product_name'] as String?,
      quantityOrdered: (json['quantity_ordered'] as num?)?.toInt(),
      unitPriceAtOrder: (json['unit_price_at_order'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OrderLineModelToJson(_OrderLineModel instance) =>
    <String, dynamic>{
      'order_id': instance.orderID,
      'product_id': instance.productID,
      'product_name': instance.productName,
      'quantity_ordered': instance.quantityOrdered,
      'unit_price_at_order': instance.unitPriceAtOrder,
    };
