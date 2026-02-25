// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BannerModel {

 int get id; String get title; String get type; String? get mpPage; String get thumb; ThumbMedia get thumbMedia; int get order;
/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerModelCopyWith<BannerModel> get copyWith => _$BannerModelCopyWithImpl<BannerModel>(this as BannerModel, _$identity);

  /// Serializes this BannerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.mpPage, mpPage) || other.mpPage == mpPage)&&(identical(other.thumb, thumb) || other.thumb == thumb)&&(identical(other.thumbMedia, thumbMedia) || other.thumbMedia == thumbMedia)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,type,mpPage,thumb,thumbMedia,order);

@override
String toString() {
  return 'BannerModel(id: $id, title: $title, type: $type, mpPage: $mpPage, thumb: $thumb, thumbMedia: $thumbMedia, order: $order)';
}


}

/// @nodoc
abstract mixin class $BannerModelCopyWith<$Res>  {
  factory $BannerModelCopyWith(BannerModel value, $Res Function(BannerModel) _then) = _$BannerModelCopyWithImpl;
@useResult
$Res call({
 int id, String title, String type, String? mpPage, String thumb, ThumbMedia thumbMedia, int order
});


$ThumbMediaCopyWith<$Res> get thumbMedia;

}
/// @nodoc
class _$BannerModelCopyWithImpl<$Res>
    implements $BannerModelCopyWith<$Res> {
  _$BannerModelCopyWithImpl(this._self, this._then);

  final BannerModel _self;
  final $Res Function(BannerModel) _then;

/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? type = null,Object? mpPage = freezed,Object? thumb = null,Object? thumbMedia = null,Object? order = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,mpPage: freezed == mpPage ? _self.mpPage : mpPage // ignore: cast_nullable_to_non_nullable
as String?,thumb: null == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as String,thumbMedia: null == thumbMedia ? _self.thumbMedia : thumbMedia // ignore: cast_nullable_to_non_nullable
as ThumbMedia,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThumbMediaCopyWith<$Res> get thumbMedia {
  
  return $ThumbMediaCopyWith<$Res>(_self.thumbMedia, (value) {
    return _then(_self.copyWith(thumbMedia: value));
  });
}
}


