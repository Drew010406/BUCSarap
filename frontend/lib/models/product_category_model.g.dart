// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductCategoryResponseModel _$ProductCategoryResponseModelFromJson(
  Map<String, dynamic> json,
) => _ProductCategoryResponseModel(
  categoryID: (json['category_id'] as num?)?.toInt(),
  categoryName: json['category_name'] as String?,
  stallID: (json['stall_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductCategoryResponseModelToJson(
  _ProductCategoryResponseModel instance,
) => <String, dynamic>{
  'category_id': instance.categoryID,
  'category_name': instance.categoryName,
  'stall_id': instance.stallID,
};
