import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/owner_model.freezed.dart';

part '_g/owner_model.g.dart';

@freezed
abstract class OwnerModel with _$OwnerModel {
  const factory OwnerModel({
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "password") String? password,
  }) = _OwnerModel;

  factory OwnerModel.fromJson(Map<String, dynamic> json) =>
      _$OwnerModelFromJson(json);
}
