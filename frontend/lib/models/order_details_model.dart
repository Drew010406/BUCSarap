import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_details_model.freezed.dart';

part 'order_details_model.g.dart';

@freezed
abstract class OrderDetailsModel with _$OrderDetailsModel {
  const factory OrderDetailsModel({
    @JsonKey(name: "customer_name") String? customerName,
    @JsonKey(name: "order_number") String? orderNumber,
    @JsonKey(name: "order_status") String? orderStatus,
    @JsonKey(name: "order_time") DateTime? orderTime,
    @JsonKey(name: "total_cost") double? totalCost,
    @JsonKey(name: "items") List<QueueOrderLineResponseModel>? items,
  }) = _OrderDetailsModel;

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsModelFromJson(json);
}

@freezed
abstract class QueueOrderLineResponseModel with _$QueueOrderLineResponseModel {
  const factory QueueOrderLineResponseModel({
    @JsonKey(name: "product_name") String? productName,
    @JsonKey(name: "quantity_ordered") int? quantityOrdered,
  }) = _QueueOrderLineResponseModel;

  factory QueueOrderLineResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QueueOrderLineResponseModelFromJson(json);
}
