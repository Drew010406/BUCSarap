import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/order_model.freezed.dart';
part '_g/order_model.g.dart';

@freezed
abstract class OrderResponseModel with _$OrderResponseModel {
  const factory OrderResponseModel({
    @JsonKey(name: "order_id") int? orderID,
    @JsonKey(name: "order_number") String? orderNumber,
    @JsonKey(name: "order_status") @Default("pending") String? orderStatus,
    @JsonKey(name: "customer_name") String? customerName,
    @JsonKey(name: "stall_id") int? stallID,
  }) = _OrderResponseModel;

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseModelFromJson(json);
}