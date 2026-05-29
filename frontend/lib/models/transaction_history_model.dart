import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_history_model.freezed.dart';

part 'transaction_history_model.g.dart';

@freezed
abstract class TransactionHistoryModel with _$TransactionHistoryModel {
  const factory TransactionHistoryModel({
    @JsonKey(name: "order_id") int? orderID,
    @JsonKey(name: "customer_name") String? customerName,
    @JsonKey(name: "order_number") String? orderNumber,
  }) = _TransactionHistoryModel;

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryModelFromJson(json);
}
