// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invitation_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvitationRecordModel {

/// 记录ID
 String get id;/// 被邀请人手机号（掩码处理）
@JsonKey(name: 'invitee_phone') String get inviteePhone;/// 邀请状态 (pending: 待处理, completed: 已完成)
 String get status;/// 获得的奖励金额
 double get reward;/// 创建时间
@JsonKey(name: 'create_time') DateTime get createTime;
/// Create a copy of InvitationRecordModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvitationRecordModelCopyWith<InvitationRecordModel> get copyWith => _$InvitationRecordModelCopyWithImpl<InvitationRecordModel>(this as InvitationRecordModel, _$identity);

  /// Serializes this InvitationRecordModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvitationRecordModel&&(identical(other.id, id) || other.id == id)&&(identical(other.inviteePhone, inviteePhone) || other.inviteePhone == inviteePhone)&&(identical(other.status, status) || other.status == status)&&(identical(other.reward, reward) || other.reward == reward)&&(identical(other.createTime, createTime) || other.createTime == createTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,inviteePhone,status,reward,createTime);

@override
String toString() {
  return 'InvitationRecordModel(id: $id, inviteePhone: $inviteePhone, status: $status, reward: $reward, createTime: $createTime)';
}


}

/// @nodoc
abstract mixin class $InvitationRecordModelCopyWith<$Res>  {
  factory $InvitationRecordModelCopyWith(InvitationRecordModel value, $Res Function(InvitationRecordModel) _then) = _$InvitationRecordModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'invitee_phone') String inviteePhone, String status, double reward,@JsonKey(name: 'create_time') DateTime createTime
});




}
/// @nodoc
class _$InvitationRecordModelCopyWithImpl<$Res>
    implements $InvitationRecordModelCopyWith<$Res> {
  _$InvitationRecordModelCopyWithImpl(this._self, this._then);

  final InvitationRecordModel _self;
  final $Res Function(InvitationRecordModel) _then;

/// Create a copy of InvitationRecordModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? inviteePhone = null,Object? status = null,Object? reward = null,Object? createTime = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,inviteePhone: null == inviteePhone ? _self.inviteePhone : inviteePhone // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reward: null == reward ? _self.reward : reward // ignore: cast_nullable_to_non_nullable
as double,createTime: null == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [InvitationRecordModel].
extension InvitationRecordModelPatterns on InvitationRecordModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvitationRecordModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvitationRecordModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvitationRecordModel value)  $default,){
final _that = this;
switch (_that) {
case _InvitationRecordModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvitationRecordModel value)?  $default,){
final _that = this;
switch (_that) {
case _InvitationRecordModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'invitee_phone')  String inviteePhone,  String status,  double reward, @JsonKey(name: 'create_time')  DateTime createTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvitationRecordModel() when $default != null:
return $default(_that.id,_that.inviteePhone,_that.status,_that.reward,_that.createTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'invitee_phone')  String inviteePhone,  String status,  double reward, @JsonKey(name: 'create_time')  DateTime createTime)  $default,) {final _that = this;
switch (_that) {
case _InvitationRecordModel():
return $default(_that.id,_that.inviteePhone,_that.status,_that.reward,_that.createTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'invitee_phone')  String inviteePhone,  String status,  double reward, @JsonKey(name: 'create_time')  DateTime createTime)?  $default,) {final _that = this;
switch (_that) {
case _InvitationRecordModel() when $default != null:
return $default(_that.id,_that.inviteePhone,_that.status,_that.reward,_that.createTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvitationRecordModel implements InvitationRecordModel {
  const _InvitationRecordModel({required this.id, @JsonKey(name: 'invitee_phone') required this.inviteePhone, required this.status, this.reward = 0.0, @JsonKey(name: 'create_time') required this.createTime});
  factory _InvitationRecordModel.fromJson(Map<String, dynamic> json) => _$InvitationRecordModelFromJson(json);

/// 记录ID
@override final  String id;
/// 被邀请人手机号（掩码处理）
@override@JsonKey(name: 'invitee_phone') final  String inviteePhone;
/// 邀请状态 (pending: 待处理, completed: 已完成)
@override final  String status;
/// 获得的奖励金额
@override@JsonKey() final  double reward;
/// 创建时间
@override@JsonKey(name: 'create_time') final  DateTime createTime;

/// Create a copy of InvitationRecordModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvitationRecordModelCopyWith<_InvitationRecordModel> get copyWith => __$InvitationRecordModelCopyWithImpl<_InvitationRecordModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvitationRecordModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvitationRecordModel&&(identical(other.id, id) || other.id == id)&&(identical(other.inviteePhone, inviteePhone) || other.inviteePhone == inviteePhone)&&(identical(other.status, status) || other.status == status)&&(identical(other.reward, reward) || other.reward == reward)&&(identical(other.createTime, createTime) || other.createTime == createTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,inviteePhone,status,reward,createTime);

@override
String toString() {
  return 'InvitationRecordModel(id: $id, inviteePhone: $inviteePhone, status: $status, reward: $reward, createTime: $createTime)';
}


}

/// @nodoc
abstract mixin class _$InvitationRecordModelCopyWith<$Res> implements $InvitationRecordModelCopyWith<$Res> {
  factory _$InvitationRecordModelCopyWith(_InvitationRecordModel value, $Res Function(_InvitationRecordModel) _then) = __$InvitationRecordModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'invitee_phone') String inviteePhone, String status, double reward,@JsonKey(name: 'create_time') DateTime createTime
});




}
/// @nodoc
class __$InvitationRecordModelCopyWithImpl<$Res>
    implements _$InvitationRecordModelCopyWith<$Res> {
  __$InvitationRecordModelCopyWithImpl(this._self, this._then);

  final _InvitationRecordModel _self;
  final $Res Function(_InvitationRecordModel) _then;

/// Create a copy of InvitationRecordModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? inviteePhone = null,Object? status = null,Object? reward = null,Object? createTime = null,}) {
  return _then(_InvitationRecordModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,inviteePhone: null == inviteePhone ? _self.inviteePhone : inviteePhone // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reward: null == reward ? _self.reward : reward // ignore: cast_nullable_to_non_nullable
as double,createTime: null == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
