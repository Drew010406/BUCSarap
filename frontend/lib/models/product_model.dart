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
    @JsonKey(name: "product_price", fromJson: _parseDouble) double? productPrice,
    @JsonKey(name: "product_status") @Default(false) bool productStatus,
    @JsonKey(name: "product_quantity") int? productQuantity,
    @JsonKey(name: "photo_path") String? photoPath,
    @JsonKey(name: "stall_id") int? stallID,
    @JsonKey(name: "stall_name") String? stallName,
    @JsonKey(name: "category_id") int? categoryID,
    @JsonKey(name: "category_name") String? categoryName
  }) = _ProductResponseModel;

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseModelFromJson(json);
}

// @freezed
// abstract class ProductWithDetailsModel with _$ProductWithDetailsModel {
//   const factory ProductWithDetailsModel({
//     @JsonKey(name: "product_id") int? productID,
//     @JsonKey(name: "product_name") String? productName,
//     @JsonKey(name: "product_price") double? productPrice,
//   }) = _ProductWithDetailsModel;
//
//   factory ProductWithDetailsModel.fromJson(Map<String, dynamic> json) =>
//       _$ProductWithDetailsModelFromJson(json);
// }
