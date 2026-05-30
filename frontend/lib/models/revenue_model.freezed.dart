// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'revenue_model.dart';

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


/// @nodoc
mixin _$RevenueComparison {

@JsonKey(name: "stall_id") int? get stallID;@JsonKey(name: "current_revenue", fromJson: _parseDouble) double? get currentRevenue;@JsonKey(name: "previous_revenue", fromJson: _parseDouble) double? get previousRevenue;@JsonKey(name: "revenue_difference", fromJson: _parseDouble) double? get revenueDifference;@JsonKey(name: "percentage_change", fromJson: _parseDouble) double? get percentageChange;
/// Create a copy of RevenueComparison
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RevenueComparisonCopyWith<RevenueComparison> get copyWith => _$RevenueComparisonCopyWithImpl<RevenueComparison>(this as RevenueComparison, _$identity);

  /// Serializes this RevenueComparison to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RevenueComparison&&(identical(other.stallID, stallID) || other.stallID == stallID)&&(identical(other.currentRevenue, currentRevenue) || other.currentRevenue == currentRevenue)&&(identical(other.previousRevenue, previousRevenue) || other.previousRevenue == previousRevenue)&&(identical(other.revenueDifference, revenueDifference) || other.revenueDifference == revenueDifference)&&(identical(other.percentageChange, percentageChange) || other.percentageChange == percentageChange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stallID,currentRevenue,previousRevenue,revenueDifference,percentageChange);

@override
String toString() {
  return 'RevenueComparison(stallID: $stallID, currentRevenue: $currentRevenue, previousRevenue: $previousRevenue, revenueDifference: $revenueDifference, percentageChange: $percentageChange)';
}


}

