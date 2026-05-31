// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../transaction_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionHistoryModel {

@JsonKey(name: "order_id") int? get orderID;@JsonKey(name: "customer_name") String? get customerName;@JsonKey(name: "order_number") String? get orderNumber;
/// Create a copy of TransactionHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionHistoryModelCopyWith<TransactionHistoryModel> get copyWith => _$TransactionHistoryModelCopyWithImpl<TransactionHistoryModel>(this as TransactionHistoryModel, _$identity);

  /// Serializes this TransactionHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionHistoryModel&&(identical(other.orderID, orderID) || other.orderID == orderID)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderID,customerName,orderNumber);

@override
String toString() {
  return 'TransactionHistoryModel(orderID: $orderID, customerName: $customerName, orderNumber: $orderNumber)';
}


}

/// @nodoc
abstract mixin class $TransactionHistoryModelCopyWith<$Res>  {
  factory $TransactionHistoryModelCopyWith(TransactionHistoryModel value, $Res Function(TransactionHistoryModel) _then) = _$TransactionHistoryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "order_id") int? orderID,@JsonKey(name: "customer_name") String? customerName,@JsonKey(name: "order_number") String? orderNumber
});




}
/// @nodoc
class _$TransactionHistoryModelCopyWithImpl<$Res>
    implements $TransactionHistoryModelCopyWith<$Res> {
  _$TransactionHistoryModelCopyWithImpl(this._self, this._then);

  final TransactionHistoryModel _self;
  final $Res Function(TransactionHistoryModel) _then;

/// Create a copy of TransactionHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderID = freezed,Object? customerName = freezed,Object? orderNumber = freezed,}) {
  return _then(_self.copyWith(
orderID: freezed == orderID ? _self.orderID : orderID // ignore: cast_nullable_to_non_nullable
as int?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionHistoryModel].
extension TransactionHistoryModelPatterns on TransactionHistoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionHistoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionHistoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionHistoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "order_id")  int? orderID, @JsonKey(name: "customer_name")  String? customerName, @JsonKey(name: "order_number")  String? orderNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionHistoryModel() when $default != null:
return $default(_that.orderID,_that.customerName,_that.orderNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "order_id")  int? orderID, @JsonKey(name: "customer_name")  String? customerName, @JsonKey(name: "order_number")  String? orderNumber)  $default,) {final _that = this;
switch (_that) {
case _TransactionHistoryModel():
return $default(_that.orderID,_that.customerName,_that.orderNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "order_id")  int? orderID, @JsonKey(name: "customer_name")  String? customerName, @JsonKey(name: "order_number")  String? orderNumber)?  $default,) {final _that = this;
switch (_that) {
case _TransactionHistoryModel() when $default != null:
return $default(_that.orderID,_that.customerName,_that.orderNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionHistoryModel implements TransactionHistoryModel {
  const _TransactionHistoryModel({@JsonKey(name: "order_id") this.orderID, @JsonKey(name: "customer_name") this.customerName, @JsonKey(name: "order_number") this.orderNumber});
  factory _TransactionHistoryModel.fromJson(Map<String, dynamic> json) => _$TransactionHistoryModelFromJson(json);

@override@JsonKey(name: "order_id") final  int? orderID;
@override@JsonKey(name: "customer_name") final  String? customerName;
@override@JsonKey(name: "order_number") final  String? orderNumber;

/// Create a copy of TransactionHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionHistoryModelCopyWith<_TransactionHistoryModel> get copyWith => __$TransactionHistoryModelCopyWithImpl<_TransactionHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionHistoryModel&&(identical(other.orderID, orderID) || other.orderID == orderID)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderID,customerName,orderNumber);

@override
String toString() {
  return 'TransactionHistoryModel(orderID: $orderID, customerName: $customerName, orderNumber: $orderNumber)';
}


}

/// @nodoc
abstract mixin class _$TransactionHistoryModelCopyWith<$Res> implements $TransactionHistoryModelCopyWith<$Res> {
  factory _$TransactionHistoryModelCopyWith(_TransactionHistoryModel value, $Res Function(_TransactionHistoryModel) _then) = __$TransactionHistoryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "order_id") int? orderID,@JsonKey(name: "customer_name") String? customerName,@JsonKey(name: "order_number") String? orderNumber
});




}
/// @nodoc
class __$TransactionHistoryModelCopyWithImpl<$Res>
    implements _$TransactionHistoryModelCopyWith<$Res> {
  __$TransactionHistoryModelCopyWithImpl(this._self, this._then);

  final _TransactionHistoryModel _self;
  final $Res Function(_TransactionHistoryModel) _then;

/// Create a copy of TransactionHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderID = freezed,Object? customerName = freezed,Object? orderNumber = freezed,}) {
  return _then(_TransactionHistoryModel(
orderID: freezed == orderID ? _self.orderID : orderID // ignore: cast_nullable_to_non_nullable
as int?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
