// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductResponseModel _$ProductResponseModelFromJson(
  Map<String, dynamic> json,
) => _ProductResponseModel(
  productID: (json['product_id'] as num?)?.toInt(),
  productName: json['product_name'] as String?,
  productPrice: _parseDouble(json['product_price']),
  productStatus: json['product_status'] as bool? ?? false,
  productQuantity: (json['product_quantity'] as num?)?.toInt(),
  photoPath: json['photo_path'] as String?,
  stallID: (json['stall_id'] as num?)?.toInt(),
  stallName: json['stall_name'] as String?,
  categoryID: (json['category_id'] as num?)?.toInt(),
  categoryName: json['category_name'] as String?,
);

Map<String, dynamic> _$ProductResponseModelToJson(
  _ProductResponseModel instance,
) => <String, dynamic>{
  'product_id': instance.productID,
  'product_name': instance.productName,
  'product_price': instance.productPrice,
  'product_status': instance.productStatus,
  'product_quantity': instance.productQuantity,
  'photo_path': instance.photoPath,
  'stall_id': instance.stallID,
  'stall_name': instance.stallName,
  'category_id': instance.categoryID,
  'category_name': instance.categoryName,
};
