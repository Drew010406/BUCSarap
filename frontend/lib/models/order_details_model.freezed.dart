// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderDetailsModel {

@JsonKey(name: "customer_name") String? get customerName;@JsonKey(name: "order_number") String? get orderNumber;@JsonKey(name: "order_status") String? get orderStatus;@JsonKey(name: "order_time") DateTime? get orderTime;@JsonKey(name: "total_cost", fromJson: _parseDouble) double? get totalCost;@JsonKey(name: "items") List<QueueOrderLineResponseModel>? get items;
/// Create a copy of OrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDetailsModelCopyWith<OrderDetailsModel> get copyWith => _$OrderDetailsModelCopyWithImpl<OrderDetailsModel>(this as OrderDetailsModel, _$identity);

  /// Serializes this OrderDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetailsModel&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.orderStatus, orderStatus) || other.orderStatus == orderStatus)&&(identical(other.orderTime, orderTime) || other.orderTime == orderTime)&&(identical(other.totalCost, totalCost) || other.totalCost == totalCost)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerName,orderNumber,orderStatus,orderTime,totalCost,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'OrderDetailsModel(customerName: $customerName, orderNumber: $orderNumber, orderStatus: $orderStatus, orderTime: $orderTime, totalCost: $totalCost, items: $items)';
}


}

/// @nodoc
abstract mixin class $OrderDetailsModelCopyWith<$Res>  {
  factory $OrderDetailsModelCopyWith(OrderDetailsModel value, $Res Function(OrderDetailsModel) _then) = _$OrderDetailsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "customer_name") String? customerName,@JsonKey(name: "order_number") String? orderNumber,@JsonKey(name: "order_status") String? orderStatus,@JsonKey(name: "order_time") DateTime? orderTime,@JsonKey(name: "total_cost", fromJson: _parseDouble) double? totalCost,@JsonKey(name: "items") List<QueueOrderLineResponseModel>? items
});




}
/// @nodoc
class _$OrderDetailsModelCopyWithImpl<$Res>
    implements $OrderDetailsModelCopyWith<$Res> {
  _$OrderDetailsModelCopyWithImpl(this._self, this._then);

  final OrderDetailsModel _self;
  final $Res Function(OrderDetailsModel) _then;

/// Create a copy of OrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customerName = freezed,Object? orderNumber = freezed,Object? orderStatus = freezed,Object? orderTime = freezed,Object? totalCost = freezed,Object? items = freezed,}) {
  return _then(_self.copyWith(
customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String?,orderStatus: freezed == orderStatus ? _self.orderStatus : orderStatus // ignore: cast_nullable_to_non_nullable
as String?,orderTime: freezed == orderTime ? _self.orderTime : orderTime // ignore: cast_nullable_to_non_nullable
as DateTime?,totalCost: freezed == totalCost ? _self.totalCost : totalCost // ignore: cast_nullable_to_non_nullable
as double?,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<QueueOrderLineResponseModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderDetailsModel].
extension OrderDetailsModelPatterns on OrderDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "customer_name")  String? customerName, @JsonKey(name: "order_number")  String? orderNumber, @JsonKey(name: "order_status")  String? orderStatus, @JsonKey(name: "order_time")  DateTime? orderTime, @JsonKey(name: "total_cost", fromJson: _parseDouble)  double? totalCost, @JsonKey(name: "items")  List<QueueOrderLineResponseModel>? items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDetailsModel() when $default != null:
return $default(_that.customerName,_that.orderNumber,_that.orderStatus,_that.orderTime,_that.totalCost,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "customer_name")  String? customerName, @JsonKey(name: "order_number")  String? orderNumber, @JsonKey(name: "order_status")  String? orderStatus, @JsonKey(name: "order_time")  DateTime? orderTime, @JsonKey(name: "total_cost", fromJson: _parseDouble)  double? totalCost, @JsonKey(name: "items")  List<QueueOrderLineResponseModel>? items)  $default,) {final _that = this;
switch (_that) {
case _OrderDetailsModel():
return $default(_that.customerName,_that.orderNumber,_that.orderStatus,_that.orderTime,_that.totalCost,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "customer_name")  String? customerName, @JsonKey(name: "order_number")  String? orderNumber, @JsonKey(name: "order_status")  String? orderStatus, @JsonKey(name: "order_time")  DateTime? orderTime, @JsonKey(name: "total_cost", fromJson: _parseDouble)  double? totalCost, @JsonKey(name: "items")  List<QueueOrderLineResponseModel>? items)?  $default,) {final _that = this;
switch (_that) {
case _OrderDetailsModel() when $default != null:
return $default(_that.customerName,_that.orderNumber,_that.orderStatus,_that.orderTime,_that.totalCost,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderDetailsModel implements OrderDetailsModel {
  const _OrderDetailsModel({@JsonKey(name: "customer_name") this.customerName, @JsonKey(name: "order_number") this.orderNumber, @JsonKey(name: "order_status") this.orderStatus, @JsonKey(name: "order_time") this.orderTime, @JsonKey(name: "total_cost", fromJson: _parseDouble) this.totalCost, @JsonKey(name: "items") final  List<QueueOrderLineResponseModel>? items}): _items = items;
  factory _OrderDetailsModel.fromJson(Map<String, dynamic> json) => _$OrderDetailsModelFromJson(json);

@override@JsonKey(name: "customer_name") final  String? customerName;
@override@JsonKey(name: "order_number") final  String? orderNumber;
@override@JsonKey(name: "order_status") final  String? orderStatus;
@override@JsonKey(name: "order_time") final  DateTime? orderTime;
@override@JsonKey(name: "total_cost", fromJson: _parseDouble) final  double? totalCost;
 final  List<QueueOrderLineResponseModel>? _items;
@override@JsonKey(name: "items") List<QueueOrderLineResponseModel>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of OrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDetailsModelCopyWith<_OrderDetailsModel> get copyWith => __$OrderDetailsModelCopyWithImpl<_OrderDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDetailsModel&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.orderStatus, orderStatus) || other.orderStatus == orderStatus)&&(identical(other.orderTime, orderTime) || other.orderTime == orderTime)&&(identical(other.totalCost, totalCost) || other.totalCost == totalCost)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerName,orderNumber,orderStatus,orderTime,totalCost,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'OrderDetailsModel(customerName: $customerName, orderNumber: $orderNumber, orderStatus: $orderStatus, orderTime: $orderTime, totalCost: $totalCost, items: $items)';
}


}

