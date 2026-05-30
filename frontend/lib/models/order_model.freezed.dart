// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderResponseModel {

@JsonKey(name: "order_id") int? get orderID;@JsonKey(name: "order_number") String? get orderNumber;@JsonKey(name: "order_status") String? get orderStatus;@JsonKey(name: "customer_name") String? get customerName;@JsonKey(name: "stall_id") int? get stallID;
/// Create a copy of OrderResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderResponseModelCopyWith<OrderResponseModel> get copyWith => _$OrderResponseModelCopyWithImpl<OrderResponseModel>(this as OrderResponseModel, _$identity);

  /// Serializes this OrderResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderResponseModel&&(identical(other.orderID, orderID) || other.orderID == orderID)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.orderStatus, orderStatus) || other.orderStatus == orderStatus)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.stallID, stallID) || other.stallID == stallID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderID,orderNumber,orderStatus,customerName,stallID);

@override
String toString() {
  return 'OrderResponseModel(orderID: $orderID, orderNumber: $orderNumber, orderStatus: $orderStatus, customerName: $customerName, stallID: $stallID)';
}


}

/// @nodoc
abstract mixin class $OrderResponseModelCopyWith<$Res>  {
  factory $OrderResponseModelCopyWith(OrderResponseModel value, $Res Function(OrderResponseModel) _then) = _$OrderResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "order_id") int? orderID,@JsonKey(name: "order_number") String? orderNumber,@JsonKey(name: "order_status") String? orderStatus,@JsonKey(name: "customer_name") String? customerName,@JsonKey(name: "stall_id") int? stallID
});




}
/// @nodoc
class _$OrderResponseModelCopyWithImpl<$Res>
    implements $OrderResponseModelCopyWith<$Res> {
  _$OrderResponseModelCopyWithImpl(this._self, this._then);

  final OrderResponseModel _self;
  final $Res Function(OrderResponseModel) _then;

/// Create a copy of OrderResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderID = freezed,Object? orderNumber = freezed,Object? orderStatus = freezed,Object? customerName = freezed,Object? stallID = freezed,}) {
  return _then(_self.copyWith(
orderID: freezed == orderID ? _self.orderID : orderID // ignore: cast_nullable_to_non_nullable
as int?,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String?,orderStatus: freezed == orderStatus ? _self.orderStatus : orderStatus // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,stallID: freezed == stallID ? _self.stallID : stallID // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderResponseModel].
extension OrderResponseModelPatterns on OrderResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "order_id")  int? orderID, @JsonKey(name: "order_number")  String? orderNumber, @JsonKey(name: "order_status")  String? orderStatus, @JsonKey(name: "customer_name")  String? customerName, @JsonKey(name: "stall_id")  int? stallID)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderResponseModel() when $default != null:
return $default(_that.orderID,_that.orderNumber,_that.orderStatus,_that.customerName,_that.stallID);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "order_id")  int? orderID, @JsonKey(name: "order_number")  String? orderNumber, @JsonKey(name: "order_status")  String? orderStatus, @JsonKey(name: "customer_name")  String? customerName, @JsonKey(name: "stall_id")  int? stallID)  $default,) {final _that = this;
switch (_that) {
case _OrderResponseModel():
return $default(_that.orderID,_that.orderNumber,_that.orderStatus,_that.customerName,_that.stallID);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "order_id")  int? orderID, @JsonKey(name: "order_number")  String? orderNumber, @JsonKey(name: "order_status")  String? orderStatus, @JsonKey(name: "customer_name")  String? customerName, @JsonKey(name: "stall_id")  int? stallID)?  $default,) {final _that = this;
switch (_that) {
case _OrderResponseModel() when $default != null:
return $default(_that.orderID,_that.orderNumber,_that.orderStatus,_that.customerName,_that.stallID);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderResponseModel implements OrderResponseModel {
  const _OrderResponseModel({@JsonKey(name: "order_id") this.orderID, @JsonKey(name: "order_number") this.orderNumber, @JsonKey(name: "order_status") this.orderStatus = "pending", @JsonKey(name: "customer_name") this.customerName, @JsonKey(name: "stall_id") this.stallID});
  factory _OrderResponseModel.fromJson(Map<String, dynamic> json) => _$OrderResponseModelFromJson(json);

@override@JsonKey(name: "order_id") final  int? orderID;
@override@JsonKey(name: "order_number") final  String? orderNumber;
@override@JsonKey(name: "order_status") final  String? orderStatus;
@override@JsonKey(name: "customer_name") final  String? customerName;
@override@JsonKey(name: "stall_id") final  int? stallID;

/// Create a copy of OrderResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderResponseModelCopyWith<_OrderResponseModel> get copyWith => __$OrderResponseModelCopyWithImpl<_OrderResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderResponseModel&&(identical(other.orderID, orderID) || other.orderID == orderID)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.orderStatus, orderStatus) || other.orderStatus == orderStatus)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.stallID, stallID) || other.stallID == stallID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderID,orderNumber,orderStatus,customerName,stallID);

@override
String toString() {
  return 'OrderResponseModel(orderID: $orderID, orderNumber: $orderNumber, orderStatus: $orderStatus, customerName: $customerName, stallID: $stallID)';
}


}

/// @nodoc
abstract mixin class _$OrderResponseModelCopyWith<$Res> implements $OrderResponseModelCopyWith<$Res> {
  factory _$OrderResponseModelCopyWith(_OrderResponseModel value, $Res Function(_OrderResponseModel) _then) = __$OrderResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "order_id") int? orderID,@JsonKey(name: "order_number") String? orderNumber,@JsonKey(name: "order_status") String? orderStatus,@JsonKey(name: "customer_name") String? customerName,@JsonKey(name: "stall_id") int? stallID
});




}
/// @nodoc
class __$OrderResponseModelCopyWithImpl<$Res>
    implements _$OrderResponseModelCopyWith<$Res> {
  __$OrderResponseModelCopyWithImpl(this._self, this._then);

  final _OrderResponseModel _self;
  final $Res Function(_OrderResponseModel) _then;

/// Create a copy of OrderResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderID = freezed,Object? orderNumber = freezed,Object? orderStatus = freezed,Object? customerName = freezed,Object? stallID = freezed,}) {
  return _then(_OrderResponseModel(
orderID: freezed == orderID ? _self.orderID : orderID // ignore: cast_nullable_to_non_nullable
as int?,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String?,orderStatus: freezed == orderStatus ? _self.orderStatus : orderStatus // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,stallID: freezed == stallID ? _self.stallID : stallID // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$OrderStatus {

@JsonKey(name: "order_status") String? get orderStatus;
/// Create a copy of OrderStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderStatusCopyWith<OrderStatus> get copyWith => _$OrderStatusCopyWithImpl<OrderStatus>(this as OrderStatus, _$identity);

  /// Serializes this OrderStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderStatus&&(identical(other.orderStatus, orderStatus) || other.orderStatus == orderStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderStatus);

@override
String toString() {
  return 'OrderStatus(orderStatus: $orderStatus)';
}


}

/// @nodoc
abstract mixin class $OrderStatusCopyWith<$Res>  {
  factory $OrderStatusCopyWith(OrderStatus value, $Res Function(OrderStatus) _then) = _$OrderStatusCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "order_status") String? orderStatus
});




}
/// @nodoc
class _$OrderStatusCopyWithImpl<$Res>
    implements $OrderStatusCopyWith<$Res> {
  _$OrderStatusCopyWithImpl(this._self, this._then);

  final OrderStatus _self;
  final $Res Function(OrderStatus) _then;

/// Create a copy of OrderStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderStatus = freezed,}) {
  return _then(_self.copyWith(
orderStatus: freezed == orderStatus ? _self.orderStatus : orderStatus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderStatus].
extension OrderStatusPatterns on OrderStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderStatus value)  $default,){
final _that = this;
switch (_that) {
case _OrderStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderStatus value)?  $default,){
final _that = this;
switch (_that) {
case _OrderStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "order_status")  String? orderStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderStatus() when $default != null:
return $default(_that.orderStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "order_status")  String? orderStatus)  $default,) {final _that = this;
switch (_that) {
case _OrderStatus():
return $default(_that.orderStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "order_status")  String? orderStatus)?  $default,) {final _that = this;
switch (_that) {
case _OrderStatus() when $default != null:
return $default(_that.orderStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderStatus implements OrderStatus {
  const _OrderStatus({@JsonKey(name: "order_status") this.orderStatus});
  factory _OrderStatus.fromJson(Map<String, dynamic> json) => _$OrderStatusFromJson(json);

@override@JsonKey(name: "order_status") final  String? orderStatus;

/// Create a copy of OrderStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderStatusCopyWith<_OrderStatus> get copyWith => __$OrderStatusCopyWithImpl<_OrderStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderStatus&&(identical(other.orderStatus, orderStatus) || other.orderStatus == orderStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderStatus);

@override
String toString() {
  return 'OrderStatus(orderStatus: $orderStatus)';
}


}

/// @nodoc
abstract mixin class _$OrderStatusCopyWith<$Res> implements $OrderStatusCopyWith<$Res> {
  factory _$OrderStatusCopyWith(_OrderStatus value, $Res Function(_OrderStatus) _then) = __$OrderStatusCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "order_status") String? orderStatus
});




}
/// @nodoc
class __$OrderStatusCopyWithImpl<$Res>
    implements _$OrderStatusCopyWith<$Res> {
  __$OrderStatusCopyWithImpl(this._self, this._then);

  final _OrderStatus _self;
  final $Res Function(_OrderStatus) _then;

/// Create a copy of OrderStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderStatus = freezed,}) {
  return _then(_OrderStatus(
orderStatus: freezed == orderStatus ? _self.orderStatus : orderStatus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
