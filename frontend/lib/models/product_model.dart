import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductResponseModel with _$ProductResponseModel {
  const factory ProductResponseModel({
    @JsonKey(name: "product_id") int? productID,
    @JsonKey(name: "product_name") String? productName,
    @JsonKey(name: "product_price") double? productPrice,
    @JsonKey(name: " product_status") @Default(false) bool productStatus,
    @JsonKey(name: "category_id ") int? categoryID,
  }) = _ProductResponseModel;

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseModelFromJson(json);
}

@freezed
abstract class ProductWithDetailsModel with _$ProductWithDetailsModel {
  const factory ProductWithDetailsModel({
    @JsonKey(name: "product_id") int? productID,
    @JsonKey(name: "product_name") String? productName,
    @JsonKey(name: "product_price") double? productPrice,
    @JsonKey(name: "photo_path") String? photoPath,
    @JsonKey(name: "product_quantity") int? productQuantity,
  }) = _ProductWithDetailsModel;

  factory ProductWithDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductWithDetailsModelFromJson(json);
}
