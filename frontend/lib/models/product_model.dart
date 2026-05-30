import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';

part 'product_model.g.dart';

double? _parseDouble(dynamic val) =>
    val == null ? null : double.tryParse(val.toString());

@freezed
abstract class ProductResponseModel with _$ProductResponseModel {
  const factory ProductResponseModel({
    @JsonKey(name: "product_id") int? productID,
    @JsonKey(name: "product_name") String? productName,
    @JsonKey(name: "product_price", fromJson: _parseDouble)
    double? productPrice,
    @JsonKey(name: "product_status") @Default(false) bool productStatus,
    @JsonKey(name: "photo_path") String? photoPath,
    @JsonKey(name: "stall_id") int? stallID,
    @JsonKey(name: "stall_name") String? stallName,
    @JsonKey(name: "category_id") int? categoryID,
    @JsonKey(name: "category_name") String? categoryName,
  }) = _ProductResponseModel;

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseModelFromJson(json);
}

@freezed
abstract class ProductInfoModel with _$ProductInfoModel {
  const factory ProductInfoModel({
    @JsonKey(name: "product_name") String? productName,
    @JsonKey(name: "photo_path") String? photoPath,
  }) = _ProductInfoModel;

  factory ProductInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ProductInfoModelFromJson(json);
}

// product_name: str
// product_price: Decimal
// product_status: bool | None
// photo_path: str
@freezed
abstract class ProductCreateModel with _$ProductCreateModel {
  const factory ProductCreateModel({
    @JsonKey(name: "product_name") String? productName,
    @JsonKey(name: "product_price", fromJson: _parseDouble)
    double? productPrice,
    @JsonKey(name: "product_status") bool? productStatus,
    @JsonKey(name: "photo_path") String? photoPath,
  }) = _ProductCreateModel;

  factory ProductCreateModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCreateModelFromJson(json);
}

// product_id : Optional[int] = None
// category_id : Optional[int] = None
// product_name: Optional[str] = None
// product_price: Optional[Decimal] = None
// product_status: Optional[bool] = None
// photo_path: Optional[str] = None
@freezed
abstract class ProductUpdateModel with _$ProductUpdateModel {
  const factory ProductUpdateModel({
    @JsonKey(name: "product_id") int? productID,
    @JsonKey(name: "category_id") int? categoryID,
    @JsonKey(name: "product_name") String? productName,
    @JsonKey(name: "product_price", fromJson: _parseDouble)
    double? productPrice,
    @JsonKey(name: "product_status") @Default(false) bool productStatus,
    @JsonKey(name: "photo_path") String? photoPath,
  }) = _ProductUpdateModel;

  factory ProductUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$ProductUpdateModelFromJson(json);
}