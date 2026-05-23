// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_pile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductPileModel {

@JsonKey(name: "product_id") int? get productID;@JsonKey(name: "stall_id") int? get stallID;@JsonKey(name: "product_quantity") int? get productsQuantity;
/// Create a copy of ProductPileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductPileModelCopyWith<ProductPileModel> get copyWith => _$ProductPileModelCopyWithImpl<ProductPileModel>(this as ProductPileModel, _$identity);

  /// Serializes this ProductPileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductPileModel&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.stallID, stallID) || other.stallID == stallID)&&(identical(other.productsQuantity, productsQuantity) || other.productsQuantity == productsQuantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productID,stallID,productsQuantity);

@override
String toString() {
  return 'ProductPileModel(productID: $productID, stallID: $stallID, productsQuantity: $productsQuantity)';
}


}

/// @nodoc
abstract mixin class $ProductPileModelCopyWith<$Res>  {
  factory $ProductPileModelCopyWith(ProductPileModel value, $Res Function(ProductPileModel) _then) = _$ProductPileModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "product_id") int? productID,@JsonKey(name: "stall_id") int? stallID,@JsonKey(name: "product_quantity") int? productsQuantity
});




}
/// @nodoc
class _$ProductPileModelCopyWithImpl<$Res>
    implements $ProductPileModelCopyWith<$Res> {
  _$ProductPileModelCopyWithImpl(this._self, this._then);

  final ProductPileModel _self;
  final $Res Function(ProductPileModel) _then;

/// Create a copy of ProductPileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productID = freezed,Object? stallID = freezed,Object? productsQuantity = freezed,}) {
  return _then(_self.copyWith(
productID: freezed == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as int?,stallID: freezed == stallID ? _self.stallID : stallID // ignore: cast_nullable_to_non_nullable
as int?,productsQuantity: freezed == productsQuantity ? _self.productsQuantity : productsQuantity // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductPileModel].
extension ProductPileModelPatterns on ProductPileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductPileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductPileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductPileModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductPileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductPileModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductPileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "product_id")  int? productID, @JsonKey(name: "stall_id")  int? stallID, @JsonKey(name: "product_quantity")  int? productsQuantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductPileModel() when $default != null:
return $default(_that.productID,_that.stallID,_that.productsQuantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "product_id")  int? productID, @JsonKey(name: "stall_id")  int? stallID, @JsonKey(name: "product_quantity")  int? productsQuantity)  $default,) {final _that = this;
switch (_that) {
case _ProductPileModel():
return $default(_that.productID,_that.stallID,_that.productsQuantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "product_id")  int? productID, @JsonKey(name: "stall_id")  int? stallID, @JsonKey(name: "product_quantity")  int? productsQuantity)?  $default,) {final _that = this;
switch (_that) {
case _ProductPileModel() when $default != null:
return $default(_that.productID,_that.stallID,_that.productsQuantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductPileModel implements ProductPileModel {
  const _ProductPileModel({@JsonKey(name: "product_id") this.productID, @JsonKey(name: "stall_id") this.stallID, @JsonKey(name: "product_quantity") this.productsQuantity});
  factory _ProductPileModel.fromJson(Map<String, dynamic> json) => _$ProductPileModelFromJson(json);

@override@JsonKey(name: "product_id") final  int? productID;
@override@JsonKey(name: "stall_id") final  int? stallID;
@override@JsonKey(name: "product_quantity") final  int? productsQuantity;

/// Create a copy of ProductPileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductPileModelCopyWith<_ProductPileModel> get copyWith => __$ProductPileModelCopyWithImpl<_ProductPileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductPileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductPileModel&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.stallID, stallID) || other.stallID == stallID)&&(identical(other.productsQuantity, productsQuantity) || other.productsQuantity == productsQuantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productID,stallID,productsQuantity);

@override
String toString() {
  return 'ProductPileModel(productID: $productID, stallID: $stallID, productsQuantity: $productsQuantity)';
}


}

/// @nodoc
abstract mixin class _$ProductPileModelCopyWith<$Res> implements $ProductPileModelCopyWith<$Res> {
  factory _$ProductPileModelCopyWith(_ProductPileModel value, $Res Function(_ProductPileModel) _then) = __$ProductPileModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "product_id") int? productID,@JsonKey(name: "stall_id") int? stallID,@JsonKey(name: "product_quantity") int? productsQuantity
});




}
/// @nodoc
class __$ProductPileModelCopyWithImpl<$Res>
    implements _$ProductPileModelCopyWith<$Res> {
  __$ProductPileModelCopyWithImpl(this._self, this._then);

  final _ProductPileModel _self;
  final $Res Function(_ProductPileModel) _then;

/// Create a copy of ProductPileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productID = freezed,Object? stallID = freezed,Object? productsQuantity = freezed,}) {
  return _then(_ProductPileModel(
productID: freezed == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as int?,stallID: freezed == stallID ? _self.stallID : stallID // ignore: cast_nullable_to_non_nullable
as int?,productsQuantity: freezed == productsQuantity ? _self.productsQuantity : productsQuantity // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
