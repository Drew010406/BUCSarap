// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductCategoryResponseModel {

@JsonKey(name: "category_id") int? get categoryID;@JsonKey(name: "category_name") String? get categoryName;@JsonKey(name: "stall_id") int? get stallID;
/// Create a copy of ProductCategoryResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCategoryResponseModelCopyWith<ProductCategoryResponseModel> get copyWith => _$ProductCategoryResponseModelCopyWithImpl<ProductCategoryResponseModel>(this as ProductCategoryResponseModel, _$identity);

  /// Serializes this ProductCategoryResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductCategoryResponseModel&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.stallID, stallID) || other.stallID == stallID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryID,categoryName,stallID);

@override
String toString() {
  return 'ProductCategoryResponseModel(categoryID: $categoryID, categoryName: $categoryName, stallID: $stallID)';
}


}

/// @nodoc
abstract mixin class $ProductCategoryResponseModelCopyWith<$Res>  {
  factory $ProductCategoryResponseModelCopyWith(ProductCategoryResponseModel value, $Res Function(ProductCategoryResponseModel) _then) = _$ProductCategoryResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "category_id") int? categoryID,@JsonKey(name: "category_name") String? categoryName,@JsonKey(name: "stall_id") int? stallID
});




}
/// @nodoc
class _$ProductCategoryResponseModelCopyWithImpl<$Res>
    implements $ProductCategoryResponseModelCopyWith<$Res> {
  _$ProductCategoryResponseModelCopyWithImpl(this._self, this._then);

  final ProductCategoryResponseModel _self;
  final $Res Function(ProductCategoryResponseModel) _then;

/// Create a copy of ProductCategoryResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryID = freezed,Object? categoryName = freezed,Object? stallID = freezed,}) {
  return _then(_self.copyWith(
categoryID: freezed == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as int?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,stallID: freezed == stallID ? _self.stallID : stallID // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductCategoryResponseModel].
extension ProductCategoryResponseModelPatterns on ProductCategoryResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductCategoryResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductCategoryResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductCategoryResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductCategoryResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductCategoryResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductCategoryResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "category_id")  int? categoryID, @JsonKey(name: "category_name")  String? categoryName, @JsonKey(name: "stall_id")  int? stallID)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductCategoryResponseModel() when $default != null:
return $default(_that.categoryID,_that.categoryName,_that.stallID);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "category_id")  int? categoryID, @JsonKey(name: "category_name")  String? categoryName, @JsonKey(name: "stall_id")  int? stallID)  $default,) {final _that = this;
switch (_that) {
case _ProductCategoryResponseModel():
return $default(_that.categoryID,_that.categoryName,_that.stallID);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "category_id")  int? categoryID, @JsonKey(name: "category_name")  String? categoryName, @JsonKey(name: "stall_id")  int? stallID)?  $default,) {final _that = this;
switch (_that) {
case _ProductCategoryResponseModel() when $default != null:
return $default(_that.categoryID,_that.categoryName,_that.stallID);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductCategoryResponseModel implements ProductCategoryResponseModel {
  const _ProductCategoryResponseModel({@JsonKey(name: "category_id") this.categoryID, @JsonKey(name: "category_name") this.categoryName, @JsonKey(name: "stall_id") this.stallID});
  factory _ProductCategoryResponseModel.fromJson(Map<String, dynamic> json) => _$ProductCategoryResponseModelFromJson(json);

@override@JsonKey(name: "category_id") final  int? categoryID;
@override@JsonKey(name: "category_name") final  String? categoryName;
@override@JsonKey(name: "stall_id") final  int? stallID;

/// Create a copy of ProductCategoryResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCategoryResponseModelCopyWith<_ProductCategoryResponseModel> get copyWith => __$ProductCategoryResponseModelCopyWithImpl<_ProductCategoryResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductCategoryResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductCategoryResponseModel&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.stallID, stallID) || other.stallID == stallID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryID,categoryName,stallID);

@override
String toString() {
  return 'ProductCategoryResponseModel(categoryID: $categoryID, categoryName: $categoryName, stallID: $stallID)';
}


}

/// @nodoc
abstract mixin class _$ProductCategoryResponseModelCopyWith<$Res> implements $ProductCategoryResponseModelCopyWith<$Res> {
  factory _$ProductCategoryResponseModelCopyWith(_ProductCategoryResponseModel value, $Res Function(_ProductCategoryResponseModel) _then) = __$ProductCategoryResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "category_id") int? categoryID,@JsonKey(name: "category_name") String? categoryName,@JsonKey(name: "stall_id") int? stallID
});




}
/// @nodoc
class __$ProductCategoryResponseModelCopyWithImpl<$Res>
    implements _$ProductCategoryResponseModelCopyWith<$Res> {
  __$ProductCategoryResponseModelCopyWithImpl(this._self, this._then);

  final _ProductCategoryResponseModel _self;
  final $Res Function(_ProductCategoryResponseModel) _then;

/// Create a copy of ProductCategoryResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryID = freezed,Object? categoryName = freezed,Object? stallID = freezed,}) {
  return _then(_ProductCategoryResponseModel(
categoryID: freezed == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as int?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,stallID: freezed == stallID ? _self.stallID : stallID // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
