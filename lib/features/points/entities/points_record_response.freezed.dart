// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'points_record_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PointsRecordResponse {

/// 记录ID
 int get id;/// 用户ID
@JsonKey(name: 'user_id') int get userId;/// 物品ID
@JsonKey(name: 'item_id') int? get itemId;/// 变动积分
 int get inte;/// 状态 (completed 等)
 String get status;/// 兑换项简报
@JsonKey(name: 'redemption_item') Map<String, dynamic>? get redemptionItem;/// 兑换类型
@JsonKey(name: 'redemption_type') String? get redemptionType;/// 兑换内容描述
@JsonKey(name: 'redemption_content') String get redemptionContent;/// 状态标签
@JsonKey(name: 'status_label') String get statusLabel;/// 创建时间
@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of PointsRecordResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PointsRecordResponseCopyWith<PointsRecordResponse> get copyWith => _$PointsRecordResponseCopyWithImpl<PointsRecordResponse>(this as PointsRecordResponse, _$identity);

  /// Serializes this PointsRecordResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PointsRecordResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.inte, inte) || other.inte == inte)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.redemptionItem, redemptionItem)&&(identical(other.redemptionType, redemptionType) || other.redemptionType == redemptionType)&&(identical(other.redemptionContent, redemptionContent) || other.redemptionContent == redemptionContent)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,itemId,inte,status,const DeepCollectionEquality().hash(redemptionItem),redemptionType,redemptionContent,statusLabel,createdAt);

@override
String toString() {
  return 'PointsRecordResponse(id: $id, userId: $userId, itemId: $itemId, inte: $inte, status: $status, redemptionItem: $redemptionItem, redemptionType: $redemptionType, redemptionContent: $redemptionContent, statusLabel: $statusLabel, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PointsRecordResponseCopyWith<$Res>  {
  factory $PointsRecordResponseCopyWith(PointsRecordResponse value, $Res Function(PointsRecordResponse) _then) = _$PointsRecordResponseCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'item_id') int? itemId, int inte, String status,@JsonKey(name: 'redemption_item') Map<String, dynamic>? redemptionItem,@JsonKey(name: 'redemption_type') String? redemptionType,@JsonKey(name: 'redemption_content') String redemptionContent,@JsonKey(name: 'status_label') String statusLabel,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$PointsRecordResponseCopyWithImpl<$Res>
    implements $PointsRecordResponseCopyWith<$Res> {
  _$PointsRecordResponseCopyWithImpl(this._self, this._then);

  final PointsRecordResponse _self;
  final $Res Function(PointsRecordResponse) _then;

/// Create a copy of PointsRecordResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? itemId = freezed,Object? inte = null,Object? status = null,Object? redemptionItem = freezed,Object? redemptionType = freezed,Object? redemptionContent = null,Object? statusLabel = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,itemId: freezed == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int?,inte: null == inte ? _self.inte : inte // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,redemptionItem: freezed == redemptionItem ? _self.redemptionItem : redemptionItem // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,redemptionType: freezed == redemptionType ? _self.redemptionType : redemptionType // ignore: cast_nullable_to_non_nullable
as String?,redemptionContent: null == redemptionContent ? _self.redemptionContent : redemptionContent // ignore: cast_nullable_to_non_nullable
as String,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PointsRecordResponse].
extension PointsRecordResponsePatterns on PointsRecordResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PointsRecordResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PointsRecordResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PointsRecordResponse value)  $default,){
final _that = this;
switch (_that) {
case _PointsRecordResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PointsRecordResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PointsRecordResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'item_id')  int? itemId,  int inte,  String status, @JsonKey(name: 'redemption_item')  Map<String, dynamic>? redemptionItem, @JsonKey(name: 'redemption_type')  String? redemptionType, @JsonKey(name: 'redemption_content')  String redemptionContent, @JsonKey(name: 'status_label')  String statusLabel, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PointsRecordResponse() when $default != null:
return $default(_that.id,_that.userId,_that.itemId,_that.inte,_that.status,_that.redemptionItem,_that.redemptionType,_that.redemptionContent,_that.statusLabel,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'item_id')  int? itemId,  int inte,  String status, @JsonKey(name: 'redemption_item')  Map<String, dynamic>? redemptionItem, @JsonKey(name: 'redemption_type')  String? redemptionType, @JsonKey(name: 'redemption_content')  String redemptionContent, @JsonKey(name: 'status_label')  String statusLabel, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _PointsRecordResponse():
return $default(_that.id,_that.userId,_that.itemId,_that.inte,_that.status,_that.redemptionItem,_that.redemptionType,_that.redemptionContent,_that.statusLabel,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'item_id')  int? itemId,  int inte,  String status, @JsonKey(name: 'redemption_item')  Map<String, dynamic>? redemptionItem, @JsonKey(name: 'redemption_type')  String? redemptionType, @JsonKey(name: 'redemption_content')  String redemptionContent, @JsonKey(name: 'status_label')  String statusLabel, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PointsRecordResponse() when $default != null:
return $default(_that.id,_that.userId,_that.itemId,_that.inte,_that.status,_that.redemptionItem,_that.redemptionType,_that.redemptionContent,_that.statusLabel,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PointsRecordResponse implements PointsRecordResponse {
  const _PointsRecordResponse({required this.id, @JsonKey(name: 'user_id') this.userId = 0, @JsonKey(name: 'item_id') this.itemId, this.inte = 0, this.status = '', @JsonKey(name: 'redemption_item') final  Map<String, dynamic>? redemptionItem, @JsonKey(name: 'redemption_type') this.redemptionType, @JsonKey(name: 'redemption_content') this.redemptionContent = '', @JsonKey(name: 'status_label') this.statusLabel = '', @JsonKey(name: 'created_at') this.createdAt = ''}): _redemptionItem = redemptionItem;
  factory _PointsRecordResponse.fromJson(Map<String, dynamic> json) => _$PointsRecordResponseFromJson(json);

/// 记录ID
@override final  int id;
/// 用户ID
@override@JsonKey(name: 'user_id') final  int userId;
/// 物品ID
@override@JsonKey(name: 'item_id') final  int? itemId;
/// 变动积分
@override@JsonKey() final  int inte;
/// 状态 (completed 等)
@override@JsonKey() final  String status;
/// 兑换项简报
 final  Map<String, dynamic>? _redemptionItem;
/// 兑换项简报
@override@JsonKey(name: 'redemption_item') Map<String, dynamic>? get redemptionItem {
  final value = _redemptionItem;
  if (value == null) return null;
  if (_redemptionItem is EqualUnmodifiableMapView) return _redemptionItem;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

/// 兑换类型
@override@JsonKey(name: 'redemption_type') final  String? redemptionType;
/// 兑换内容描述
@override@JsonKey(name: 'redemption_content') final  String redemptionContent;
/// 状态标签
@override@JsonKey(name: 'status_label') final  String statusLabel;
/// 创建时间
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of PointsRecordResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PointsRecordResponseCopyWith<_PointsRecordResponse> get copyWith => __$PointsRecordResponseCopyWithImpl<_PointsRecordResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PointsRecordResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PointsRecordResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.inte, inte) || other.inte == inte)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._redemptionItem, _redemptionItem)&&(identical(other.redemptionType, redemptionType) || other.redemptionType == redemptionType)&&(identical(other.redemptionContent, redemptionContent) || other.redemptionContent == redemptionContent)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,itemId,inte,status,const DeepCollectionEquality().hash(_redemptionItem),redemptionType,redemptionContent,statusLabel,createdAt);

