import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/revenue_model.freezed.dart';

part '_g/revenue_model.g.dart';

double? _parseDouble(dynamic val) =>
    val == null ? null : double.tryParse(val.toString());

@freezed
abstract class RevenueModel with _$RevenueModel {
  const factory RevenueModel({
    @JsonKey(name: "stall_name") String? stallName,
    @JsonKey(name: "stall_id") int? stallID,
    @JsonKey(name: "stall_revenue", fromJson: _parseDouble)
    double? stallRevenue,
  }) = _RevenueModel;

  factory RevenueModel.fromJson(Map<String, dynamic> json) =>
      _$RevenueModelFromJson(json);
}

@freezed
abstract class RevenueComparison with _$RevenueComparison {
  const factory RevenueComparison({
    @JsonKey(name: "stall_id") int? stallID,
    @JsonKey(name: "current_revenue", fromJson: _parseDouble)
    double? currentRevenue,
    @JsonKey(name: "previous_revenue", fromJson: _parseDouble)
    double? previousRevenue,
    @JsonKey(name: "revenue_difference", fromJson: _parseDouble)
    double? revenueDifference,
    @JsonKey(name: "percentage_change", fromJson: _parseDouble)
    double? percentageChange,
  }) = _RevenueComparison;

  factory RevenueComparison.fromJson(Map<String, dynamic> json) =>
      _$RevenueComparisonFromJson(json);
}

// order_date : str
// daily_revenue : float
@freezed
abstract class LastTenDaysRevenue with _$LastTenDaysRevenue {
  const factory LastTenDaysRevenue({
    @JsonKey(name: "order_date") String? orderDate,
    @JsonKey(name: "revenue_for_the_day", fromJson: _parseDouble)
    double? dailyRevenue,
  }) = _LastTenDaysRevenue;

  factory LastTenDaysRevenue.fromJson(Map<String, dynamic> json) =>
      _$LastTenDaysRevenueFromJson(json);
}