/// @nodoc
abstract mixin class $RevenueComparisonCopyWith<$Res>  {
  factory $RevenueComparisonCopyWith(RevenueComparison value, $Res Function(RevenueComparison) _then) = _$RevenueComparisonCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "stall_id") int? stallID,@JsonKey(name: "current_revenue", fromJson: _parseDouble) double? currentRevenue,@JsonKey(name: "previous_revenue", fromJson: _parseDouble) double? previousRevenue,@JsonKey(name: "revenue_difference", fromJson: _parseDouble) double? revenueDifference,@JsonKey(name: "percentage_change", fromJson: _parseDouble) double? percentageChange
});




}
/// @nodoc
class _$RevenueComparisonCopyWithImpl<$Res>
    implements $RevenueComparisonCopyWith<$Res> {
  _$RevenueComparisonCopyWithImpl(this._self, this._then);

  final RevenueComparison _self;
  final $Res Function(RevenueComparison) _then;

/// Create a copy of RevenueComparison
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stallID = freezed,Object? currentRevenue = freezed,Object? previousRevenue = freezed,Object? revenueDifference = freezed,Object? percentageChange = freezed,}) {
  return _then(_self.copyWith(
stallID: freezed == stallID ? _self.stallID : stallID // ignore: cast_nullable_to_non_nullable
as int?,currentRevenue: freezed == currentRevenue ? _self.currentRevenue : currentRevenue // ignore: cast_nullable_to_non_nullable
as double?,previousRevenue: freezed == previousRevenue ? _self.previousRevenue : previousRevenue // ignore: cast_nullable_to_non_nullable
as double?,revenueDifference: freezed == revenueDifference ? _self.revenueDifference : revenueDifference // ignore: cast_nullable_to_non_nullable
as double?,percentageChange: freezed == percentageChange ? _self.percentageChange : percentageChange // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [RevenueComparison].
extension RevenueComparisonPatterns on RevenueComparison {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RevenueComparison value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RevenueComparison() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RevenueComparison value)  $default,){
final _that = this;
switch (_that) {
case _RevenueComparison():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RevenueComparison value)?  $default,){
final _that = this;
switch (_that) {
case _RevenueComparison() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "stall_id")  int? stallID, @JsonKey(name: "current_revenue", fromJson: _parseDouble)  double? currentRevenue, @JsonKey(name: "previous_revenue", fromJson: _parseDouble)  double? previousRevenue, @JsonKey(name: "revenue_difference", fromJson: _parseDouble)  double? revenueDifference, @JsonKey(name: "percentage_change", fromJson: _parseDouble)  double? percentageChange)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RevenueComparison() when $default != null:
return $default(_that.stallID,_that.currentRevenue,_that.previousRevenue,_that.revenueDifference,_that.percentageChange);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "stall_id")  int? stallID, @JsonKey(name: "current_revenue", fromJson: _parseDouble)  double? currentRevenue, @JsonKey(name: "previous_revenue", fromJson: _parseDouble)  double? previousRevenue, @JsonKey(name: "revenue_difference", fromJson: _parseDouble)  double? revenueDifference, @JsonKey(name: "percentage_change", fromJson: _parseDouble)  double? percentageChange)  $default,) {final _that = this;
switch (_that) {
case _RevenueComparison():
return $default(_that.stallID,_that.currentRevenue,_that.previousRevenue,_that.revenueDifference,_that.percentageChange);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "stall_id")  int? stallID, @JsonKey(name: "current_revenue", fromJson: _parseDouble)  double? currentRevenue, @JsonKey(name: "previous_revenue", fromJson: _parseDouble)  double? previousRevenue, @JsonKey(name: "revenue_difference", fromJson: _parseDouble)  double? revenueDifference, @JsonKey(name: "percentage_change", fromJson: _parseDouble)  double? percentageChange)?  $default,) {final _that = this;
switch (_that) {
case _RevenueComparison() when $default != null:
return $default(_that.stallID,_that.currentRevenue,_that.previousRevenue,_that.revenueDifference,_that.percentageChange);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RevenueComparison implements RevenueComparison {
  const _RevenueComparison({@JsonKey(name: "stall_id") this.stallID, @JsonKey(name: "current_revenue", fromJson: _parseDouble) this.currentRevenue, @JsonKey(name: "previous_revenue", fromJson: _parseDouble) this.previousRevenue, @JsonKey(name: "revenue_difference", fromJson: _parseDouble) this.revenueDifference, @JsonKey(name: "percentage_change", fromJson: _parseDouble) this.percentageChange});
  factory _RevenueComparison.fromJson(Map<String, dynamic> json) => _$RevenueComparisonFromJson(json);

@override@JsonKey(name: "stall_id") final  int? stallID;
@override@JsonKey(name: "current_revenue", fromJson: _parseDouble) final  double? currentRevenue;
@override@JsonKey(name: "previous_revenue", fromJson: _parseDouble) final  double? previousRevenue;
@override@JsonKey(name: "revenue_difference", fromJson: _parseDouble) final  double? revenueDifference;
@override@JsonKey(name: "percentage_change", fromJson: _parseDouble) final  double? percentageChange;

/// Create a copy of RevenueComparison
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RevenueComparisonCopyWith<_RevenueComparison> get copyWith => __$RevenueComparisonCopyWithImpl<_RevenueComparison>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RevenueComparisonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RevenueComparison&&(identical(other.stallID, stallID) || other.stallID == stallID)&&(identical(other.currentRevenue, currentRevenue) || other.currentRevenue == currentRevenue)&&(identical(other.previousRevenue, previousRevenue) || other.previousRevenue == previousRevenue)&&(identical(other.revenueDifference, revenueDifference) || other.revenueDifference == revenueDifference)&&(identical(other.percentageChange, percentageChange) || other.percentageChange == percentageChange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stallID,currentRevenue,previousRevenue,revenueDifference,percentageChange);

@override
String toString() {
  return 'RevenueComparison(stallID: $stallID, currentRevenue: $currentRevenue, previousRevenue: $previousRevenue, revenueDifference: $revenueDifference, percentageChange: $percentageChange)';
}


}

/// @nodoc
abstract mixin class _$RevenueComparisonCopyWith<$Res> implements $RevenueComparisonCopyWith<$Res> {
  factory _$RevenueComparisonCopyWith(_RevenueComparison value, $Res Function(_RevenueComparison) _then) = __$RevenueComparisonCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "stall_id") int? stallID,@JsonKey(name: "current_revenue", fromJson: _parseDouble) double? currentRevenue,@JsonKey(name: "previous_revenue", fromJson: _parseDouble) double? previousRevenue,@JsonKey(name: "revenue_difference", fromJson: _parseDouble) double? revenueDifference,@JsonKey(name: "percentage_change", fromJson: _parseDouble) double? percentageChange
});




}
/// @nodoc
class __$RevenueComparisonCopyWithImpl<$Res>
    implements _$RevenueComparisonCopyWith<$Res> {
  __$RevenueComparisonCopyWithImpl(this._self, this._then);

  final _RevenueComparison _self;
  final $Res Function(_RevenueComparison) _then;

/// Create a copy of RevenueComparison
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stallID = freezed,Object? currentRevenue = freezed,Object? previousRevenue = freezed,Object? revenueDifference = freezed,Object? percentageChange = freezed,}) {
  return _then(_RevenueComparison(
stallID: freezed == stallID ? _self.stallID : stallID // ignore: cast_nullable_to_non_nullable
as int?,currentRevenue: freezed == currentRevenue ? _self.currentRevenue : currentRevenue // ignore: cast_nullable_to_non_nullable
as double?,previousRevenue: freezed == previousRevenue ? _self.previousRevenue : previousRevenue // ignore: cast_nullable_to_non_nullable
as double?,revenueDifference: freezed == revenueDifference ? _self.revenueDifference : revenueDifference // ignore: cast_nullable_to_non_nullable
as double?,percentageChange: freezed == percentageChange ? _self.percentageChange : percentageChange // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$DailyRevenue {

@JsonKey(name: "stall_id") int? get stallID;@JsonKey(name: "current_revenue", fromJson: _parseDouble) double? get currentRevenue;@JsonKey(name: "previous_revenue", fromJson: _parseDouble) double? get previousRevenue;@JsonKey(name: "revenue_difference", fromJson: _parseDouble) double? get revenueDifference;@JsonKey(name: "percentage_change", fromJson: _parseDouble) double? get percentageChange;
/// Create a copy of DailyRevenue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyRevenueCopyWith<DailyRevenue> get copyWith => _$DailyRevenueCopyWithImpl<DailyRevenue>(this as DailyRevenue, _$identity);

  /// Serializes this DailyRevenue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyRevenue&&(identical(other.stallID, stallID) || other.stallID == stallID)&&(identical(other.currentRevenue, currentRevenue) || other.currentRevenue == currentRevenue)&&(identical(other.previousRevenue, previousRevenue) || other.previousRevenue == previousRevenue)&&(identical(other.revenueDifference, revenueDifference) || other.revenueDifference == revenueDifference)&&(identical(other.percentageChange, percentageChange) || other.percentageChange == percentageChange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stallID,currentRevenue,previousRevenue,revenueDifference,percentageChange);

@override
String toString() {
  return 'DailyRevenue(stallID: $stallID, currentRevenue: $currentRevenue, previousRevenue: $previousRevenue, revenueDifference: $revenueDifference, percentageChange: $percentageChange)';
}


}

/// @nodoc
abstract mixin class $DailyRevenueCopyWith<$Res>  {
  factory $DailyRevenueCopyWith(DailyRevenue value, $Res Function(DailyRevenue) _then) = _$DailyRevenueCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "stall_id") int? stallID,@JsonKey(name: "current_revenue", fromJson: _parseDouble) double? currentRevenue,@JsonKey(name: "previous_revenue", fromJson: _parseDouble) double? previousRevenue,@JsonKey(name: "revenue_difference", fromJson: _parseDouble) double? revenueDifference,@JsonKey(name: "percentage_change", fromJson: _parseDouble) double? percentageChange
});




}
/// @nodoc
class _$DailyRevenueCopyWithImpl<$Res>
    implements $DailyRevenueCopyWith<$Res> {
  _$DailyRevenueCopyWithImpl(this._self, this._then);

  final DailyRevenue _self;
  final $Res Function(DailyRevenue) _then;

/// Create a copy of DailyRevenue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stallID = freezed,Object? currentRevenue = freezed,Object? previousRevenue = freezed,Object? revenueDifference = freezed,Object? percentageChange = freezed,}) {
  return _then(_self.copyWith(
stallID: freezed == stallID ? _self.stallID : stallID // ignore: cast_nullable_to_non_nullable
as int?,currentRevenue: freezed == currentRevenue ? _self.currentRevenue : currentRevenue // ignore: cast_nullable_to_non_nullable
as double?,previousRevenue: freezed == previousRevenue ? _self.previousRevenue : previousRevenue // ignore: cast_nullable_to_non_nullable
as double?,revenueDifference: freezed == revenueDifference ? _self.revenueDifference : revenueDifference // ignore: cast_nullable_to_non_nullable
as double?,percentageChange: freezed == percentageChange ? _self.percentageChange : percentageChange // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyRevenue].
extension DailyRevenuePatterns on DailyRevenue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyRevenue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyRevenue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyRevenue value)  $default,){
final _that = this;
switch (_that) {
case _DailyRevenue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyRevenue value)?  $default,){
final _that = this;
switch (_that) {
case _DailyRevenue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "stall_id")  int? stallID, @JsonKey(name: "current_revenue", fromJson: _parseDouble)  double? currentRevenue, @JsonKey(name: "previous_revenue", fromJson: _parseDouble)  double? previousRevenue, @JsonKey(name: "revenue_difference", fromJson: _parseDouble)  double? revenueDifference, @JsonKey(name: "percentage_change", fromJson: _parseDouble)  double? percentageChange)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyRevenue() when $default != null:
return $default(_that.stallID,_that.currentRevenue,_that.previousRevenue,_that.revenueDifference,_that.percentageChange);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "stall_id")  int? stallID, @JsonKey(name: "current_revenue", fromJson: _parseDouble)  double? currentRevenue, @JsonKey(name: "previous_revenue", fromJson: _parseDouble)  double? previousRevenue, @JsonKey(name: "revenue_difference", fromJson: _parseDouble)  double? revenueDifference, @JsonKey(name: "percentage_change", fromJson: _parseDouble)  double? percentageChange)  $default,) {final _that = this;
switch (_that) {
case _DailyRevenue():
return $default(_that.stallID,_that.currentRevenue,_that.previousRevenue,_that.revenueDifference,_that.percentageChange);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "stall_id")  int? stallID, @JsonKey(name: "current_revenue", fromJson: _parseDouble)  double? currentRevenue, @JsonKey(name: "previous_revenue", fromJson: _parseDouble)  double? previousRevenue, @JsonKey(name: "revenue_difference", fromJson: _parseDouble)  double? revenueDifference, @JsonKey(name: "percentage_change", fromJson: _parseDouble)  double? percentageChange)?  $default,) {final _that = this;
switch (_that) {
case _DailyRevenue() when $default != null:
return $default(_that.stallID,_that.currentRevenue,_that.previousRevenue,_that.revenueDifference,_that.percentageChange);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyRevenue implements DailyRevenue {
  const _DailyRevenue({@JsonKey(name: "stall_id") this.stallID, @JsonKey(name: "current_revenue", fromJson: _parseDouble) this.currentRevenue, @JsonKey(name: "previous_revenue", fromJson: _parseDouble) this.previousRevenue, @JsonKey(name: "revenue_difference", fromJson: _parseDouble) this.revenueDifference, @JsonKey(name: "percentage_change", fromJson: _parseDouble) this.percentageChange});
  factory _DailyRevenue.fromJson(Map<String, dynamic> json) => _$DailyRevenueFromJson(json);

@override@JsonKey(name: "stall_id") final  int? stallID;
@override@JsonKey(name: "current_revenue", fromJson: _parseDouble) final  double? currentRevenue;
@override@JsonKey(name: "previous_revenue", fromJson: _parseDouble) final  double? previousRevenue;
@override@JsonKey(name: "revenue_difference", fromJson: _parseDouble) final  double? revenueDifference;
@override@JsonKey(name: "percentage_change", fromJson: _parseDouble) final  double? percentageChange;

/// Create a copy of DailyRevenue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyRevenueCopyWith<_DailyRevenue> get copyWith => __$DailyRevenueCopyWithImpl<_DailyRevenue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyRevenueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyRevenue&&(identical(other.stallID, stallID) || other.stallID == stallID)&&(identical(other.currentRevenue, currentRevenue) || other.currentRevenue == currentRevenue)&&(identical(other.previousRevenue, previousRevenue) || other.previousRevenue == previousRevenue)&&(identical(other.revenueDifference, revenueDifference) || other.revenueDifference == revenueDifference)&&(identical(other.percentageChange, percentageChange) || other.percentageChange == percentageChange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stallID,currentRevenue,previousRevenue,revenueDifference,percentageChange);

@override
String toString() {
  return 'DailyRevenue(stallID: $stallID, currentRevenue: $currentRevenue, previousRevenue: $previousRevenue, revenueDifference: $revenueDifference, percentageChange: $percentageChange)';
}


}

/// @nodoc
abstract mixin class _$DailyRevenueCopyWith<$Res> implements $DailyRevenueCopyWith<$Res> {
  factory _$DailyRevenueCopyWith(_DailyRevenue value, $Res Function(_DailyRevenue) _then) = __$DailyRevenueCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "stall_id") int? stallID,@JsonKey(name: "current_revenue", fromJson: _parseDouble) double? currentRevenue,@JsonKey(name: "previous_revenue", fromJson: _parseDouble) double? previousRevenue,@JsonKey(name: "revenue_difference", fromJson: _parseDouble) double? revenueDifference,@JsonKey(name: "percentage_change", fromJson: _parseDouble) double? percentageChange
});




}
/// @nodoc
class __$DailyRevenueCopyWithImpl<$Res>
    implements _$DailyRevenueCopyWith<$Res> {
  __$DailyRevenueCopyWithImpl(this._self, this._then);

  final _DailyRevenue _self;
  final $Res Function(_DailyRevenue) _then;

/// Create a copy of DailyRevenue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stallID = freezed,Object? currentRevenue = freezed,Object? previousRevenue = freezed,Object? revenueDifference = freezed,Object? percentageChange = freezed,}) {
  return _then(_DailyRevenue(
stallID: freezed == stallID ? _self.stallID : stallID // ignore: cast_nullable_to_non_nullable
as int?,currentRevenue: freezed == currentRevenue ? _self.currentRevenue : currentRevenue // ignore: cast_nullable_to_non_nullable
as double?,previousRevenue: freezed == previousRevenue ? _self.previousRevenue : previousRevenue // ignore: cast_nullable_to_non_nullable
as double?,revenueDifference: freezed == revenueDifference ? _self.revenueDifference : revenueDifference // ignore: cast_nullable_to_non_nullable
as double?,percentageChange: freezed == percentageChange ? _self.percentageChange : percentageChange // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
