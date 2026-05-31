// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../revenue_model.dart';

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

_RevenueComparison _$RevenueComparisonFromJson(Map<String, dynamic> json) =>
    _RevenueComparison(
      stallID: (json['stall_id'] as num?)?.toInt(),
      currentRevenue: _parseDouble(json['current_revenue']),
      previousRevenue: _parseDouble(json['previous_revenue']),
      revenueDifference: _parseDouble(json['revenue_difference']),
      percentageChange: _parseDouble(json['percentage_change']),
    );

Map<String, dynamic> _$RevenueComparisonToJson(_RevenueComparison instance) =>
    <String, dynamic>{
      'stall_id': instance.stallID,
      'current_revenue': instance.currentRevenue,
      'previous_revenue': instance.previousRevenue,
      'revenue_difference': instance.revenueDifference,
      'percentage_change': instance.percentageChange,
    };

_LastTenDaysRevenue _$LastTenDaysRevenueFromJson(Map<String, dynamic> json) =>
    _LastTenDaysRevenue(
      orderDate: json['order_date'] as String?,
      dailyRevenue: _parseDouble(json['revenue_for_the_day']),
    );

Map<String, dynamic> _$LastTenDaysRevenueToJson(_LastTenDaysRevenue instance) =>
    <String, dynamic>{
      'order_date': instance.orderDate,
      'revenue_for_the_day': instance.dailyRevenue,
    };
