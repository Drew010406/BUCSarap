// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../owner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OwnerModel {

@JsonKey(name: "username") String? get username;@JsonKey(name: "password") String? get password;
/// Create a copy of OwnerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OwnerModelCopyWith<OwnerModel> get copyWith => _$OwnerModelCopyWithImpl<OwnerModel>(this as OwnerModel, _$identity);

  /// Serializes this OwnerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OwnerModel&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password);

@override
String toString() {
  return 'OwnerModel(username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class $OwnerModelCopyWith<$Res>  {
  factory $OwnerModelCopyWith(OwnerModel value, $Res Function(OwnerModel) _then) = _$OwnerModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "username") String? username,@JsonKey(name: "password") String? password
});




}
/// @nodoc
class _$OwnerModelCopyWithImpl<$Res>
    implements $OwnerModelCopyWith<$Res> {
  _$OwnerModelCopyWithImpl(this._self, this._then);

  final OwnerModel _self;
  final $Res Function(OwnerModel) _then;

/// Create a copy of OwnerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = freezed,Object? password = freezed,}) {
  return _then(_self.copyWith(
username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OwnerModel].
extension OwnerModelPatterns on OwnerModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OwnerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OwnerModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OwnerModel value)  $default,){
final _that = this;
switch (_that) {
case _OwnerModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OwnerModel value)?  $default,){
final _that = this;
switch (_that) {
case _OwnerModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "username")  String? username, @JsonKey(name: "password")  String? password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OwnerModel() when $default != null:
return $default(_that.username,_that.password);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "username")  String? username, @JsonKey(name: "password")  String? password)  $default,) {final _that = this;
switch (_that) {
case _OwnerModel():
return $default(_that.username,_that.password);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "username")  String? username, @JsonKey(name: "password")  String? password)?  $default,) {final _that = this;
switch (_that) {
case _OwnerModel() when $default != null:
return $default(_that.username,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OwnerModel implements OwnerModel {
  const _OwnerModel({@JsonKey(name: "username") this.username, @JsonKey(name: "password") this.password});
  factory _OwnerModel.fromJson(Map<String, dynamic> json) => _$OwnerModelFromJson(json);

@override@JsonKey(name: "username") final  String? username;
@override@JsonKey(name: "password") final  String? password;

/// Create a copy of OwnerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OwnerModelCopyWith<_OwnerModel> get copyWith => __$OwnerModelCopyWithImpl<_OwnerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OwnerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OwnerModel&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password);

@override
String toString() {
  return 'OwnerModel(username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class _$OwnerModelCopyWith<$Res> implements $OwnerModelCopyWith<$Res> {
  factory _$OwnerModelCopyWith(_OwnerModel value, $Res Function(_OwnerModel) _then) = __$OwnerModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "username") String? username,@JsonKey(name: "password") String? password
});




}
/// @nodoc
class __$OwnerModelCopyWithImpl<$Res>
    implements _$OwnerModelCopyWith<$Res> {
  __$OwnerModelCopyWithImpl(this._self, this._then);

  final _OwnerModel _self;
  final $Res Function(_OwnerModel) _then;

/// Create a copy of OwnerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = freezed,Object? password = freezed,}) {
  return _then(_OwnerModel(
username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
