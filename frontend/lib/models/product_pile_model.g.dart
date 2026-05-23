// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_pile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductPileModel _$ProductPileModelFromJson(Map<String, dynamic> json) =>
    _ProductPileModel(
      productID: (json['product_id'] as num?)?.toInt(),
      stallID: (json['stall_id'] as num?)?.toInt(),
      productsQuantity: (json['product_quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductPileModelToJson(_ProductPileModel instance) =>
    <String, dynamic>{
      'product_id': instance.productID,
      'stall_id': instance.stallID,
      'product_quantity': instance.productsQuantity,
    };
