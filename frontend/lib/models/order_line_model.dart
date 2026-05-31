import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/order_line_model.freezed.dart';

part '_g/order_line_model.g.dart';

@freezed
abstract class OrderLineModel with _$OrderLineModel {
  const factory OrderLineModel({
    @JsonKey(name: "product_id") int? productID,
    @JsonKey(name: "product_name") String? productName,
    @JsonKey(name: "quantity_ordered") int? quantityOrdered,
    @JsonKey(name: "unit_price_order") double? unitPriceAtOrder,

  }) = _OrderLineModel;

  factory OrderLineModel.fromJson(Map<String, dynamic> json) =>
      _$OrderLineModelFromJson(json);
}
