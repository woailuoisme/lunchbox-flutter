// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_up_rule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TopUpRuleModel {

 int get id; String get amount;@JsonKey(name: 'actual_amount') String get actualAmount; String get integral; String? get description;
/// Create a copy of TopUpRuleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopUpRuleModelCopyWith<TopUpRuleModel> get copyWith => _$TopUpRuleModelCopyWithImpl<TopUpRuleModel>(this as TopUpRuleModel, _$identity);

  /// Serializes this TopUpRuleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopUpRuleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.actualAmount, actualAmount) || other.actualAmount == actualAmount)&&(identical(other.integral, integral) || other.integral == integral)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,actualAmount,integral,description);

@override
String toString() {
  return 'TopUpRuleModel(id: $id, amount: $amount, actualAmount: $actualAmount, integral: $integral, description: $description)';
}


}

/// @nodoc
abstract mixin class $TopUpRuleModelCopyWith<$Res>  {
  factory $TopUpRuleModelCopyWith(TopUpRuleModel value, $Res Function(TopUpRuleModel) _then) = _$TopUpRuleModelCopyWithImpl;
@useResult
$Res call({
 int id, String amount,@JsonKey(name: 'actual_amount') String actualAmount, String integral, String? description
});




}
/// @nodoc
class _$TopUpRuleModelCopyWithImpl<$Res>
    implements $TopUpRuleModelCopyWith<$Res> {
  _$TopUpRuleModelCopyWithImpl(this._self, this._then);

  final TopUpRuleModel _self;
  final $Res Function(TopUpRuleModel) _then;

/// Create a copy of TopUpRuleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amount = null,Object? actualAmount = null,Object? integral = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,actualAmount: null == actualAmount ? _self.actualAmount : actualAmount // ignore: cast_nullable_to_non_nullable
as String,integral: null == integral ? _self.integral : integral // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TopUpRuleModel].
extension TopUpRuleModelPatterns on TopUpRuleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopUpRuleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopUpRuleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopUpRuleModel value)  $default,){
final _that = this;
switch (_that) {
case _TopUpRuleModel():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopUpRuleModel value)?  $default,){
final _that = this;
switch (_that) {
case _TopUpRuleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String amount, @JsonKey(name: 'actual_amount')  String actualAmount,  String integral,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopUpRuleModel() when $default != null:
return $default(_that.id,_that.amount,_that.actualAmount,_that.integral,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String amount, @JsonKey(name: 'actual_amount')  String actualAmount,  String integral,  String? description)  $default,) {final _that = this;
switch (_that) {
case _TopUpRuleModel():
return $default(_that.id,_that.amount,_that.actualAmount,_that.integral,_that.description);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String amount, @JsonKey(name: 'actual_amount')  String actualAmount,  String integral,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _TopUpRuleModel() when $default != null:
return $default(_that.id,_that.amount,_that.actualAmount,_that.integral,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopUpRuleModel implements TopUpRuleModel {
  const _TopUpRuleModel({required this.id, required this.amount, @JsonKey(name: 'actual_amount') required this.actualAmount, required this.integral, this.description});
  factory _TopUpRuleModel.fromJson(Map<String, dynamic> json) => _$TopUpRuleModelFromJson(json);

@override final  int id;
@override final  String amount;
@override@JsonKey(name: 'actual_amount') final  String actualAmount;
@override final  String integral;
@override final  String? description;

/// Create a copy of TopUpRuleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopUpRuleModelCopyWith<_TopUpRuleModel> get copyWith => __$TopUpRuleModelCopyWithImpl<_TopUpRuleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopUpRuleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopUpRuleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.actualAmount, actualAmount) || other.actualAmount == actualAmount)&&(identical(other.integral, integral) || other.integral == integral)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,actualAmount,integral,description);

@override
String toString() {
  return 'TopUpRuleModel(id: $id, amount: $amount, actualAmount: $actualAmount, integral: $integral, description: $description)';
}


}

/// @nodoc
abstract mixin class _$TopUpRuleModelCopyWith<$Res> implements $TopUpRuleModelCopyWith<$Res> {
  factory _$TopUpRuleModelCopyWith(_TopUpRuleModel value, $Res Function(_TopUpRuleModel) _then) = __$TopUpRuleModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String amount,@JsonKey(name: 'actual_amount') String actualAmount, String integral, String? description
});




}
/// @nodoc
class __$TopUpRuleModelCopyWithImpl<$Res>
    implements _$TopUpRuleModelCopyWith<$Res> {
  __$TopUpRuleModelCopyWithImpl(this._self, this._then);

  final _TopUpRuleModel _self;
  final $Res Function(_TopUpRuleModel) _then;

/// Create a copy of TopUpRuleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amount = null,Object? actualAmount = null,Object? integral = null,Object? description = freezed,}) {
  return _then(_TopUpRuleModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,actualAmount: null == actualAmount ? _self.actualAmount : actualAmount // ignore: cast_nullable_to_non_nullable
as String,integral: null == integral ? _self.integral : integral // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
