// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../order_line_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderLineModel {

@JsonKey(name: "product_id") int? get productID;@JsonKey(name: "product_name") String? get productName;@JsonKey(name: "quantity_ordered") int? get quantityOrdered;@JsonKey(name: "unit_price_order") double? get unitPriceAtOrder;
/// Create a copy of OrderLineModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderLineModelCopyWith<OrderLineModel> get copyWith => _$OrderLineModelCopyWithImpl<OrderLineModel>(this as OrderLineModel, _$identity);

  /// Serializes this OrderLineModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderLineModel&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantityOrdered, quantityOrdered) || other.quantityOrdered == quantityOrdered)&&(identical(other.unitPriceAtOrder, unitPriceAtOrder) || other.unitPriceAtOrder == unitPriceAtOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productID,productName,quantityOrdered,unitPriceAtOrder);

@override
String toString() {
  return 'OrderLineModel(productID: $productID, productName: $productName, quantityOrdered: $quantityOrdered, unitPriceAtOrder: $unitPriceAtOrder)';
}


}

/// @nodoc
abstract mixin class $OrderLineModelCopyWith<$Res>  {
  factory $OrderLineModelCopyWith(OrderLineModel value, $Res Function(OrderLineModel) _then) = _$OrderLineModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "product_id") int? productID,@JsonKey(name: "product_name") String? productName,@JsonKey(name: "quantity_ordered") int? quantityOrdered,@JsonKey(name: "unit_price_order") double? unitPriceAtOrder
});




}
/// @nodoc
class _$OrderLineModelCopyWithImpl<$Res>
    implements $OrderLineModelCopyWith<$Res> {
  _$OrderLineModelCopyWithImpl(this._self, this._then);

  final OrderLineModel _self;
  final $Res Function(OrderLineModel) _then;

/// Create a copy of OrderLineModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productID = freezed,Object? productName = freezed,Object? quantityOrdered = freezed,Object? unitPriceAtOrder = freezed,}) {
  return _then(_self.copyWith(
productID: freezed == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as int?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,quantityOrdered: freezed == quantityOrdered ? _self.quantityOrdered : quantityOrdered // ignore: cast_nullable_to_non_nullable
as int?,unitPriceAtOrder: freezed == unitPriceAtOrder ? _self.unitPriceAtOrder : unitPriceAtOrder // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderLineModel].
extension OrderLineModelPatterns on OrderLineModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderLineModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderLineModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderLineModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderLineModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderLineModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderLineModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "product_id")  int? productID, @JsonKey(name: "product_name")  String? productName, @JsonKey(name: "quantity_ordered")  int? quantityOrdered, @JsonKey(name: "unit_price_order")  double? unitPriceAtOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderLineModel() when $default != null:
return $default(_that.productID,_that.productName,_that.quantityOrdered,_that.unitPriceAtOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "product_id")  int? productID, @JsonKey(name: "product_name")  String? productName, @JsonKey(name: "quantity_ordered")  int? quantityOrdered, @JsonKey(name: "unit_price_order")  double? unitPriceAtOrder)  $default,) {final _that = this;
switch (_that) {
case _OrderLineModel():
return $default(_that.productID,_that.productName,_that.quantityOrdered,_that.unitPriceAtOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "product_id")  int? productID, @JsonKey(name: "product_name")  String? productName, @JsonKey(name: "quantity_ordered")  int? quantityOrdered, @JsonKey(name: "unit_price_order")  double? unitPriceAtOrder)?  $default,) {final _that = this;
switch (_that) {
case _OrderLineModel() when $default != null:
return $default(_that.productID,_that.productName,_that.quantityOrdered,_that.unitPriceAtOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderLineModel implements OrderLineModel {
  const _OrderLineModel({@JsonKey(name: "product_id") this.productID, @JsonKey(name: "product_name") this.productName, @JsonKey(name: "quantity_ordered") this.quantityOrdered, @JsonKey(name: "unit_price_order") this.unitPriceAtOrder});
  factory _OrderLineModel.fromJson(Map<String, dynamic> json) => _$OrderLineModelFromJson(json);

@override@JsonKey(name: "product_id") final  int? productID;
@override@JsonKey(name: "product_name") final  String? productName;
@override@JsonKey(name: "quantity_ordered") final  int? quantityOrdered;
@override@JsonKey(name: "unit_price_order") final  double? unitPriceAtOrder;

/// Create a copy of OrderLineModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderLineModelCopyWith<_OrderLineModel> get copyWith => __$OrderLineModelCopyWithImpl<_OrderLineModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderLineModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderLineModel&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantityOrdered, quantityOrdered) || other.quantityOrdered == quantityOrdered)&&(identical(other.unitPriceAtOrder, unitPriceAtOrder) || other.unitPriceAtOrder == unitPriceAtOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productID,productName,quantityOrdered,unitPriceAtOrder);

@override
String toString() {
  return 'OrderLineModel(productID: $productID, productName: $productName, quantityOrdered: $quantityOrdered, unitPriceAtOrder: $unitPriceAtOrder)';
}


}

/// @nodoc
abstract mixin class _$OrderLineModelCopyWith<$Res> implements $OrderLineModelCopyWith<$Res> {
  factory _$OrderLineModelCopyWith(_OrderLineModel value, $Res Function(_OrderLineModel) _then) = __$OrderLineModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "product_id") int? productID,@JsonKey(name: "product_name") String? productName,@JsonKey(name: "quantity_ordered") int? quantityOrdered,@JsonKey(name: "unit_price_order") double? unitPriceAtOrder
});




}
/// @nodoc
class __$OrderLineModelCopyWithImpl<$Res>
    implements _$OrderLineModelCopyWith<$Res> {
  __$OrderLineModelCopyWithImpl(this._self, this._then);

  final _OrderLineModel _self;
  final $Res Function(_OrderLineModel) _then;

/// Create a copy of OrderLineModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productID = freezed,Object? productName = freezed,Object? quantityOrdered = freezed,Object? unitPriceAtOrder = freezed,}) {
  return _then(_OrderLineModel(
productID: freezed == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as int?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,quantityOrdered: freezed == quantityOrdered ? _self.quantityOrdered : quantityOrdered // ignore: cast_nullable_to_non_nullable
as int?,unitPriceAtOrder: freezed == unitPriceAtOrder ? _self.unitPriceAtOrder : unitPriceAtOrder // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
