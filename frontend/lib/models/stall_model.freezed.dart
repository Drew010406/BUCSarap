// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stall_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StallResponseModel {

@JsonKey(name: "stall_id") int? get stallID;@JsonKey(name: "stall_name") String? get stallName;@JsonKey(name: "owner_id") int? get ownerID;@JsonKey(name: "opening_time") String? get openingTime;@JsonKey(name: "closing_time") String? get closingTime;@JsonKey(name: "operating_days") String? get operatingDays;@JsonKey(name: "stall_status") bool get stallStatus;@JsonKey(name: "photo_path") String? get photoPath;
/// Create a copy of StallResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StallResponseModelCopyWith<StallResponseModel> get copyWith => _$StallResponseModelCopyWithImpl<StallResponseModel>(this as StallResponseModel, _$identity);

  /// Serializes this StallResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StallResponseModel&&(identical(other.stallID, stallID) || other.stallID == stallID)&&(identical(other.stallName, stallName) || other.stallName == stallName)&&(identical(other.ownerID, ownerID) || other.ownerID == ownerID)&&(identical(other.openingTime, openingTime) || other.openingTime == openingTime)&&(identical(other.closingTime, closingTime) || other.closingTime == closingTime)&&(identical(other.operatingDays, operatingDays) || other.operatingDays == operatingDays)&&(identical(other.stallStatus, stallStatus) || other.stallStatus == stallStatus)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stallID,stallName,ownerID,openingTime,closingTime,operatingDays,stallStatus,photoPath);

@override
String toString() {
  return 'StallResponseModel(stallID: $stallID, stallName: $stallName, ownerID: $ownerID, openingTime: $openingTime, closingTime: $closingTime, operatingDays: $operatingDays, stallStatus: $stallStatus, photoPath: $photoPath)';
}


}

