// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductResponseModel {

@JsonKey(name: "product_id") int? get productID;@JsonKey(name: "product_name") String? get productName;@JsonKey(name: "product_price", fromJson: _parseDouble) double? get productPrice;@JsonKey(name: "product_status") bool get productStatus;@JsonKey(name: "photo_path") String? get photoPath;@JsonKey(name: "stall_id") int? get stallID;@JsonKey(name: "stall_name") String? get stallName;@JsonKey(name: "category_id") int? get categoryID;@JsonKey(name: "category_name") String? get categoryName;
/// Create a copy of ProductResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductResponseModelCopyWith<ProductResponseModel> get copyWith => _$ProductResponseModelCopyWithImpl<ProductResponseModel>(this as ProductResponseModel, _$identity);

  /// Serializes this ProductResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductResponseModel&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.productStatus, productStatus) || other.productStatus == productStatus)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.stallID, stallID) || other.stallID == stallID)&&(identical(other.stallName, stallName) || other.stallName == stallName)&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productID,productName,productPrice,productStatus,photoPath,stallID,stallName,categoryID,categoryName);

@override
String toString() {
  return 'ProductResponseModel(productID: $productID, productName: $productName, productPrice: $productPrice, productStatus: $productStatus, photoPath: $photoPath, stallID: $stallID, stallName: $stallName, categoryID: $categoryID, categoryName: $categoryName)';
}


}

/// @nodoc
abstract mixin class $ProductResponseModelCopyWith<$Res>  {
  factory $ProductResponseModelCopyWith(ProductResponseModel value, $Res Function(ProductResponseModel) _then) = _$ProductResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "product_id") int? productID,@JsonKey(name: "product_name") String? productName,@JsonKey(name: "product_price", fromJson: _parseDouble) double? productPrice,@JsonKey(name: "product_status") bool productStatus,@JsonKey(name: "photo_path") String? photoPath,@JsonKey(name: "stall_id") int? stallID,@JsonKey(name: "stall_name") String? stallName,@JsonKey(name: "category_id") int? categoryID,@JsonKey(name: "category_name") String? categoryName
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
@pragma('vm:prefer-inline') @override $Res call({Object? productID = freezed,Object? productName = freezed,Object? productPrice = freezed,Object? productStatus = null,Object? photoPath = freezed,Object? stallID = freezed,Object? stallName = freezed,Object? categoryID = freezed,Object? categoryName = freezed,}) {
  return _then(_self.copyWith(
productID: freezed == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as int?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,productPrice: freezed == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as double?,productStatus: null == productStatus ? _self.productStatus : productStatus // ignore: cast_nullable_to_non_nullable
as bool,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,stallID: freezed == stallID ? _self.stallID : stallID // ignore: cast_nullable_to_non_nullable
as int?,stallName: freezed == stallName ? _self.stallName : stallName // ignore: cast_nullable_to_non_nullable
as String?,categoryID: freezed == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as int?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "product_id")  int? productID, @JsonKey(name: "product_name")  String? productName, @JsonKey(name: "product_price", fromJson: _parseDouble)  double? productPrice, @JsonKey(name: "product_status")  bool productStatus, @JsonKey(name: "photo_path")  String? photoPath, @JsonKey(name: "stall_id")  int? stallID, @JsonKey(name: "stall_name")  String? stallName, @JsonKey(name: "category_id")  int? categoryID, @JsonKey(name: "category_name")  String? categoryName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductResponseModel() when $default != null:
return $default(_that.productID,_that.productName,_that.productPrice,_that.productStatus,_that.photoPath,_that.stallID,_that.stallName,_that.categoryID,_that.categoryName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "product_id")  int? productID, @JsonKey(name: "product_name")  String? productName, @JsonKey(name: "product_price", fromJson: _parseDouble)  double? productPrice, @JsonKey(name: "product_status")  bool productStatus, @JsonKey(name: "photo_path")  String? photoPath, @JsonKey(name: "stall_id")  int? stallID, @JsonKey(name: "stall_name")  String? stallName, @JsonKey(name: "category_id")  int? categoryID, @JsonKey(name: "category_name")  String? categoryName)  $default,) {final _that = this;
switch (_that) {
case _ProductResponseModel():
return $default(_that.productID,_that.productName,_that.productPrice,_that.productStatus,_that.photoPath,_that.stallID,_that.stallName,_that.categoryID,_that.categoryName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "product_id")  int? productID, @JsonKey(name: "product_name")  String? productName, @JsonKey(name: "product_price", fromJson: _parseDouble)  double? productPrice, @JsonKey(name: "product_status")  bool productStatus, @JsonKey(name: "photo_path")  String? photoPath, @JsonKey(name: "stall_id")  int? stallID, @JsonKey(name: "stall_name")  String? stallName, @JsonKey(name: "category_id")  int? categoryID, @JsonKey(name: "category_name")  String? categoryName)?  $default,) {final _that = this;
switch (_that) {
case _ProductResponseModel() when $default != null:
return $default(_that.productID,_that.productName,_that.productPrice,_that.productStatus,_that.photoPath,_that.stallID,_that.stallName,_that.categoryID,_that.categoryName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductResponseModel implements ProductResponseModel {
  const _ProductResponseModel({@JsonKey(name: "product_id") this.productID, @JsonKey(name: "product_name") this.productName, @JsonKey(name: "product_price", fromJson: _parseDouble) this.productPrice, @JsonKey(name: "product_status") this.productStatus = false, @JsonKey(name: "photo_path") this.photoPath, @JsonKey(name: "stall_id") this.stallID, @JsonKey(name: "stall_name") this.stallName, @JsonKey(name: "category_id") this.categoryID, @JsonKey(name: "category_name") this.categoryName});
  factory _ProductResponseModel.fromJson(Map<String, dynamic> json) => _$ProductResponseModelFromJson(json);

@override@JsonKey(name: "product_id") final  int? productID;
@override@JsonKey(name: "product_name") final  String? productName;
@override@JsonKey(name: "product_price", fromJson: _parseDouble) final  double? productPrice;
@override@JsonKey(name: "product_status") final  bool productStatus;
@override@JsonKey(name: "photo_path") final  String? photoPath;
@override@JsonKey(name: "stall_id") final  int? stallID;
@override@JsonKey(name: "stall_name") final  String? stallName;
@override@JsonKey(name: "category_id") final  int? categoryID;
@override@JsonKey(name: "category_name") final  String? categoryName;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductResponseModel&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.productStatus, productStatus) || other.productStatus == productStatus)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.stallID, stallID) || other.stallID == stallID)&&(identical(other.stallName, stallName) || other.stallName == stallName)&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productID,productName,productPrice,productStatus,photoPath,stallID,stallName,categoryID,categoryName);

