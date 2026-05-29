// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revenue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RevenueModel _$RevenueModelFromJson(Map<String, dynamic> json) =>
    _RevenueModel(
      stallName: json['stall_name'] as String?,
      stallID: (json['stall_id'] as num?)?.toInt(),
      stallRevenue: _parseDouble(json['stall_revenue']),
    );

Map<String, dynamic> _$RevenueModelToJson(_RevenueModel instance) =>
    <String, dynamic>{
      'stall_name': instance.stallName,
      'stall_id': instance.stallID,
      'stall_revenue': instance.stallRevenue,
    };
