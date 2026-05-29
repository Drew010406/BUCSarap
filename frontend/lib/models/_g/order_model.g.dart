// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderResponseModel _$OrderResponseModelFromJson(Map<String, dynamic> json) =>
    _OrderResponseModel(
      orderID: (json['order_id'] as num?)?.toInt(),
      orderNumber: json['order_number'] as String?,
      orderStatus: json['order_status'] as String? ?? "pending",
      customerName: json['customer_name'] as String?,
      stallID: (json['stall_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OrderResponseModelToJson(_OrderResponseModel instance) =>
    <String, dynamic>{
      'order_id': instance.orderID,
      'order_number': instance.orderNumber,
      'order_status': instance.orderStatus,
      'customer_name': instance.customerName,
      'stall_id': instance.stallID,
    };
