// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stall_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StallResponseModel _$StallResponseModelFromJson(Map<String, dynamic> json) =>
    _StallResponseModel(
      stallID: (json['stall_id'] as num?)?.toInt(),
      stallName: json['stall_name'] as String?,
      ownerID: (json['owner_id'] as num?)?.toInt(),
      openingTime: json['opening_time'] as String?,
      closingTime: json['closing_time'] as String?,
      operatingDays: json['operating_days'] as String?,
      stallStatus: json['stall_status'] as bool? ?? false,
      photoPath: json['photo_path'] as String?,
    );

Map<String, dynamic> _$StallResponseModelToJson(_StallResponseModel instance) =>
    <String, dynamic>{
      'stall_id': instance.stallID,
      'stall_name': instance.stallName,
      'owner_id': instance.ownerID,
      'opening_time': instance.openingTime,
      'closing_time': instance.closingTime,
      'operating_days': instance.operatingDays,
      'stall_status': instance.stallStatus,
      'photo_path': instance.photoPath,
    };

_CategoryInfoModel _$CategoryInfoModelFromJson(Map<String, dynamic> json) =>
    _CategoryInfoModel(
      categoryID: (json['category_id'] as num?)?.toInt(),
      categoryName: json['category_name'] as String?,
    );

Map<String, dynamic> _$CategoryInfoModelToJson(_CategoryInfoModel instance) =>
    <String, dynamic>{
      'category_id': instance.categoryID,
      'category_name': instance.categoryName,
    };

_StallUpdateModel _$StallUpdateModelFromJson(Map<String, dynamic> json) =>
    _StallUpdateModel(
      stallName: json['stall_name'] as String?,
      openingTime: json['opening_time'] as String?,
      closingTime: json['closing_time'] as String?,
      operatingDays: json['operating_days'] as String?,
      stallStatus: json['stall_status'] as bool? ?? false,
      photoPath: json['photo_path'] as String?,
    );

Map<String, dynamic> _$StallUpdateModelToJson(_StallUpdateModel instance) =>
    <String, dynamic>{
      'stall_name': instance.stallName,
      'opening_time': instance.openingTime,
      'closing_time': instance.closingTime,
      'operating_days': instance.operatingDays,
      'stall_status': instance.stallStatus,
      'photo_path': instance.photoPath,
    };

_StallWithCategories _$StallWithCategoriesFromJson(Map<String, dynamic> json) =>
    _StallWithCategories(
      stallId: (json['stall_id'] as num).toInt(),
      stallName: json['stall_name'] as String,
      ownerId: (json['owner_id'] as num).toInt(),
      openingTime: json['opening_time'] as String,
      closingTime: json['closing_time'] as String,
      operatingDays: json['operating_days'] as String,
      stallStatus: json['stall_status'] as bool,
      photoPath: json['photo_path'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StallWithCategoriesToJson(
  _StallWithCategories instance,
) => <String, dynamic>{
  'stall_id': instance.stallId,
  'stall_name': instance.stallName,
  'owner_id': instance.ownerId,
  'opening_time': instance.openingTime,
  'closing_time': instance.closingTime,
  'operating_days': instance.operatingDays,
  'stall_status': instance.stallStatus,
  'photo_path': instance.photoPath,
  'categories': instance.categories,
};
