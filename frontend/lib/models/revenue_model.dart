import 'package:freezed_annotation/freezed_annotation.dart';

part 'revenue_model.freezed.dart';

part 'revenue_model.g.dart';

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
