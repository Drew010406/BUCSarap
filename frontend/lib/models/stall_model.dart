import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/stall_model.freezed.dart';
part '_g/stall_model.g.dart';

@freezed
abstract class StallResponseModel with _$StallResponseModel {
  const factory StallResponseModel({
    @JsonKey(name: "stall_id") int? stallID,
    @JsonKey(name: "stall_name") String? stallName,
    @JsonKey(name: "owner_id") int? ownerID,
    @JsonKey(name: "opening_time") String? openingTime,
    @JsonKey(name: "closing_time") String? closingTime,
    @JsonKey(name: "operating_days") String? operatingDays,
    @JsonKey(name: "stall_status") @Default(false) bool stallStatus,
    @JsonKey(name: "photo_path") String? photoPath,
  }) = _StallResponseModel;

  factory StallResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StallResponseModelFromJson(json);
}

@freezed
abstract class CategoryInfoModel with _$CategoryInfoModel {
  const factory CategoryInfoModel({
    @JsonKey(name: "category_id") int? categoryID,
    @JsonKey(name: "category_name") String? categoryName,
  }) = _CategoryInfoModel;

  factory CategoryInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryInfoModelFromJson(json);
}


@freezed
abstract class StallUpdateModel with _$StallUpdateModel {
  const factory StallUpdateModel({
    @JsonKey(name: "stall_name") String? stallName,
    @JsonKey(name: "opening_time") String? openingTime,
    @JsonKey(name: "closing_time") String? closingTime,
    @JsonKey(name: "operating_days") String? operatingDays,
    @JsonKey(name: "stall_status") @Default(false) bool stallStatus,
    @JsonKey(name: "photo_path") String? photoPath,
  }) = _StallUpdateModel;

  factory StallUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$StallUpdateModelFromJson(json);
}

@freezed
abstract class StallWithCategories with _$StallWithCategories {
  const factory StallWithCategories({
    @JsonKey(name: 'stall_id') int? stallId,
    @JsonKey(name: 'stall_name') String? stallName,
    @Default([]) List<CategoryInfoModel> categories,
  }) = _StallWithCategories;

  factory StallWithCategories.fromJson(Map<String, dynamic> json) =>
      _$StallWithCategoriesFromJson(json);
}