// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductResponseModel {

@JsonKey(name: "product_id") int? get productID;@JsonKey(name: "product_name") String? get productName;@JsonKey(name: "product_price") double? get productPrice;@JsonKey(name: " product_status") bool get productStatus;@JsonKey(name: "category_id ") int? get categoryID;
/// Create a copy of ProductResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductResponseModelCopyWith<ProductResponseModel> get copyWith => _$ProductResponseModelCopyWithImpl<ProductResponseModel>(this as ProductResponseModel, _$identity);

  /// Serializes this ProductResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductResponseModel&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.productStatus, productStatus) || other.productStatus == productStatus)&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productID,productName,productPrice,productStatus,categoryID);

@override
String toString() {
  return 'ProductResponseModel(productID: $productID, productName: $productName, productPrice: $productPrice, productStatus: $productStatus, categoryID: $categoryID)';
}


}

/// @nodoc
abstract mixin class $ProductResponseModelCopyWith<$Res>  {
  factory $ProductResponseModelCopyWith(ProductResponseModel value, $Res Function(ProductResponseModel) _then) = _$ProductResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "product_id") int? productID,@JsonKey(name: "product_name") String? productName,@JsonKey(name: "product_price") double? productPrice,@JsonKey(name: " product_status") bool productStatus,@JsonKey(name: "category_id ") int? categoryID
});




}
/// @nodoc
class _$ProductResponseModelCopyWithImpl<$Res>
    implements $ProductResponseModelCopyWith<$Res> {
  _$ProductResponseModelCopyWithImpl(this._self, this._then);

  final ProductResponseModel _self;
  final $Res Function(ProductResponseModel) _then;

/// Create a copy of ProductResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productID = freezed,Object? productName = freezed,Object? productPrice = freezed,Object? productStatus = null,Object? categoryID = freezed,}) {
  return _then(_self.copyWith(
productID: freezed == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as int?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,productPrice: freezed == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as double?,productStatus: null == productStatus ? _self.productStatus : productStatus // ignore: cast_nullable_to_non_nullable
as bool,categoryID: freezed == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductResponseModel].
extension ProductResponseModelPatterns on ProductResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "product_id")  int? productID, @JsonKey(name: "product_name")  String? productName, @JsonKey(name: "product_price")  double? productPrice, @JsonKey(name: " product_status")  bool productStatus, @JsonKey(name: "category_id ")  int? categoryID)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductResponseModel() when $default != null:
return $default(_that.productID,_that.productName,_that.productPrice,_that.productStatus,_that.categoryID);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "product_id")  int? productID, @JsonKey(name: "product_name")  String? productName, @JsonKey(name: "product_price")  double? productPrice, @JsonKey(name: " product_status")  bool productStatus, @JsonKey(name: "category_id ")  int? categoryID)  $default,) {final _that = this;
switch (_that) {
case _ProductResponseModel():
return $default(_that.productID,_that.productName,_that.productPrice,_that.productStatus,_that.categoryID);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "product_id")  int? productID, @JsonKey(name: "product_name")  String? productName, @JsonKey(name: "product_price")  double? productPrice, @JsonKey(name: " product_status")  bool productStatus, @JsonKey(name: "category_id ")  int? categoryID)?  $default,) {final _that = this;
switch (_that) {
case _ProductResponseModel() when $default != null:
return $default(_that.productID,_that.productName,_that.productPrice,_that.productStatus,_that.categoryID);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductResponseModel implements ProductResponseModel {
  const _ProductResponseModel({@JsonKey(name: "product_id") this.productID, @JsonKey(name: "product_name") this.productName, @JsonKey(name: "product_price") this.productPrice, @JsonKey(name: " product_status") this.productStatus = false, @JsonKey(name: "category_id ") this.categoryID});
  factory _ProductResponseModel.fromJson(Map<String, dynamic> json) => _$ProductResponseModelFromJson(json);

@override@JsonKey(name: "product_id") final  int? productID;
@override@JsonKey(name: "product_name") final  String? productName;
@override@JsonKey(name: "product_price") final  double? productPrice;
@override@JsonKey(name: " product_status") final  bool productStatus;
@override@JsonKey(name: "category_id ") final  int? categoryID;

/// Create a copy of ProductResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductResponseModelCopyWith<_ProductResponseModel> get copyWith => __$ProductResponseModelCopyWithImpl<_ProductResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductResponseModel&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.productStatus, productStatus) || other.productStatus == productStatus)&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productID,productName,productPrice,productStatus,categoryID);

@override
String toString() {
  return 'ProductResponseModel(productID: $productID, productName: $productName, productPrice: $productPrice, productStatus: $productStatus, categoryID: $categoryID)';
}


}

/// @nodoc
abstract mixin class _$ProductResponseModelCopyWith<$Res> implements $ProductResponseModelCopyWith<$Res> {
  factory _$ProductResponseModelCopyWith(_ProductResponseModel value, $Res Function(_ProductResponseModel) _then) = __$ProductResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "product_id") int? productID,@JsonKey(name: "product_name") String? productName,@JsonKey(name: "product_price") double? productPrice,@JsonKey(name: " product_status") bool productStatus,@JsonKey(name: "category_id ") int? categoryID
});




}
/// @nodoc
class __$ProductResponseModelCopyWithImpl<$Res>
    implements _$ProductResponseModelCopyWith<$Res> {
  __$ProductResponseModelCopyWithImpl(this._self, this._then);

  final _ProductResponseModel _self;
  final $Res Function(_ProductResponseModel) _then;

/// Create a copy of ProductResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productID = freezed,Object? productName = freezed,Object? productPrice = freezed,Object? productStatus = null,Object? categoryID = freezed,}) {
  return _then(_ProductResponseModel(
productID: freezed == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as int?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,productPrice: freezed == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as double?,productStatus: null == productStatus ? _self.productStatus : productStatus // ignore: cast_nullable_to_non_nullable
as bool,categoryID: freezed == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$ProductWithDetailsModel {

@JsonKey(name: "product_id") int? get productID;@JsonKey(name: "product_name") String? get productName;@JsonKey(name: "product_price") double? get productPrice;@JsonKey(name: "photo_path") String? get photoPath;@JsonKey(name: "product_quantity") int? get productQuantity;
/// Create a copy of ProductWithDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductWithDetailsModelCopyWith<ProductWithDetailsModel> get copyWith => _$ProductWithDetailsModelCopyWithImpl<ProductWithDetailsModel>(this as ProductWithDetailsModel, _$identity);

  /// Serializes this ProductWithDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductWithDetailsModel&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.productQuantity, productQuantity) || other.productQuantity == productQuantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productID,productName,productPrice,photoPath,productQuantity);

@override
String toString() {
  return 'ProductWithDetailsModel(productID: $productID, productName: $productName, productPrice: $productPrice, photoPath: $photoPath, productQuantity: $productQuantity)';
}


}

/// @nodoc
abstract mixin class $ProductWithDetailsModelCopyWith<$Res>  {
  factory $ProductWithDetailsModelCopyWith(ProductWithDetailsModel value, $Res Function(ProductWithDetailsModel) _then) = _$ProductWithDetailsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "product_id") int? productID,@JsonKey(name: "product_name") String? productName,@JsonKey(name: "product_price") double? productPrice,@JsonKey(name: "photo_path") String? photoPath,@JsonKey(name: "product_quantity") int? productQuantity
});




}
/// @nodoc
class _$ProductWithDetailsModelCopyWithImpl<$Res>
    implements $ProductWithDetailsModelCopyWith<$Res> {
  _$ProductWithDetailsModelCopyWithImpl(this._self, this._then);

  final ProductWithDetailsModel _self;
  final $Res Function(ProductWithDetailsModel) _then;

/// Create a copy of ProductWithDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productID = freezed,Object? productName = freezed,Object? productPrice = freezed,Object? photoPath = freezed,Object? productQuantity = freezed,}) {
  return _then(_self.copyWith(
productID: freezed == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as int?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,productPrice: freezed == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as double?,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,productQuantity: freezed == productQuantity ? _self.productQuantity : productQuantity // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductWithDetailsModel].
extension ProductWithDetailsModelPatterns on ProductWithDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductWithDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductWithDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductWithDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductWithDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductWithDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductWithDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "product_id")  int? productID, @JsonKey(name: "product_name")  String? productName, @JsonKey(name: "product_price")  double? productPrice, @JsonKey(name: "photo_path")  String? photoPath, @JsonKey(name: "product_quantity")  int? productQuantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductWithDetailsModel() when $default != null:
return $default(_that.productID,_that.productName,_that.productPrice,_that.photoPath,_that.productQuantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "product_id")  int? productID, @JsonKey(name: "product_name")  String? productName, @JsonKey(name: "product_price")  double? productPrice, @JsonKey(name: "photo_path")  String? photoPath, @JsonKey(name: "product_quantity")  int? productQuantity)  $default,) {final _that = this;
switch (_that) {
case _ProductWithDetailsModel():
return $default(_that.productID,_that.productName,_that.productPrice,_that.photoPath,_that.productQuantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "product_id")  int? productID, @JsonKey(name: "product_name")  String? productName, @JsonKey(name: "product_price")  double? productPrice, @JsonKey(name: "photo_path")  String? photoPath, @JsonKey(name: "product_quantity")  int? productQuantity)?  $default,) {final _that = this;
switch (_that) {
case _ProductWithDetailsModel() when $default != null:
return $default(_that.productID,_that.productName,_that.productPrice,_that.photoPath,_that.productQuantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductWithDetailsModel implements ProductWithDetailsModel {
  const _ProductWithDetailsModel({@JsonKey(name: "product_id") this.productID, @JsonKey(name: "product_name") this.productName, @JsonKey(name: "product_price") this.productPrice, @JsonKey(name: "photo_path") this.photoPath, @JsonKey(name: "product_quantity") this.productQuantity});
  factory _ProductWithDetailsModel.fromJson(Map<String, dynamic> json) => _$ProductWithDetailsModelFromJson(json);

@override@JsonKey(name: "product_id") final  int? productID;
@override@JsonKey(name: "product_name") final  String? productName;
@override@JsonKey(name: "product_price") final  double? productPrice;
@override@JsonKey(name: "photo_path") final  String? photoPath;
@override@JsonKey(name: "product_quantity") final  int? productQuantity;

/// Create a copy of ProductWithDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductWithDetailsModelCopyWith<_ProductWithDetailsModel> get copyWith => __$ProductWithDetailsModelCopyWithImpl<_ProductWithDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductWithDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductWithDetailsModel&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.productQuantity, productQuantity) || other.productQuantity == productQuantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productID,productName,productPrice,photoPath,productQuantity);

@override
String toString() {
  return 'ProductWithDetailsModel(productID: $productID, productName: $productName, productPrice: $productPrice, photoPath: $photoPath, productQuantity: $productQuantity)';
}


}

/// @nodoc
abstract mixin class _$ProductWithDetailsModelCopyWith<$Res> implements $ProductWithDetailsModelCopyWith<$Res> {
  factory _$ProductWithDetailsModelCopyWith(_ProductWithDetailsModel value, $Res Function(_ProductWithDetailsModel) _then) = __$ProductWithDetailsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "product_id") int? productID,@JsonKey(name: "product_name") String? productName,@JsonKey(name: "product_price") double? productPrice,@JsonKey(name: "photo_path") String? photoPath,@JsonKey(name: "product_quantity") int? productQuantity
});




}
/// @nodoc
class __$ProductWithDetailsModelCopyWithImpl<$Res>
    implements _$ProductWithDetailsModelCopyWith<$Res> {
  __$ProductWithDetailsModelCopyWithImpl(this._self, this._then);

  final _ProductWithDetailsModel _self;
  final $Res Function(_ProductWithDetailsModel) _then;

/// Create a copy of ProductWithDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productID = freezed,Object? productName = freezed,Object? productPrice = freezed,Object? photoPath = freezed,Object? productQuantity = freezed,}) {
  return _then(_ProductWithDetailsModel(
productID: freezed == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as int?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,productPrice: freezed == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as double?,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,productQuantity: freezed == productQuantity ? _self.productQuantity : productQuantity // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
