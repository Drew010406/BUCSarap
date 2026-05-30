import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_category_model.freezed.dart';
part 'product_category_model.g.dart';

@freezed
abstract class ProductCategoryResponseModel with _$ProductCategoryResponseModel {
  const factory ProductCategoryResponseModel({
    @JsonKey(name: "category_id") int? categoryID,
    @JsonKey(name: "category_name") String? categoryName,
    @JsonKey(name: "stall_id") int? stallID,
  }) = _ProductCategoryResponseModel;

  factory ProductCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryResponseModelFromJson(json);
}