@override
String toString() {
  return 'ProductResponseModel(productID: $productID, productName: $productName, productPrice: $productPrice, productStatus: $productStatus, photoPath: $photoPath, stallID: $stallID, stallName: $stallName, categoryID: $categoryID, categoryName: $categoryName)';
}


}

/// @nodoc
abstract mixin class _$ProductResponseModelCopyWith<$Res> implements $ProductResponseModelCopyWith<$Res> {
  factory _$ProductResponseModelCopyWith(_ProductResponseModel value, $Res Function(_ProductResponseModel) _then) = __$ProductResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "product_id") int? productID,@JsonKey(name: "product_name") String? productName,@JsonKey(name: "product_price", fromJson: _parseDouble) double? productPrice,@JsonKey(name: "product_status") bool productStatus,@JsonKey(name: "photo_path") String? photoPath,@JsonKey(name: "stall_id") int? stallID,@JsonKey(name: "stall_name") String? stallName,@JsonKey(name: "category_id") int? categoryID,@JsonKey(name: "category_name") String? categoryName
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
@override @pragma('vm:prefer-inline') $Res call({Object? productID = freezed,Object? productName = freezed,Object? productPrice = freezed,Object? productStatus = null,Object? photoPath = freezed,Object? stallID = freezed,Object? stallName = freezed,Object? categoryID = freezed,Object? categoryName = freezed,}) {
  return _then(_ProductResponseModel(
productID: freezed == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as int?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,productPrice: freezed == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as double?,productStatus: null == productStatus ? _self.productStatus : productStatus // ignore: cast_nullable_to_non_nullable
as bool,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,stallID: freezed == stallID ? _self.stallID : stallID // ignore: cast_nullable_to_non_nullable
as int?,stallName: freezed == stallName ? _self.stallName : stallName // ignore: cast_nullable_to_non_nullable
as String?,categoryID: freezed == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as int?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ProductInfoModel {

@JsonKey(name: "product_name") String? get productName;@JsonKey(name: "photo_path") String? get photoPath;
/// Create a copy of ProductInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductInfoModelCopyWith<ProductInfoModel> get copyWith => _$ProductInfoModelCopyWithImpl<ProductInfoModel>(this as ProductInfoModel, _$identity);

  /// Serializes this ProductInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductInfoModel&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productName,photoPath);

@override
String toString() {
  return 'ProductInfoModel(productName: $productName, photoPath: $photoPath)';
}


}

/// @nodoc
abstract mixin class $ProductInfoModelCopyWith<$Res>  {
  factory $ProductInfoModelCopyWith(ProductInfoModel value, $Res Function(ProductInfoModel) _then) = _$ProductInfoModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "product_name") String? productName,@JsonKey(name: "photo_path") String? photoPath
});




}
/// @nodoc
class _$ProductInfoModelCopyWithImpl<$Res>
    implements $ProductInfoModelCopyWith<$Res> {
  _$ProductInfoModelCopyWithImpl(this._self, this._then);

  final ProductInfoModel _self;
  final $Res Function(ProductInfoModel) _then;

/// Create a copy of ProductInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productName = freezed,Object? photoPath = freezed,}) {
  return _then(_self.copyWith(
productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductInfoModel].
extension ProductInfoModelPatterns on ProductInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "product_name")  String? productName, @JsonKey(name: "photo_path")  String? photoPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductInfoModel() when $default != null:
return $default(_that.productName,_that.photoPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "product_name")  String? productName, @JsonKey(name: "photo_path")  String? photoPath)  $default,) {final _that = this;
switch (_that) {
case _ProductInfoModel():
return $default(_that.productName,_that.photoPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "product_name")  String? productName, @JsonKey(name: "photo_path")  String? photoPath)?  $default,) {final _that = this;
switch (_that) {
case _ProductInfoModel() when $default != null:
return $default(_that.productName,_that.photoPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductInfoModel implements ProductInfoModel {
  const _ProductInfoModel({@JsonKey(name: "product_name") this.productName, @JsonKey(name: "photo_path") this.photoPath});
  factory _ProductInfoModel.fromJson(Map<String, dynamic> json) => _$ProductInfoModelFromJson(json);

@override@JsonKey(name: "product_name") final  String? productName;
@override@JsonKey(name: "photo_path") final  String? photoPath;

/// Create a copy of ProductInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductInfoModelCopyWith<_ProductInfoModel> get copyWith => __$ProductInfoModelCopyWithImpl<_ProductInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductInfoModel&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productName,photoPath);

@override
String toString() {
  return 'ProductInfoModel(productName: $productName, photoPath: $photoPath)';
}


}

/// @nodoc
abstract mixin class _$ProductInfoModelCopyWith<$Res> implements $ProductInfoModelCopyWith<$Res> {
  factory _$ProductInfoModelCopyWith(_ProductInfoModel value, $Res Function(_ProductInfoModel) _then) = __$ProductInfoModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "product_name") String? productName,@JsonKey(name: "photo_path") String? photoPath
});




}
/// @nodoc
class __$ProductInfoModelCopyWithImpl<$Res>
    implements _$ProductInfoModelCopyWith<$Res> {
  __$ProductInfoModelCopyWithImpl(this._self, this._then);

  final _ProductInfoModel _self;
  final $Res Function(_ProductInfoModel) _then;

/// Create a copy of ProductInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productName = freezed,Object? photoPath = freezed,}) {
  return _then(_ProductInfoModel(
productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ProductCreateModel {

@JsonKey(name: "product_name") String? get productName;@JsonKey(name: "product_price", fromJson: _parseDouble) double? get productPrice;@JsonKey(name: "product_status") bool? get productStatus;@JsonKey(name: "photo_path") String? get photoPath;
/// Create a copy of ProductCreateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCreateModelCopyWith<ProductCreateModel> get copyWith => _$ProductCreateModelCopyWithImpl<ProductCreateModel>(this as ProductCreateModel, _$identity);

  /// Serializes this ProductCreateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductCreateModel&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.productStatus, productStatus) || other.productStatus == productStatus)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productName,productPrice,productStatus,photoPath);

@override
String toString() {
  return 'ProductCreateModel(productName: $productName, productPrice: $productPrice, productStatus: $productStatus, photoPath: $photoPath)';
}


}

/// @nodoc
abstract mixin class $ProductCreateModelCopyWith<$Res>  {
  factory $ProductCreateModelCopyWith(ProductCreateModel value, $Res Function(ProductCreateModel) _then) = _$ProductCreateModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "product_name") String? productName,@JsonKey(name: "product_price", fromJson: _parseDouble) double? productPrice,@JsonKey(name: "product_status") bool? productStatus,@JsonKey(name: "photo_path") String? photoPath
});




}
/// @nodoc
class _$ProductCreateModelCopyWithImpl<$Res>
    implements $ProductCreateModelCopyWith<$Res> {
  _$ProductCreateModelCopyWithImpl(this._self, this._then);

  final ProductCreateModel _self;
  final $Res Function(ProductCreateModel) _then;

/// Create a copy of ProductCreateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productName = freezed,Object? productPrice = freezed,Object? productStatus = freezed,Object? photoPath = freezed,}) {
  return _then(_self.copyWith(
productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,productPrice: freezed == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as double?,productStatus: freezed == productStatus ? _self.productStatus : productStatus // ignore: cast_nullable_to_non_nullable
as bool?,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductCreateModel].
extension ProductCreateModelPatterns on ProductCreateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductCreateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductCreateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductCreateModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductCreateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductCreateModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductCreateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "product_name")  String? productName, @JsonKey(name: "product_price", fromJson: _parseDouble)  double? productPrice, @JsonKey(name: "product_status")  bool? productStatus, @JsonKey(name: "photo_path")  String? photoPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductCreateModel() when $default != null:
return $default(_that.productName,_that.productPrice,_that.productStatus,_that.photoPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "product_name")  String? productName, @JsonKey(name: "product_price", fromJson: _parseDouble)  double? productPrice, @JsonKey(name: "product_status")  bool? productStatus, @JsonKey(name: "photo_path")  String? photoPath)  $default,) {final _that = this;
switch (_that) {
case _ProductCreateModel():
return $default(_that.productName,_that.productPrice,_that.productStatus,_that.photoPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "product_name")  String? productName, @JsonKey(name: "product_price", fromJson: _parseDouble)  double? productPrice, @JsonKey(name: "product_status")  bool? productStatus, @JsonKey(name: "photo_path")  String? photoPath)?  $default,) {final _that = this;
switch (_that) {
case _ProductCreateModel() when $default != null:
return $default(_that.productName,_that.productPrice,_that.productStatus,_that.photoPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductCreateModel implements ProductCreateModel {
  const _ProductCreateModel({@JsonKey(name: "product_name") this.productName, @JsonKey(name: "product_price", fromJson: _parseDouble) this.productPrice, @JsonKey(name: "product_status") this.productStatus, @JsonKey(name: "photo_path") this.photoPath});
  factory _ProductCreateModel.fromJson(Map<String, dynamic> json) => _$ProductCreateModelFromJson(json);

@override@JsonKey(name: "product_name") final  String? productName;
@override@JsonKey(name: "product_price", fromJson: _parseDouble) final  double? productPrice;
@override@JsonKey(name: "product_status") final  bool? productStatus;
@override@JsonKey(name: "photo_path") final  String? photoPath;

/// Create a copy of ProductCreateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCreateModelCopyWith<_ProductCreateModel> get copyWith => __$ProductCreateModelCopyWithImpl<_ProductCreateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductCreateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductCreateModel&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.productStatus, productStatus) || other.productStatus == productStatus)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productName,productPrice,productStatus,photoPath);

@override
String toString() {
  return 'ProductCreateModel(productName: $productName, productPrice: $productPrice, productStatus: $productStatus, photoPath: $photoPath)';
}


}

/// @nodoc
abstract mixin class _$ProductCreateModelCopyWith<$Res> implements $ProductCreateModelCopyWith<$Res> {
  factory _$ProductCreateModelCopyWith(_ProductCreateModel value, $Res Function(_ProductCreateModel) _then) = __$ProductCreateModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "product_name") String? productName,@JsonKey(name: "product_price", fromJson: _parseDouble) double? productPrice,@JsonKey(name: "product_status") bool? productStatus,@JsonKey(name: "photo_path") String? photoPath
});




}
/// @nodoc
class __$ProductCreateModelCopyWithImpl<$Res>
    implements _$ProductCreateModelCopyWith<$Res> {
  __$ProductCreateModelCopyWithImpl(this._self, this._then);

  final _ProductCreateModel _self;
  final $Res Function(_ProductCreateModel) _then;

/// Create a copy of ProductCreateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productName = freezed,Object? productPrice = freezed,Object? productStatus = freezed,Object? photoPath = freezed,}) {
  return _then(_ProductCreateModel(
productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,productPrice: freezed == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as double?,productStatus: freezed == productStatus ? _self.productStatus : productStatus // ignore: cast_nullable_to_non_nullable
as bool?,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ProductUpdateModel {

@JsonKey(name: "product_id") int? get productID;@JsonKey(name: "category_id") int? get categoryID;@JsonKey(name: "product_name") String? get productName;@JsonKey(name: "product_price", fromJson: _parseDouble) double? get productPrice;@JsonKey(name: "product_status") bool get productStatus;@JsonKey(name: "photo_path") String? get photoPath;
/// Create a copy of ProductUpdateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductUpdateModelCopyWith<ProductUpdateModel> get copyWith => _$ProductUpdateModelCopyWithImpl<ProductUpdateModel>(this as ProductUpdateModel, _$identity);

  /// Serializes this ProductUpdateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductUpdateModel&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.productStatus, productStatus) || other.productStatus == productStatus)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productID,categoryID,productName,productPrice,productStatus,photoPath);

@override
String toString() {
  return 'ProductUpdateModel(productID: $productID, categoryID: $categoryID, productName: $productName, productPrice: $productPrice, productStatus: $productStatus, photoPath: $photoPath)';
}


}

/// @nodoc
abstract mixin class $ProductUpdateModelCopyWith<$Res>  {
  factory $ProductUpdateModelCopyWith(ProductUpdateModel value, $Res Function(ProductUpdateModel) _then) = _$ProductUpdateModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "product_id") int? productID,@JsonKey(name: "category_id") int? categoryID,@JsonKey(name: "product_name") String? productName,@JsonKey(name: "product_price", fromJson: _parseDouble) double? productPrice,@JsonKey(name: "product_status") bool productStatus,@JsonKey(name: "photo_path") String? photoPath
});




}
/// @nodoc
class _$ProductUpdateModelCopyWithImpl<$Res>
    implements $ProductUpdateModelCopyWith<$Res> {
  _$ProductUpdateModelCopyWithImpl(this._self, this._then);

  final ProductUpdateModel _self;
  final $Res Function(ProductUpdateModel) _then;

/// Create a copy of ProductUpdateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productID = freezed,Object? categoryID = freezed,Object? productName = freezed,Object? productPrice = freezed,Object? productStatus = null,Object? photoPath = freezed,}) {
  return _then(_self.copyWith(
productID: freezed == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as int?,categoryID: freezed == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as int?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,productPrice: freezed == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as double?,productStatus: null == productStatus ? _self.productStatus : productStatus // ignore: cast_nullable_to_non_nullable
as bool,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductUpdateModel].
extension ProductUpdateModelPatterns on ProductUpdateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductUpdateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductUpdateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductUpdateModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductUpdateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductUpdateModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductUpdateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "product_id")  int? productID, @JsonKey(name: "category_id")  int? categoryID, @JsonKey(name: "product_name")  String? productName, @JsonKey(name: "product_price", fromJson: _parseDouble)  double? productPrice, @JsonKey(name: "product_status")  bool productStatus, @JsonKey(name: "photo_path")  String? photoPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductUpdateModel() when $default != null:
return $default(_that.productID,_that.categoryID,_that.productName,_that.productPrice,_that.productStatus,_that.photoPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "product_id")  int? productID, @JsonKey(name: "category_id")  int? categoryID, @JsonKey(name: "product_name")  String? productName, @JsonKey(name: "product_price", fromJson: _parseDouble)  double? productPrice, @JsonKey(name: "product_status")  bool productStatus, @JsonKey(name: "photo_path")  String? photoPath)  $default,) {final _that = this;
switch (_that) {
case _ProductUpdateModel():
return $default(_that.productID,_that.categoryID,_that.productName,_that.productPrice,_that.productStatus,_that.photoPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "product_id")  int? productID, @JsonKey(name: "category_id")  int? categoryID, @JsonKey(name: "product_name")  String? productName, @JsonKey(name: "product_price", fromJson: _parseDouble)  double? productPrice, @JsonKey(name: "product_status")  bool productStatus, @JsonKey(name: "photo_path")  String? photoPath)?  $default,) {final _that = this;
switch (_that) {
case _ProductUpdateModel() when $default != null:
return $default(_that.productID,_that.categoryID,_that.productName,_that.productPrice,_that.productStatus,_that.photoPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductUpdateModel implements ProductUpdateModel {
  const _ProductUpdateModel({@JsonKey(name: "product_id") this.productID, @JsonKey(name: "category_id") this.categoryID, @JsonKey(name: "product_name") this.productName, @JsonKey(name: "product_price", fromJson: _parseDouble) this.productPrice, @JsonKey(name: "product_status") this.productStatus = false, @JsonKey(name: "photo_path") this.photoPath});
  factory _ProductUpdateModel.fromJson(Map<String, dynamic> json) => _$ProductUpdateModelFromJson(json);

@override@JsonKey(name: "product_id") final  int? productID;
@override@JsonKey(name: "category_id") final  int? categoryID;
@override@JsonKey(name: "product_name") final  String? productName;
@override@JsonKey(name: "product_price", fromJson: _parseDouble) final  double? productPrice;
@override@JsonKey(name: "product_status") final  bool productStatus;
@override@JsonKey(name: "photo_path") final  String? photoPath;

/// Create a copy of ProductUpdateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductUpdateModelCopyWith<_ProductUpdateModel> get copyWith => __$ProductUpdateModelCopyWithImpl<_ProductUpdateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductUpdateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductUpdateModel&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.productStatus, productStatus) || other.productStatus == productStatus)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productID,categoryID,productName,productPrice,productStatus,photoPath);

@override
String toString() {
  return 'ProductUpdateModel(productID: $productID, categoryID: $categoryID, productName: $productName, productPrice: $productPrice, productStatus: $productStatus, photoPath: $photoPath)';
}


}

/// @nodoc
abstract mixin class _$ProductUpdateModelCopyWith<$Res> implements $ProductUpdateModelCopyWith<$Res> {
  factory _$ProductUpdateModelCopyWith(_ProductUpdateModel value, $Res Function(_ProductUpdateModel) _then) = __$ProductUpdateModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "product_id") int? productID,@JsonKey(name: "category_id") int? categoryID,@JsonKey(name: "product_name") String? productName,@JsonKey(name: "product_price", fromJson: _parseDouble) double? productPrice,@JsonKey(name: "product_status") bool productStatus,@JsonKey(name: "photo_path") String? photoPath
});




}
/// @nodoc
class __$ProductUpdateModelCopyWithImpl<$Res>
    implements _$ProductUpdateModelCopyWith<$Res> {
  __$ProductUpdateModelCopyWithImpl(this._self, this._then);

  final _ProductUpdateModel _self;
  final $Res Function(_ProductUpdateModel) _then;

/// Create a copy of ProductUpdateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productID = freezed,Object? categoryID = freezed,Object? productName = freezed,Object? productPrice = freezed,Object? productStatus = null,Object? photoPath = freezed,}) {
  return _then(_ProductUpdateModel(
productID: freezed == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as int?,categoryID: freezed == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as int?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,productPrice: freezed == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as double?,productStatus: null == productStatus ? _self.productStatus : productStatus // ignore: cast_nullable_to_non_nullable
as bool,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
