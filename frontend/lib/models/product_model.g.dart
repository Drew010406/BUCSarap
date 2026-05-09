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
  productPrice: (json['product_price'] as num?)?.toDouble(),
  productStatus: json[' product_status'] as bool? ?? false,
  categoryID: (json['category_id '] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductResponseModelToJson(
  _ProductResponseModel instance,
) => <String, dynamic>{
  'product_id': instance.productID,
  'product_name': instance.productName,
  'product_price': instance.productPrice,
  ' product_status': instance.productStatus,
  'category_id ': instance.categoryID,
};

_ProductWithDetailsModel _$ProductWithDetailsModelFromJson(
  Map<String, dynamic> json,
) => _ProductWithDetailsModel(
  productID: (json['product_id'] as num?)?.toInt(),
  productName: json['product_name'] as String?,
  productPrice: (json['product_price'] as num?)?.toDouble(),
  photoPath: json['photo_path'] as String?,
  productQuantity: (json['product_quantity'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductWithDetailsModelToJson(
  _ProductWithDetailsModel instance,
) => <String, dynamic>{
  'product_id': instance.productID,
  'product_name': instance.productName,
  'product_price': instance.productPrice,
  'photo_path': instance.photoPath,
  'product_quantity': instance.productQuantity,
};