@override
String toString() {
  return 'PointsRecordResponse(id: $id, userId: $userId, itemId: $itemId, inte: $inte, status: $status, redemptionItem: $redemptionItem, redemptionType: $redemptionType, redemptionContent: $redemptionContent, statusLabel: $statusLabel, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PointsRecordResponseCopyWith<$Res> implements $PointsRecordResponseCopyWith<$Res> {
  factory _$PointsRecordResponseCopyWith(_PointsRecordResponse value, $Res Function(_PointsRecordResponse) _then) = __$PointsRecordResponseCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'item_id') int? itemId, int inte, String status,@JsonKey(name: 'redemption_item') Map<String, dynamic>? redemptionItem,@JsonKey(name: 'redemption_type') String? redemptionType,@JsonKey(name: 'redemption_content') String redemptionContent,@JsonKey(name: 'status_label') String statusLabel,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$PointsRecordResponseCopyWithImpl<$Res>
    implements _$PointsRecordResponseCopyWith<$Res> {
  __$PointsRecordResponseCopyWithImpl(this._self, this._then);

  final _PointsRecordResponse _self;
  final $Res Function(_PointsRecordResponse) _then;

/// Create a copy of PointsRecordResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? itemId = freezed,Object? inte = null,Object? status = null,Object? redemptionItem = freezed,Object? redemptionType = freezed,Object? redemptionContent = null,Object? statusLabel = null,Object? createdAt = null,}) {
  return _then(_PointsRecordResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,itemId: freezed == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int?,inte: null == inte ? _self.inte : inte // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,redemptionItem: freezed == redemptionItem ? _self._redemptionItem : redemptionItem // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,redemptionType: freezed == redemptionType ? _self.redemptionType : redemptionType // ignore: cast_nullable_to_non_nullable
as String?,redemptionContent: null == redemptionContent ? _self.redemptionContent : redemptionContent // ignore: cast_nullable_to_non_nullable
as String,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
