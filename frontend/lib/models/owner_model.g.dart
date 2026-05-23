// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OwnerModel _$OwnerModelFromJson(Map<String, dynamic> json) => _OwnerModel(
  ownerUsername: json['owner_username'] as String?,
  password: json['hashed_password'] as String?,
);

Map<String, dynamic> _$OwnerModelToJson(_OwnerModel instance) =>
    <String, dynamic>{
      'owner_username': instance.ownerUsername,
      'hashed_password': instance.password,
    };
