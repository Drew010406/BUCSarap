import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/order_item_model.freezed.dart';

part '_g/order_item_model.g.dart';

@freezed
abstract class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
    @JsonKey(name: "product_id") int? productID,
    @JsonKey(name: "stall_id") int? stallID,
    @JsonKey(name: "product_quantity") int? productsQuantity
  }) = _OrderItemModel;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);
}