/// @nodoc
abstract mixin class _$OrderDetailsModelCopyWith<$Res> implements $OrderDetailsModelCopyWith<$Res> {
  factory _$OrderDetailsModelCopyWith(_OrderDetailsModel value, $Res Function(_OrderDetailsModel) _then) = __$OrderDetailsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "customer_name") String? customerName,@JsonKey(name: "order_number") String? orderNumber,@JsonKey(name: "order_status") String? orderStatus,@JsonKey(name: "order_time") DateTime? orderTime,@JsonKey(name: "total_cost", fromJson: _parseDouble) double? totalCost,@JsonKey(name: "items") List<QueueOrderLineResponseModel>? items
});




}
/// @nodoc
class __$OrderDetailsModelCopyWithImpl<$Res>
    implements _$OrderDetailsModelCopyWith<$Res> {
  __$OrderDetailsModelCopyWithImpl(this._self, this._then);

  final _OrderDetailsModel _self;
  final $Res Function(_OrderDetailsModel) _then;

/// Create a copy of OrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customerName = freezed,Object? orderNumber = freezed,Object? orderStatus = freezed,Object? orderTime = freezed,Object? totalCost = freezed,Object? items = freezed,}) {
  return _then(_OrderDetailsModel(
customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String?,orderStatus: freezed == orderStatus ? _self.orderStatus : orderStatus // ignore: cast_nullable_to_non_nullable
as String?,orderTime: freezed == orderTime ? _self.orderTime : orderTime // ignore: cast_nullable_to_non_nullable
as DateTime?,totalCost: freezed == totalCost ? _self.totalCost : totalCost // ignore: cast_nullable_to_non_nullable
as double?,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<QueueOrderLineResponseModel>?,
  ));
}


}


/// @nodoc
mixin _$QueueOrderLineResponseModel {

@JsonKey(name: "product_name") String? get productName;@JsonKey(name: "quantity_ordered", fromJson: _parseInt) int? get quantityOrdered;
/// Create a copy of QueueOrderLineResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueueOrderLineResponseModelCopyWith<QueueOrderLineResponseModel> get copyWith => _$QueueOrderLineResponseModelCopyWithImpl<QueueOrderLineResponseModel>(this as QueueOrderLineResponseModel, _$identity);

  /// Serializes this QueueOrderLineResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueueOrderLineResponseModel&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantityOrdered, quantityOrdered) || other.quantityOrdered == quantityOrdered));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productName,quantityOrdered);

@override
String toString() {
  return 'QueueOrderLineResponseModel(productName: $productName, quantityOrdered: $quantityOrdered)';
}


}

