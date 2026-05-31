// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../order_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) =>
    _OrderItemModel(
      productID: (json['product_id'] as num?)?.toInt(),
      stallID: (json['stall_id'] as num?)?.toInt(),
      productsQuantity: (json['product_quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OrderItemModelToJson(_OrderItemModel instance) =>
    <String, dynamic>{
      'product_id': instance.productID,
      'stall_id': instance.stallID,
      'product_quantity': instance.productsQuantity,
    };
