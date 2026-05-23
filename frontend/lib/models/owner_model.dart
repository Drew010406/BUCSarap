import 'package:freezed_annotation/freezed_annotation.dart';

part 'owner_model.freezed.dart';

part 'owner_model.g.dart';

@freezed
abstract class OwnerModel with _$OwnerModel {
  const factory OwnerModel({
    @JsonKey(name: "owner_username") String? ownerUsername,
    @JsonKey(name: "hashed_password") String? password,
  }) = _OwnerModel;

  factory OwnerModel.fromJson(Map<String, dynamic> json) =>
      _$OwnerModelFromJson(json);
}
