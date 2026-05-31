// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../order_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderDetailsModel _$OrderDetailsModelFromJson(Map<String, dynamic> json) =>
    _OrderDetailsModel(
      customerName: json['customer_name'] as String?,
      orderNumber: json['order_number'] as String?,
      orderStatus: json['order_status'] as String?,
      orderTime: json['order_date'] as String?,
      totalCost: _parseDouble(json['total_cost']),
      items: (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                QueueOrderLineResponseModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$OrderDetailsModelToJson(_OrderDetailsModel instance) =>
    <String, dynamic>{
      'customer_name': instance.customerName,
      'order_number': instance.orderNumber,
      'order_status': instance.orderStatus,
      'order_date': instance.orderTime,
      'total_cost': instance.totalCost,
      'items': instance.items,
    };

_QueueOrderLineResponseModel _$QueueOrderLineResponseModelFromJson(
  Map<String, dynamic> json,
) => _QueueOrderLineResponseModel(
  productName: json['product_name'] as String?,
  quantityOrdered: _parseInt(json['quantity_ordered']),
);

Map<String, dynamic> _$QueueOrderLineResponseModelToJson(
  _QueueOrderLineResponseModel instance,
) => <String, dynamic>{
  'product_name': instance.productName,
  'quantity_ordered': instance.quantityOrdered,
};
