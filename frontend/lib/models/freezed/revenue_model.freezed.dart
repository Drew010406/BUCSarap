// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../revenue_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RevenueModel {

@JsonKey(name: "stall_name") String? get stallName;@JsonKey(name: "stall_id") int? get stallID;@JsonKey(name: "stall_revenue", fromJson: _parseDouble) double? get stallRevenue;
/// Create a copy of RevenueModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RevenueModelCopyWith<RevenueModel> get copyWith => _$RevenueModelCopyWithImpl<RevenueModel>(this as RevenueModel, _$identity);

  /// Serializes this RevenueModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RevenueModel&&(identical(other.stallName, stallName) || other.stallName == stallName)&&(identical(other.stallID, stallID) || other.stallID == stallID)&&(identical(other.stallRevenue, stallRevenue) || other.stallRevenue == stallRevenue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stallName,stallID,stallRevenue);

@override
String toString() {
  return 'RevenueModel(stallName: $stallName, stallID: $stallID, stallRevenue: $stallRevenue)';
}


}

/// @nodoc
abstract mixin class $RevenueModelCopyWith<$Res>  {
  factory $RevenueModelCopyWith(RevenueModel value, $Res Function(RevenueModel) _then) = _$RevenueModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "stall_name") String? stallName,@JsonKey(name: "stall_id") int? stallID,@JsonKey(name: "stall_revenue", fromJson: _parseDouble) double? stallRevenue
});




}
/// @nodoc
class _$RevenueModelCopyWithImpl<$Res>
    implements $RevenueModelCopyWith<$Res> {
  _$RevenueModelCopyWithImpl(this._self, this._then);

  final RevenueModel _self;
  final $Res Function(RevenueModel) _then;

/// Create a copy of RevenueModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stallName = freezed,Object? stallID = freezed,Object? stallRevenue = freezed,}) {
  return _then(_self.copyWith(
stallName: freezed == stallName ? _self.stallName : stallName // ignore: cast_nullable_to_non_nullable
as String?,stallID: freezed == stallID ? _self.stallID : stallID // ignore: cast_nullable_to_non_nullable
as int?,stallRevenue: freezed == stallRevenue ? _self.stallRevenue : stallRevenue // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [RevenueModel].
extension RevenueModelPatterns on RevenueModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RevenueModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RevenueModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RevenueModel value)  $default,){
final _that = this;
switch (_that) {
case _RevenueModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RevenueModel value)?  $default,){
final _that = this;
switch (_that) {
case _RevenueModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "stall_name")  String? stallName, @JsonKey(name: "stall_id")  int? stallID, @JsonKey(name: "stall_revenue", fromJson: _parseDouble)  double? stallRevenue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RevenueModel() when $default != null:
return $default(_that.stallName,_that.stallID,_that.stallRevenue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "stall_name")  String? stallName, @JsonKey(name: "stall_id")  int? stallID, @JsonKey(name: "stall_revenue", fromJson: _parseDouble)  double? stallRevenue)  $default,) {final _that = this;
switch (_that) {
case _RevenueModel():
return $default(_that.stallName,_that.stallID,_that.stallRevenue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "stall_name")  String? stallName, @JsonKey(name: "stall_id")  int? stallID, @JsonKey(name: "stall_revenue", fromJson: _parseDouble)  double? stallRevenue)?  $default,) {final _that = this;
switch (_that) {
case _RevenueModel() when $default != null:
return $default(_that.stallName,_that.stallID,_that.stallRevenue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RevenueModel implements RevenueModel {
  const _RevenueModel({@JsonKey(name: "stall_name") this.stallName, @JsonKey(name: "stall_id") this.stallID, @JsonKey(name: "stall_revenue", fromJson: _parseDouble) this.stallRevenue});
  factory _RevenueModel.fromJson(Map<String, dynamic> json) => _$RevenueModelFromJson(json);

@override@JsonKey(name: "stall_name") final  String? stallName;
@override@JsonKey(name: "stall_id") final  int? stallID;
@override@JsonKey(name: "stall_revenue", fromJson: _parseDouble) final  double? stallRevenue;

/// Create a copy of RevenueModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RevenueModelCopyWith<_RevenueModel> get copyWith => __$RevenueModelCopyWithImpl<_RevenueModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RevenueModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RevenueModel&&(identical(other.stallName, stallName) || other.stallName == stallName)&&(identical(other.stallID, stallID) || other.stallID == stallID)&&(identical(other.stallRevenue, stallRevenue) || other.stallRevenue == stallRevenue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stallName,stallID,stallRevenue);

@override
String toString() {
  return 'RevenueModel(stallName: $stallName, stallID: $stallID, stallRevenue: $stallRevenue)';
}


}

/// @nodoc
abstract mixin class _$RevenueModelCopyWith<$Res> implements $RevenueModelCopyWith<$Res> {
  factory _$RevenueModelCopyWith(_RevenueModel value, $Res Function(_RevenueModel) _then) = __$RevenueModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "stall_name") String? stallName,@JsonKey(name: "stall_id") int? stallID,@JsonKey(name: "stall_revenue", fromJson: _parseDouble) double? stallRevenue
});




}
/// @nodoc
class __$RevenueModelCopyWithImpl<$Res>
    implements _$RevenueModelCopyWith<$Res> {
  __$RevenueModelCopyWithImpl(this._self, this._then);

  final _RevenueModel _self;
  final $Res Function(_RevenueModel) _then;

/// Create a copy of RevenueModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stallName = freezed,Object? stallID = freezed,Object? stallRevenue = freezed,}) {
  return _then(_RevenueModel(
stallName: freezed == stallName ? _self.stallName : stallName // ignore: cast_nullable_to_non_nullable
as String?,stallID: freezed == stallID ? _self.stallID : stallID // ignore: cast_nullable_to_non_nullable
as int?,stallRevenue: freezed == stallRevenue ? _self.stallRevenue : stallRevenue // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
