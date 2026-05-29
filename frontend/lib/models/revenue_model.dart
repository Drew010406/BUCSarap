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
    @JsonKey(name: "stall_revenue", fromJson: _parseDouble) double? stallRevenue,
  }) = _RevenueModel;

  factory RevenueModel.fromJson(Map<String, dynamic> json) =>
      _$RevenueModelFromJson(json);
}