/// @nodoc
abstract mixin class $QueueOrderLineResponseModelCopyWith<$Res>  {
  factory $QueueOrderLineResponseModelCopyWith(QueueOrderLineResponseModel value, $Res Function(QueueOrderLineResponseModel) _then) = _$QueueOrderLineResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "product_name") String? productName,@JsonKey(name: "quantity_ordered", fromJson: _parseInt) int? quantityOrdered
});




}
/// @nodoc
class _$QueueOrderLineResponseModelCopyWithImpl<$Res>
    implements $QueueOrderLineResponseModelCopyWith<$Res> {
  _$QueueOrderLineResponseModelCopyWithImpl(this._self, this._then);

  final QueueOrderLineResponseModel _self;
  final $Res Function(QueueOrderLineResponseModel) _then;

/// Create a copy of QueueOrderLineResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productName = freezed,Object? quantityOrdered = freezed,}) {
  return _then(_self.copyWith(
productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,quantityOrdered: freezed == quantityOrdered ? _self.quantityOrdered : quantityOrdered // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [QueueOrderLineResponseModel].
extension QueueOrderLineResponseModelPatterns on QueueOrderLineResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueueOrderLineResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueueOrderLineResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueueOrderLineResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _QueueOrderLineResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueueOrderLineResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _QueueOrderLineResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "product_name")  String? productName, @JsonKey(name: "quantity_ordered", fromJson: _parseInt)  int? quantityOrdered)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueueOrderLineResponseModel() when $default != null:
return $default(_that.productName,_that.quantityOrdered);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "product_name")  String? productName, @JsonKey(name: "quantity_ordered", fromJson: _parseInt)  int? quantityOrdered)  $default,) {final _that = this;
switch (_that) {
case _QueueOrderLineResponseModel():
return $default(_that.productName,_that.quantityOrdered);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "product_name")  String? productName, @JsonKey(name: "quantity_ordered", fromJson: _parseInt)  int? quantityOrdered)?  $default,) {final _that = this;
switch (_that) {
case _QueueOrderLineResponseModel() when $default != null:
return $default(_that.productName,_that.quantityOrdered);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueueOrderLineResponseModel implements QueueOrderLineResponseModel {
  const _QueueOrderLineResponseModel({@JsonKey(name: "product_name") this.productName, @JsonKey(name: "quantity_ordered", fromJson: _parseInt) this.quantityOrdered});
  factory _QueueOrderLineResponseModel.fromJson(Map<String, dynamic> json) => _$QueueOrderLineResponseModelFromJson(json);

@override@JsonKey(name: "product_name") final  String? productName;
@override@JsonKey(name: "quantity_ordered", fromJson: _parseInt) final  int? quantityOrdered;

/// Create a copy of QueueOrderLineResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueueOrderLineResponseModelCopyWith<_QueueOrderLineResponseModel> get copyWith => __$QueueOrderLineResponseModelCopyWithImpl<_QueueOrderLineResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueueOrderLineResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueueOrderLineResponseModel&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantityOrdered, quantityOrdered) || other.quantityOrdered == quantityOrdered));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productName,quantityOrdered);

@override
String toString() {
  return 'QueueOrderLineResponseModel(productName: $productName, quantityOrdered: $quantityOrdered)';
}


}

/// @nodoc
abstract mixin class _$QueueOrderLineResponseModelCopyWith<$Res> implements $QueueOrderLineResponseModelCopyWith<$Res> {
  factory _$QueueOrderLineResponseModelCopyWith(_QueueOrderLineResponseModel value, $Res Function(_QueueOrderLineResponseModel) _then) = __$QueueOrderLineResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "product_name") String? productName,@JsonKey(name: "quantity_ordered", fromJson: _parseInt) int? quantityOrdered
});




}
/// @nodoc
class __$QueueOrderLineResponseModelCopyWithImpl<$Res>
    implements _$QueueOrderLineResponseModelCopyWith<$Res> {
  __$QueueOrderLineResponseModelCopyWithImpl(this._self, this._then);

  final _QueueOrderLineResponseModel _self;
  final $Res Function(_QueueOrderLineResponseModel) _then;

/// Create a copy of QueueOrderLineResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productName = freezed,Object? quantityOrdered = freezed,}) {
  return _then(_QueueOrderLineResponseModel(
productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,quantityOrdered: freezed == quantityOrdered ? _self.quantityOrdered : quantityOrdered // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