/// Adds pattern-matching-related methods to [BannerModel].
extension BannerModelPatterns on BannerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerModel value)  $default,){
final _that = this;
switch (_that) {
case _BannerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerModel value)?  $default,){
final _that = this;
switch (_that) {
case _BannerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String type,  String? mpPage,  String thumb,  ThumbMedia thumbMedia,  int order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerModel() when $default != null:
return $default(_that.id,_that.title,_that.type,_that.mpPage,_that.thumb,_that.thumbMedia,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String type,  String? mpPage,  String thumb,  ThumbMedia thumbMedia,  int order)  $default,) {final _that = this;
switch (_that) {
case _BannerModel():
return $default(_that.id,_that.title,_that.type,_that.mpPage,_that.thumb,_that.thumbMedia,_that.order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String type,  String? mpPage,  String thumb,  ThumbMedia thumbMedia,  int order)?  $default,) {final _that = this;
switch (_that) {
case _BannerModel() when $default != null:
return $default(_that.id,_that.title,_that.type,_that.mpPage,_that.thumb,_that.thumbMedia,_that.order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BannerModel implements BannerModel {
  const _BannerModel({required this.id, required this.title, required this.type, this.mpPage, required this.thumb, required this.thumbMedia, required this.order});
  factory _BannerModel.fromJson(Map<String, dynamic> json) => _$BannerModelFromJson(json);

@override final  int id;
@override final  String title;
@override final  String type;
@override final  String? mpPage;
@override final  String thumb;
@override final  ThumbMedia thumbMedia;
@override final  int order;

/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerModelCopyWith<_BannerModel> get copyWith => __$BannerModelCopyWithImpl<_BannerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BannerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.mpPage, mpPage) || other.mpPage == mpPage)&&(identical(other.thumb, thumb) || other.thumb == thumb)&&(identical(other.thumbMedia, thumbMedia) || other.thumbMedia == thumbMedia)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,type,mpPage,thumb,thumbMedia,order);

@override
String toString() {
  return 'BannerModel(id: $id, title: $title, type: $type, mpPage: $mpPage, thumb: $thumb, thumbMedia: $thumbMedia, order: $order)';
}


}

/// @nodoc
abstract mixin class _$BannerModelCopyWith<$Res> implements $BannerModelCopyWith<$Res> {
  factory _$BannerModelCopyWith(_BannerModel value, $Res Function(_BannerModel) _then) = __$BannerModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String type, String? mpPage, String thumb, ThumbMedia thumbMedia, int order
});


@override $ThumbMediaCopyWith<$Res> get thumbMedia;

}
/// @nodoc
class __$BannerModelCopyWithImpl<$Res>
    implements _$BannerModelCopyWith<$Res> {
  __$BannerModelCopyWithImpl(this._self, this._then);

  final _BannerModel _self;
  final $Res Function(_BannerModel) _then;

/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? type = null,Object? mpPage = freezed,Object? thumb = null,Object? thumbMedia = null,Object? order = null,}) {
  return _then(_BannerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,mpPage: freezed == mpPage ? _self.mpPage : mpPage // ignore: cast_nullable_to_non_nullable
as String?,thumb: null == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as String,thumbMedia: null == thumbMedia ? _self.thumbMedia : thumbMedia // ignore: cast_nullable_to_non_nullable
as ThumbMedia,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThumbMediaCopyWith<$Res> get thumbMedia {
  
  return $ThumbMediaCopyWith<$Res>(_self.thumbMedia, (value) {
    return _then(_self.copyWith(thumbMedia: value));
  });
}
}


/// @nodoc
mixin _$ThumbMedia {

 String get thumbnail; String get webp;
/// Create a copy of ThumbMedia
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThumbMediaCopyWith<ThumbMedia> get copyWith => _$ThumbMediaCopyWithImpl<ThumbMedia>(this as ThumbMedia, _$identity);

  /// Serializes this ThumbMedia to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThumbMedia&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.webp, webp) || other.webp == webp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,thumbnail,webp);

@override
String toString() {
  return 'ThumbMedia(thumbnail: $thumbnail, webp: $webp)';
}


}

/// @nodoc
abstract mixin class $ThumbMediaCopyWith<$Res>  {
  factory $ThumbMediaCopyWith(ThumbMedia value, $Res Function(ThumbMedia) _then) = _$ThumbMediaCopyWithImpl;
@useResult
$Res call({
 String thumbnail, String webp
});




}
/// @nodoc
class _$ThumbMediaCopyWithImpl<$Res>
    implements $ThumbMediaCopyWith<$Res> {
  _$ThumbMediaCopyWithImpl(this._self, this._then);

  final ThumbMedia _self;
  final $Res Function(ThumbMedia) _then;

/// Create a copy of ThumbMedia
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? thumbnail = null,Object? webp = null,}) {
  return _then(_self.copyWith(
thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,webp: null == webp ? _self.webp : webp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ThumbMedia].
extension ThumbMediaPatterns on ThumbMedia {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThumbMedia value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThumbMedia() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThumbMedia value)  $default,){
final _that = this;
switch (_that) {
case _ThumbMedia():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThumbMedia value)?  $default,){
final _that = this;
switch (_that) {
case _ThumbMedia() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String thumbnail,  String webp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThumbMedia() when $default != null:
return $default(_that.thumbnail,_that.webp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String thumbnail,  String webp)  $default,) {final _that = this;
switch (_that) {
case _ThumbMedia():
return $default(_that.thumbnail,_that.webp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String thumbnail,  String webp)?  $default,) {final _that = this;
switch (_that) {
case _ThumbMedia() when $default != null:
return $default(_that.thumbnail,_that.webp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThumbMedia implements ThumbMedia {
  const _ThumbMedia({required this.thumbnail, required this.webp});
  factory _ThumbMedia.fromJson(Map<String, dynamic> json) => _$ThumbMediaFromJson(json);

@override final  String thumbnail;
@override final  String webp;

/// Create a copy of ThumbMedia
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThumbMediaCopyWith<_ThumbMedia> get copyWith => __$ThumbMediaCopyWithImpl<_ThumbMedia>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThumbMediaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThumbMedia&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.webp, webp) || other.webp == webp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,thumbnail,webp);

@override
String toString() {
  return 'ThumbMedia(thumbnail: $thumbnail, webp: $webp)';
}


}

/// @nodoc
abstract mixin class _$ThumbMediaCopyWith<$Res> implements $ThumbMediaCopyWith<$Res> {
  factory _$ThumbMediaCopyWith(_ThumbMedia value, $Res Function(_ThumbMedia) _then) = __$ThumbMediaCopyWithImpl;
@override @useResult
$Res call({
 String thumbnail, String webp
});




}
/// @nodoc
class __$ThumbMediaCopyWithImpl<$Res>
    implements _$ThumbMediaCopyWith<$Res> {
  __$ThumbMediaCopyWithImpl(this._self, this._then);

  final _ThumbMedia _self;
  final $Res Function(_ThumbMedia) _then;

/// Create a copy of ThumbMedia
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? thumbnail = null,Object? webp = null,}) {
  return _then(_ThumbMedia(
thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,webp: null == webp ? _self.webp : webp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
