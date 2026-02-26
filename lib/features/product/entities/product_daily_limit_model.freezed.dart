// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_daily_limit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductDailyLimitModel {

/// 当前已购买数量
 int get current;/// 每日限购数量
 int get limit;/// 剩余可购买数量
 int get remaining;
/// Create a copy of ProductDailyLimitModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDailyLimitModelCopyWith<ProductDailyLimitModel> get copyWith => _$ProductDailyLimitModelCopyWithImpl<ProductDailyLimitModel>(this as ProductDailyLimitModel, _$identity);

  /// Serializes this ProductDailyLimitModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDailyLimitModel&&(identical(other.current, current) || other.current == current)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.remaining, remaining) || other.remaining == remaining));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,current,limit,remaining);

@override
String toString() {
  return 'ProductDailyLimitModel(current: $current, limit: $limit, remaining: $remaining)';
}


}

/// @nodoc
abstract mixin class $ProductDailyLimitModelCopyWith<$Res>  {
  factory $ProductDailyLimitModelCopyWith(ProductDailyLimitModel value, $Res Function(ProductDailyLimitModel) _then) = _$ProductDailyLimitModelCopyWithImpl;
@useResult
$Res call({
 int current, int limit, int remaining
});




}
/// @nodoc
class _$ProductDailyLimitModelCopyWithImpl<$Res>
    implements $ProductDailyLimitModelCopyWith<$Res> {
  _$ProductDailyLimitModelCopyWithImpl(this._self, this._then);

  final ProductDailyLimitModel _self;
  final $Res Function(ProductDailyLimitModel) _then;

/// Create a copy of ProductDailyLimitModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? current = null,Object? limit = null,Object? remaining = null,}) {
  return _then(_self.copyWith(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductDailyLimitModel].
extension ProductDailyLimitModelPatterns on ProductDailyLimitModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductDailyLimitModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductDailyLimitModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductDailyLimitModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductDailyLimitModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductDailyLimitModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductDailyLimitModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int current,  int limit,  int remaining)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDailyLimitModel() when $default != null:
return $default(_that.current,_that.limit,_that.remaining);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int current,  int limit,  int remaining)  $default,) {final _that = this;
switch (_that) {
case _ProductDailyLimitModel():
return $default(_that.current,_that.limit,_that.remaining);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int current,  int limit,  int remaining)?  $default,) {final _that = this;
switch (_that) {
case _ProductDailyLimitModel() when $default != null:
return $default(_that.current,_that.limit,_that.remaining);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductDailyLimitModel implements ProductDailyLimitModel {
  const _ProductDailyLimitModel({this.current = 0, this.limit = 0, this.remaining = 0});
  factory _ProductDailyLimitModel.fromJson(Map<String, dynamic> json) => _$ProductDailyLimitModelFromJson(json);

/// 当前已购买数量
@override@JsonKey() final  int current;
/// 每日限购数量
@override@JsonKey() final  int limit;
/// 剩余可购买数量
@override@JsonKey() final  int remaining;

/// Create a copy of ProductDailyLimitModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDailyLimitModelCopyWith<_ProductDailyLimitModel> get copyWith => __$ProductDailyLimitModelCopyWithImpl<_ProductDailyLimitModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductDailyLimitModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDailyLimitModel&&(identical(other.current, current) || other.current == current)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.remaining, remaining) || other.remaining == remaining));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,current,limit,remaining);

@override
String toString() {
  return 'ProductDailyLimitModel(current: $current, limit: $limit, remaining: $remaining)';
}


}

/// @nodoc
abstract mixin class _$ProductDailyLimitModelCopyWith<$Res> implements $ProductDailyLimitModelCopyWith<$Res> {
  factory _$ProductDailyLimitModelCopyWith(_ProductDailyLimitModel value, $Res Function(_ProductDailyLimitModel) _then) = __$ProductDailyLimitModelCopyWithImpl;
@override @useResult
$Res call({
 int current, int limit, int remaining
});




}
/// @nodoc
class __$ProductDailyLimitModelCopyWithImpl<$Res>
    implements _$ProductDailyLimitModelCopyWith<$Res> {
  __$ProductDailyLimitModelCopyWithImpl(this._self, this._then);

  final _ProductDailyLimitModel _self;
  final $Res Function(_ProductDailyLimitModel) _then;

/// Create a copy of ProductDailyLimitModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? current = null,Object? limit = null,Object? remaining = null,}) {
  return _then(_ProductDailyLimitModel(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
