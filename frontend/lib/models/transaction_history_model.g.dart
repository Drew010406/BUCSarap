// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionHistoryModel _$TransactionHistoryModelFromJson(
  Map<String, dynamic> json,
) => _TransactionHistoryModel(
  orderID: (json['order_id'] as num?)?.toInt(),
  customerName: json['customer_name'] as String?,
  orderNumber: json['order_number'] as String?,
);

Map<String, dynamic> _$TransactionHistoryModelToJson(
  _TransactionHistoryModel instance,
) => <String, dynamic>{
  'order_id': instance.orderID,
  'customer_name': instance.customerName,
  'order_number': instance.orderNumber,
};
