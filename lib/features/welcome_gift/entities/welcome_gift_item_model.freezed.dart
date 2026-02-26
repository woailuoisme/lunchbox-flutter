// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'welcome_gift_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WelcomeGiftItemModel {

 String get id; String get title; String get description; bool get isClaimed; String? get imageUrl; double get value; String? get type;
/// Create a copy of WelcomeGiftItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WelcomeGiftItemModelCopyWith<WelcomeGiftItemModel> get copyWith => _$WelcomeGiftItemModelCopyWithImpl<WelcomeGiftItemModel>(this as WelcomeGiftItemModel, _$identity);

  /// Serializes this WelcomeGiftItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WelcomeGiftItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.isClaimed, isClaimed) || other.isClaimed == isClaimed)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.value, value) || other.value == value)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,isClaimed,imageUrl,value,type);

@override
String toString() {
  return 'WelcomeGiftItemModel(id: $id, title: $title, description: $description, isClaimed: $isClaimed, imageUrl: $imageUrl, value: $value, type: $type)';
}


}

/// @nodoc
abstract mixin class $WelcomeGiftItemModelCopyWith<$Res>  {
  factory $WelcomeGiftItemModelCopyWith(WelcomeGiftItemModel value, $Res Function(WelcomeGiftItemModel) _then) = _$WelcomeGiftItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, bool isClaimed, String? imageUrl, double value, String? type
});




}
/// @nodoc
class _$WelcomeGiftItemModelCopyWithImpl<$Res>
    implements $WelcomeGiftItemModelCopyWith<$Res> {
  _$WelcomeGiftItemModelCopyWithImpl(this._self, this._then);

  final WelcomeGiftItemModel _self;
  final $Res Function(WelcomeGiftItemModel) _then;

/// Create a copy of WelcomeGiftItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? isClaimed = null,Object? imageUrl = freezed,Object? value = null,Object? type = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isClaimed: null == isClaimed ? _self.isClaimed : isClaimed // ignore: cast_nullable_to_non_nullable
as bool,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WelcomeGiftItemModel].
extension WelcomeGiftItemModelPatterns on WelcomeGiftItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WelcomeGiftItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WelcomeGiftItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WelcomeGiftItemModel value)  $default,){
final _that = this;
switch (_that) {
case _WelcomeGiftItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WelcomeGiftItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _WelcomeGiftItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  bool isClaimed,  String? imageUrl,  double value,  String? type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WelcomeGiftItemModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.isClaimed,_that.imageUrl,_that.value,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  bool isClaimed,  String? imageUrl,  double value,  String? type)  $default,) {final _that = this;
switch (_that) {
case _WelcomeGiftItemModel():
return $default(_that.id,_that.title,_that.description,_that.isClaimed,_that.imageUrl,_that.value,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  bool isClaimed,  String? imageUrl,  double value,  String? type)?  $default,) {final _that = this;
switch (_that) {
case _WelcomeGiftItemModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.isClaimed,_that.imageUrl,_that.value,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WelcomeGiftItemModel implements WelcomeGiftItemModel {
  const _WelcomeGiftItemModel({required this.id, required this.title, required this.description, this.isClaimed = false, this.imageUrl, this.value = 0, this.type});
  factory _WelcomeGiftItemModel.fromJson(Map<String, dynamic> json) => _$WelcomeGiftItemModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override@JsonKey() final  bool isClaimed;
@override final  String? imageUrl;
@override@JsonKey() final  double value;
@override final  String? type;

/// Create a copy of WelcomeGiftItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WelcomeGiftItemModelCopyWith<_WelcomeGiftItemModel> get copyWith => __$WelcomeGiftItemModelCopyWithImpl<_WelcomeGiftItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WelcomeGiftItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WelcomeGiftItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.isClaimed, isClaimed) || other.isClaimed == isClaimed)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.value, value) || other.value == value)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,isClaimed,imageUrl,value,type);

@override
String toString() {
  return 'WelcomeGiftItemModel(id: $id, title: $title, description: $description, isClaimed: $isClaimed, imageUrl: $imageUrl, value: $value, type: $type)';
}


}

/// @nodoc
abstract mixin class _$WelcomeGiftItemModelCopyWith<$Res> implements $WelcomeGiftItemModelCopyWith<$Res> {
  factory _$WelcomeGiftItemModelCopyWith(_WelcomeGiftItemModel value, $Res Function(_WelcomeGiftItemModel) _then) = __$WelcomeGiftItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, bool isClaimed, String? imageUrl, double value, String? type
});




}
/// @nodoc
class __$WelcomeGiftItemModelCopyWithImpl<$Res>
    implements _$WelcomeGiftItemModelCopyWith<$Res> {
  __$WelcomeGiftItemModelCopyWithImpl(this._self, this._then);

  final _WelcomeGiftItemModel _self;
  final $Res Function(_WelcomeGiftItemModel) _then;

/// Create a copy of WelcomeGiftItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? isClaimed = null,Object? imageUrl = freezed,Object? value = null,Object? type = freezed,}) {
  return _then(_WelcomeGiftItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isClaimed: null == isClaimed ? _self.isClaimed : isClaimed // ignore: cast_nullable_to_non_nullable
as bool,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