/// @nodoc
abstract mixin class $StallResponseModelCopyWith<$Res>  {
  factory $StallResponseModelCopyWith(StallResponseModel value, $Res Function(StallResponseModel) _then) = _$StallResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "stall_id") int? stallID,@JsonKey(name: "stall_name") String? stallName,@JsonKey(name: "owner_id") int? ownerID,@JsonKey(name: "opening_time") String? openingTime,@JsonKey(name: "closing_time") String? closingTime,@JsonKey(name: "operating_days") String? operatingDays,@JsonKey(name: "stall_status") bool stallStatus,@JsonKey(name: "photo_path") String? photoPath
});




}
/// @nodoc
class _$StallResponseModelCopyWithImpl<$Res>
    implements $StallResponseModelCopyWith<$Res> {
  _$StallResponseModelCopyWithImpl(this._self, this._then);

  final StallResponseModel _self;
  final $Res Function(StallResponseModel) _then;

/// Create a copy of StallResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stallID = freezed,Object? stallName = freezed,Object? ownerID = freezed,Object? openingTime = freezed,Object? closingTime = freezed,Object? operatingDays = freezed,Object? stallStatus = null,Object? photoPath = freezed,}) {
  return _then(_self.copyWith(
stallID: freezed == stallID ? _self.stallID : stallID // ignore: cast_nullable_to_non_nullable
as int?,stallName: freezed == stallName ? _self.stallName : stallName // ignore: cast_nullable_to_non_nullable
as String?,ownerID: freezed == ownerID ? _self.ownerID : ownerID // ignore: cast_nullable_to_non_nullable
as int?,openingTime: freezed == openingTime ? _self.openingTime : openingTime // ignore: cast_nullable_to_non_nullable
as String?,closingTime: freezed == closingTime ? _self.closingTime : closingTime // ignore: cast_nullable_to_non_nullable
as String?,operatingDays: freezed == operatingDays ? _self.operatingDays : operatingDays // ignore: cast_nullable_to_non_nullable
as String?,stallStatus: null == stallStatus ? _self.stallStatus : stallStatus // ignore: cast_nullable_to_non_nullable
as bool,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StallResponseModel].
extension StallResponseModelPatterns on StallResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StallResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StallResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StallResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _StallResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StallResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _StallResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "stall_id")  int? stallID, @JsonKey(name: "stall_name")  String? stallName, @JsonKey(name: "owner_id")  int? ownerID, @JsonKey(name: "opening_time")  String? openingTime, @JsonKey(name: "closing_time")  String? closingTime, @JsonKey(name: "operating_days")  String? operatingDays, @JsonKey(name: "stall_status")  bool stallStatus, @JsonKey(name: "photo_path")  String? photoPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StallResponseModel() when $default != null:
return $default(_that.stallID,_that.stallName,_that.ownerID,_that.openingTime,_that.closingTime,_that.operatingDays,_that.stallStatus,_that.photoPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "stall_id")  int? stallID, @JsonKey(name: "stall_name")  String? stallName, @JsonKey(name: "owner_id")  int? ownerID, @JsonKey(name: "opening_time")  String? openingTime, @JsonKey(name: "closing_time")  String? closingTime, @JsonKey(name: "operating_days")  String? operatingDays, @JsonKey(name: "stall_status")  bool stallStatus, @JsonKey(name: "photo_path")  String? photoPath)  $default,) {final _that = this;
switch (_that) {
case _StallResponseModel():
return $default(_that.stallID,_that.stallName,_that.ownerID,_that.openingTime,_that.closingTime,_that.operatingDays,_that.stallStatus,_that.photoPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "stall_id")  int? stallID, @JsonKey(name: "stall_name")  String? stallName, @JsonKey(name: "owner_id")  int? ownerID, @JsonKey(name: "opening_time")  String? openingTime, @JsonKey(name: "closing_time")  String? closingTime, @JsonKey(name: "operating_days")  String? operatingDays, @JsonKey(name: "stall_status")  bool stallStatus, @JsonKey(name: "photo_path")  String? photoPath)?  $default,) {final _that = this;
switch (_that) {
case _StallResponseModel() when $default != null:
return $default(_that.stallID,_that.stallName,_that.ownerID,_that.openingTime,_that.closingTime,_that.operatingDays,_that.stallStatus,_that.photoPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StallResponseModel implements StallResponseModel {
  const _StallResponseModel({@JsonKey(name: "stall_id") this.stallID, @JsonKey(name: "stall_name") this.stallName, @JsonKey(name: "owner_id") this.ownerID, @JsonKey(name: "opening_time") this.openingTime, @JsonKey(name: "closing_time") this.closingTime, @JsonKey(name: "operating_days") this.operatingDays, @JsonKey(name: "stall_status") this.stallStatus = false, @JsonKey(name: "photo_path") this.photoPath});
  factory _StallResponseModel.fromJson(Map<String, dynamic> json) => _$StallResponseModelFromJson(json);

@override@JsonKey(name: "stall_id") final  int? stallID;
@override@JsonKey(name: "stall_name") final  String? stallName;
@override@JsonKey(name: "owner_id") final  int? ownerID;
@override@JsonKey(name: "opening_time") final  String? openingTime;
@override@JsonKey(name: "closing_time") final  String? closingTime;
@override@JsonKey(name: "operating_days") final  String? operatingDays;
@override@JsonKey(name: "stall_status") final  bool stallStatus;
@override@JsonKey(name: "photo_path") final  String? photoPath;

/// Create a copy of StallResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StallResponseModelCopyWith<_StallResponseModel> get copyWith => __$StallResponseModelCopyWithImpl<_StallResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StallResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StallResponseModel&&(identical(other.stallID, stallID) || other.stallID == stallID)&&(identical(other.stallName, stallName) || other.stallName == stallName)&&(identical(other.ownerID, ownerID) || other.ownerID == ownerID)&&(identical(other.openingTime, openingTime) || other.openingTime == openingTime)&&(identical(other.closingTime, closingTime) || other.closingTime == closingTime)&&(identical(other.operatingDays, operatingDays) || other.operatingDays == operatingDays)&&(identical(other.stallStatus, stallStatus) || other.stallStatus == stallStatus)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stallID,stallName,ownerID,openingTime,closingTime,operatingDays,stallStatus,photoPath);

@override
String toString() {
  return 'StallResponseModel(stallID: $stallID, stallName: $stallName, ownerID: $ownerID, openingTime: $openingTime, closingTime: $closingTime, operatingDays: $operatingDays, stallStatus: $stallStatus, photoPath: $photoPath)';
}


}

/// @nodoc
abstract mixin class _$StallResponseModelCopyWith<$Res> implements $StallResponseModelCopyWith<$Res> {
  factory _$StallResponseModelCopyWith(_StallResponseModel value, $Res Function(_StallResponseModel) _then) = __$StallResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "stall_id") int? stallID,@JsonKey(name: "stall_name") String? stallName,@JsonKey(name: "owner_id") int? ownerID,@JsonKey(name: "opening_time") String? openingTime,@JsonKey(name: "closing_time") String? closingTime,@JsonKey(name: "operating_days") String? operatingDays,@JsonKey(name: "stall_status") bool stallStatus,@JsonKey(name: "photo_path") String? photoPath
});




}
/// @nodoc
class __$StallResponseModelCopyWithImpl<$Res>
    implements _$StallResponseModelCopyWith<$Res> {
  __$StallResponseModelCopyWithImpl(this._self, this._then);

  final _StallResponseModel _self;
  final $Res Function(_StallResponseModel) _then;

/// Create a copy of StallResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stallID = freezed,Object? stallName = freezed,Object? ownerID = freezed,Object? openingTime = freezed,Object? closingTime = freezed,Object? operatingDays = freezed,Object? stallStatus = null,Object? photoPath = freezed,}) {
  return _then(_StallResponseModel(
stallID: freezed == stallID ? _self.stallID : stallID // ignore: cast_nullable_to_non_nullable
as int?,stallName: freezed == stallName ? _self.stallName : stallName // ignore: cast_nullable_to_non_nullable
as String?,ownerID: freezed == ownerID ? _self.ownerID : ownerID // ignore: cast_nullable_to_non_nullable
as int?,openingTime: freezed == openingTime ? _self.openingTime : openingTime // ignore: cast_nullable_to_non_nullable
as String?,closingTime: freezed == closingTime ? _self.closingTime : closingTime // ignore: cast_nullable_to_non_nullable
as String?,operatingDays: freezed == operatingDays ? _self.operatingDays : operatingDays // ignore: cast_nullable_to_non_nullable
as String?,stallStatus: null == stallStatus ? _self.stallStatus : stallStatus // ignore: cast_nullable_to_non_nullable
as bool,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CategoryInfoModel {

@JsonKey(name: "category_id") int? get categoryID;@JsonKey(name: "category_name") String? get categoryName;
/// Create a copy of CategoryInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryInfoModelCopyWith<CategoryInfoModel> get copyWith => _$CategoryInfoModelCopyWithImpl<CategoryInfoModel>(this as CategoryInfoModel, _$identity);

  /// Serializes this CategoryInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryInfoModel&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryID,categoryName);

@override
String toString() {
  return 'CategoryInfoModel(categoryID: $categoryID, categoryName: $categoryName)';
}


}

/// @nodoc
abstract mixin class $CategoryInfoModelCopyWith<$Res>  {
  factory $CategoryInfoModelCopyWith(CategoryInfoModel value, $Res Function(CategoryInfoModel) _then) = _$CategoryInfoModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "category_id") int? categoryID,@JsonKey(name: "category_name") String? categoryName
});




}
/// @nodoc
class _$CategoryInfoModelCopyWithImpl<$Res>
    implements $CategoryInfoModelCopyWith<$Res> {
  _$CategoryInfoModelCopyWithImpl(this._self, this._then);

  final CategoryInfoModel _self;
  final $Res Function(CategoryInfoModel) _then;

/// Create a copy of CategoryInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryID = freezed,Object? categoryName = freezed,}) {
  return _then(_self.copyWith(
categoryID: freezed == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as int?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryInfoModel].
extension CategoryInfoModelPatterns on CategoryInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _CategoryInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "category_id")  int? categoryID, @JsonKey(name: "category_name")  String? categoryName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryInfoModel() when $default != null:
return $default(_that.categoryID,_that.categoryName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "category_id")  int? categoryID, @JsonKey(name: "category_name")  String? categoryName)  $default,) {final _that = this;
switch (_that) {
case _CategoryInfoModel():
return $default(_that.categoryID,_that.categoryName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "category_id")  int? categoryID, @JsonKey(name: "category_name")  String? categoryName)?  $default,) {final _that = this;
switch (_that) {
case _CategoryInfoModel() when $default != null:
return $default(_that.categoryID,_that.categoryName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryInfoModel implements CategoryInfoModel {
  const _CategoryInfoModel({@JsonKey(name: "category_id") this.categoryID, @JsonKey(name: "category_name") this.categoryName});
  factory _CategoryInfoModel.fromJson(Map<String, dynamic> json) => _$CategoryInfoModelFromJson(json);

@override@JsonKey(name: "category_id") final  int? categoryID;
@override@JsonKey(name: "category_name") final  String? categoryName;

/// Create a copy of CategoryInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryInfoModelCopyWith<_CategoryInfoModel> get copyWith => __$CategoryInfoModelCopyWithImpl<_CategoryInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryInfoModel&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryID,categoryName);

@override
String toString() {
  return 'CategoryInfoModel(categoryID: $categoryID, categoryName: $categoryName)';
}


}

/// @nodoc
abstract mixin class _$CategoryInfoModelCopyWith<$Res> implements $CategoryInfoModelCopyWith<$Res> {
  factory _$CategoryInfoModelCopyWith(_CategoryInfoModel value, $Res Function(_CategoryInfoModel) _then) = __$CategoryInfoModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "category_id") int? categoryID,@JsonKey(name: "category_name") String? categoryName
});




}
/// @nodoc
class __$CategoryInfoModelCopyWithImpl<$Res>
    implements _$CategoryInfoModelCopyWith<$Res> {
  __$CategoryInfoModelCopyWithImpl(this._self, this._then);

  final _CategoryInfoModel _self;
  final $Res Function(_CategoryInfoModel) _then;

/// Create a copy of CategoryInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryID = freezed,Object? categoryName = freezed,}) {
  return _then(_CategoryInfoModel(
categoryID: freezed == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as int?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StallUpdateModel {

@JsonKey(name: "stall_name") String? get stallName;@JsonKey(name: "opening_time") String? get openingTime;@JsonKey(name: "closing_time") String? get closingTime;@JsonKey(name: "operating_days") String? get operatingDays;@JsonKey(name: "stall_status") bool get stallStatus;@JsonKey(name: "photo_path") String? get photoPath;
/// Create a copy of StallUpdateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StallUpdateModelCopyWith<StallUpdateModel> get copyWith => _$StallUpdateModelCopyWithImpl<StallUpdateModel>(this as StallUpdateModel, _$identity);

  /// Serializes this StallUpdateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StallUpdateModel&&(identical(other.stallName, stallName) || other.stallName == stallName)&&(identical(other.openingTime, openingTime) || other.openingTime == openingTime)&&(identical(other.closingTime, closingTime) || other.closingTime == closingTime)&&(identical(other.operatingDays, operatingDays) || other.operatingDays == operatingDays)&&(identical(other.stallStatus, stallStatus) || other.stallStatus == stallStatus)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stallName,openingTime,closingTime,operatingDays,stallStatus,photoPath);

@override
String toString() {
  return 'StallUpdateModel(stallName: $stallName, openingTime: $openingTime, closingTime: $closingTime, operatingDays: $operatingDays, stallStatus: $stallStatus, photoPath: $photoPath)';
}


}

/// @nodoc
abstract mixin class $StallUpdateModelCopyWith<$Res>  {
  factory $StallUpdateModelCopyWith(StallUpdateModel value, $Res Function(StallUpdateModel) _then) = _$StallUpdateModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "stall_name") String? stallName,@JsonKey(name: "opening_time") String? openingTime,@JsonKey(name: "closing_time") String? closingTime,@JsonKey(name: "operating_days") String? operatingDays,@JsonKey(name: "stall_status") bool stallStatus,@JsonKey(name: "photo_path") String? photoPath
});




}
/// @nodoc
class _$StallUpdateModelCopyWithImpl<$Res>
    implements $StallUpdateModelCopyWith<$Res> {
  _$StallUpdateModelCopyWithImpl(this._self, this._then);

  final StallUpdateModel _self;
  final $Res Function(StallUpdateModel) _then;

/// Create a copy of StallUpdateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stallName = freezed,Object? openingTime = freezed,Object? closingTime = freezed,Object? operatingDays = freezed,Object? stallStatus = null,Object? photoPath = freezed,}) {
  return _then(_self.copyWith(
stallName: freezed == stallName ? _self.stallName : stallName // ignore: cast_nullable_to_non_nullable
as String?,openingTime: freezed == openingTime ? _self.openingTime : openingTime // ignore: cast_nullable_to_non_nullable
as String?,closingTime: freezed == closingTime ? _self.closingTime : closingTime // ignore: cast_nullable_to_non_nullable
as String?,operatingDays: freezed == operatingDays ? _self.operatingDays : operatingDays // ignore: cast_nullable_to_non_nullable
as String?,stallStatus: null == stallStatus ? _self.stallStatus : stallStatus // ignore: cast_nullable_to_non_nullable
as bool,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StallUpdateModel].
extension StallUpdateModelPatterns on StallUpdateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StallUpdateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StallUpdateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StallUpdateModel value)  $default,){
final _that = this;
switch (_that) {
case _StallUpdateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StallUpdateModel value)?  $default,){
final _that = this;
switch (_that) {
case _StallUpdateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "stall_name")  String? stallName, @JsonKey(name: "opening_time")  String? openingTime, @JsonKey(name: "closing_time")  String? closingTime, @JsonKey(name: "operating_days")  String? operatingDays, @JsonKey(name: "stall_status")  bool stallStatus, @JsonKey(name: "photo_path")  String? photoPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StallUpdateModel() when $default != null:
return $default(_that.stallName,_that.openingTime,_that.closingTime,_that.operatingDays,_that.stallStatus,_that.photoPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "stall_name")  String? stallName, @JsonKey(name: "opening_time")  String? openingTime, @JsonKey(name: "closing_time")  String? closingTime, @JsonKey(name: "operating_days")  String? operatingDays, @JsonKey(name: "stall_status")  bool stallStatus, @JsonKey(name: "photo_path")  String? photoPath)  $default,) {final _that = this;
switch (_that) {
case _StallUpdateModel():
return $default(_that.stallName,_that.openingTime,_that.closingTime,_that.operatingDays,_that.stallStatus,_that.photoPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "stall_name")  String? stallName, @JsonKey(name: "opening_time")  String? openingTime, @JsonKey(name: "closing_time")  String? closingTime, @JsonKey(name: "operating_days")  String? operatingDays, @JsonKey(name: "stall_status")  bool stallStatus, @JsonKey(name: "photo_path")  String? photoPath)?  $default,) {final _that = this;
switch (_that) {
case _StallUpdateModel() when $default != null:
return $default(_that.stallName,_that.openingTime,_that.closingTime,_that.operatingDays,_that.stallStatus,_that.photoPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StallUpdateModel implements StallUpdateModel {
  const _StallUpdateModel({@JsonKey(name: "stall_name") this.stallName, @JsonKey(name: "opening_time") this.openingTime, @JsonKey(name: "closing_time") this.closingTime, @JsonKey(name: "operating_days") this.operatingDays, @JsonKey(name: "stall_status") this.stallStatus = false, @JsonKey(name: "photo_path") this.photoPath});
  factory _StallUpdateModel.fromJson(Map<String, dynamic> json) => _$StallUpdateModelFromJson(json);

@override@JsonKey(name: "stall_name") final  String? stallName;
@override@JsonKey(name: "opening_time") final  String? openingTime;
@override@JsonKey(name: "closing_time") final  String? closingTime;
@override@JsonKey(name: "operating_days") final  String? operatingDays;
@override@JsonKey(name: "stall_status") final  bool stallStatus;
@override@JsonKey(name: "photo_path") final  String? photoPath;

/// Create a copy of StallUpdateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StallUpdateModelCopyWith<_StallUpdateModel> get copyWith => __$StallUpdateModelCopyWithImpl<_StallUpdateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StallUpdateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StallUpdateModel&&(identical(other.stallName, stallName) || other.stallName == stallName)&&(identical(other.openingTime, openingTime) || other.openingTime == openingTime)&&(identical(other.closingTime, closingTime) || other.closingTime == closingTime)&&(identical(other.operatingDays, operatingDays) || other.operatingDays == operatingDays)&&(identical(other.stallStatus, stallStatus) || other.stallStatus == stallStatus)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stallName,openingTime,closingTime,operatingDays,stallStatus,photoPath);

@override
String toString() {
  return 'StallUpdateModel(stallName: $stallName, openingTime: $openingTime, closingTime: $closingTime, operatingDays: $operatingDays, stallStatus: $stallStatus, photoPath: $photoPath)';
}


}

/// @nodoc
abstract mixin class _$StallUpdateModelCopyWith<$Res> implements $StallUpdateModelCopyWith<$Res> {
  factory _$StallUpdateModelCopyWith(_StallUpdateModel value, $Res Function(_StallUpdateModel) _then) = __$StallUpdateModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "stall_name") String? stallName,@JsonKey(name: "opening_time") String? openingTime,@JsonKey(name: "closing_time") String? closingTime,@JsonKey(name: "operating_days") String? operatingDays,@JsonKey(name: "stall_status") bool stallStatus,@JsonKey(name: "photo_path") String? photoPath
});




}
/// @nodoc
class __$StallUpdateModelCopyWithImpl<$Res>
    implements _$StallUpdateModelCopyWith<$Res> {
  __$StallUpdateModelCopyWithImpl(this._self, this._then);

  final _StallUpdateModel _self;
  final $Res Function(_StallUpdateModel) _then;

/// Create a copy of StallUpdateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stallName = freezed,Object? openingTime = freezed,Object? closingTime = freezed,Object? operatingDays = freezed,Object? stallStatus = null,Object? photoPath = freezed,}) {
  return _then(_StallUpdateModel(
stallName: freezed == stallName ? _self.stallName : stallName // ignore: cast_nullable_to_non_nullable
as String?,openingTime: freezed == openingTime ? _self.openingTime : openingTime // ignore: cast_nullable_to_non_nullable
as String?,closingTime: freezed == closingTime ? _self.closingTime : closingTime // ignore: cast_nullable_to_non_nullable
as String?,operatingDays: freezed == operatingDays ? _self.operatingDays : operatingDays // ignore: cast_nullable_to_non_nullable
as String?,stallStatus: null == stallStatus ? _self.stallStatus : stallStatus // ignore: cast_nullable_to_non_nullable
as bool,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StallWithCategories {

@JsonKey(name: 'stall_id') int? get stallId;@JsonKey(name: 'stall_name') String? get stallName; List<CategoryInfoModel> get categories;
/// Create a copy of StallWithCategories
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StallWithCategoriesCopyWith<StallWithCategories> get copyWith => _$StallWithCategoriesCopyWithImpl<StallWithCategories>(this as StallWithCategories, _$identity);

  /// Serializes this StallWithCategories to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StallWithCategories&&(identical(other.stallId, stallId) || other.stallId == stallId)&&(identical(other.stallName, stallName) || other.stallName == stallName)&&const DeepCollectionEquality().equals(other.categories, categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stallId,stallName,const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'StallWithCategories(stallId: $stallId, stallName: $stallName, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $StallWithCategoriesCopyWith<$Res>  {
  factory $StallWithCategoriesCopyWith(StallWithCategories value, $Res Function(StallWithCategories) _then) = _$StallWithCategoriesCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'stall_id') int? stallId,@JsonKey(name: 'stall_name') String? stallName, List<CategoryInfoModel> categories
});




}
/// @nodoc
class _$StallWithCategoriesCopyWithImpl<$Res>
    implements $StallWithCategoriesCopyWith<$Res> {
  _$StallWithCategoriesCopyWithImpl(this._self, this._then);

  final StallWithCategories _self;
  final $Res Function(StallWithCategories) _then;

/// Create a copy of StallWithCategories
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stallId = freezed,Object? stallName = freezed,Object? categories = null,}) {
  return _then(_self.copyWith(
stallId: freezed == stallId ? _self.stallId : stallId // ignore: cast_nullable_to_non_nullable
as int?,stallName: freezed == stallName ? _self.stallName : stallName // ignore: cast_nullable_to_non_nullable
as String?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryInfoModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [StallWithCategories].
extension StallWithCategoriesPatterns on StallWithCategories {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StallWithCategories value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StallWithCategories() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StallWithCategories value)  $default,){
final _that = this;
switch (_that) {
case _StallWithCategories():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StallWithCategories value)?  $default,){
final _that = this;
switch (_that) {
case _StallWithCategories() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'stall_id')  int? stallId, @JsonKey(name: 'stall_name')  String? stallName,  List<CategoryInfoModel> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StallWithCategories() when $default != null:
return $default(_that.stallId,_that.stallName,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'stall_id')  int? stallId, @JsonKey(name: 'stall_name')  String? stallName,  List<CategoryInfoModel> categories)  $default,) {final _that = this;
switch (_that) {
case _StallWithCategories():
return $default(_that.stallId,_that.stallName,_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'stall_id')  int? stallId, @JsonKey(name: 'stall_name')  String? stallName,  List<CategoryInfoModel> categories)?  $default,) {final _that = this;
switch (_that) {
case _StallWithCategories() when $default != null:
return $default(_that.stallId,_that.stallName,_that.categories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StallWithCategories implements StallWithCategories {
  const _StallWithCategories({@JsonKey(name: 'stall_id') this.stallId, @JsonKey(name: 'stall_name') this.stallName, final  List<CategoryInfoModel> categories = const []}): _categories = categories;
  factory _StallWithCategories.fromJson(Map<String, dynamic> json) => _$StallWithCategoriesFromJson(json);

@override@JsonKey(name: 'stall_id') final  int? stallId;
@override@JsonKey(name: 'stall_name') final  String? stallName;
 final  List<CategoryInfoModel> _categories;
@override@JsonKey() List<CategoryInfoModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of StallWithCategories
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StallWithCategoriesCopyWith<_StallWithCategories> get copyWith => __$StallWithCategoriesCopyWithImpl<_StallWithCategories>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StallWithCategoriesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StallWithCategories&&(identical(other.stallId, stallId) || other.stallId == stallId)&&(identical(other.stallName, stallName) || other.stallName == stallName)&&const DeepCollectionEquality().equals(other._categories, _categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stallId,stallName,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'StallWithCategories(stallId: $stallId, stallName: $stallName, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$StallWithCategoriesCopyWith<$Res> implements $StallWithCategoriesCopyWith<$Res> {
  factory _$StallWithCategoriesCopyWith(_StallWithCategories value, $Res Function(_StallWithCategories) _then) = __$StallWithCategoriesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'stall_id') int? stallId,@JsonKey(name: 'stall_name') String? stallName, List<CategoryInfoModel> categories
});




}
/// @nodoc
class __$StallWithCategoriesCopyWithImpl<$Res>
    implements _$StallWithCategoriesCopyWith<$Res> {
  __$StallWithCategoriesCopyWithImpl(this._self, this._then);

  final _StallWithCategories _self;
  final $Res Function(_StallWithCategories) _then;

/// Create a copy of StallWithCategories
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stallId = freezed,Object? stallName = freezed,Object? categories = null,}) {
  return _then(_StallWithCategories(
stallId: freezed == stallId ? _self.stallId : stallId // ignore: cast_nullable_to_non_nullable
as int?,stallName: freezed == stallName ? _self.stallName : stallName // ignore: cast_nullable_to_non_nullable
as String?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryInfoModel>,
  ));
}


}

// dart format on
