import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_pile_model.freezed.dart';

part 'product_pile_model.g.dart';

@freezed
abstract class ProductPileModel with _$ProductPileModel {
  const factory ProductPileModel({
    @JsonKey(name: "product_id") int? productID,
    @JsonKey(name: "stall_id") int? stallID,
    @JsonKey(name: "product_quantity") int? productsQuantity
  }) = _ProductPileModel;

  factory ProductPileModel.fromJson(Map<String, dynamic> json) =>
      _$ProductPileModelFromJson(json);
}
