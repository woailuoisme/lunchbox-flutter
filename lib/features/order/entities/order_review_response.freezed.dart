// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_review_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderReviewResponse {

 int get id; String get content; String get rating;@JsonKey(name: 'rating_stars') String get ratingStars; String get status;@JsonKey(name: 'likes_count') int get likesCount;@JsonKey(name: 'is_liked') bool get isLiked;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;@JsonKey(name: 'created_at_human') String get createdAtHuman;
/// Create a copy of OrderReviewResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderReviewResponseCopyWith<OrderReviewResponse> get copyWith => _$OrderReviewResponseCopyWithImpl<OrderReviewResponse>(this as OrderReviewResponse, _$identity);

  /// Serializes this OrderReviewResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderReviewResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.ratingStars, ratingStars) || other.ratingStars == ratingStars)&&(identical(other.status, status) || other.status == status)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAtHuman, createdAtHuman) || other.createdAtHuman == createdAtHuman));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,rating,ratingStars,status,likesCount,isLiked,createdAt,updatedAt,createdAtHuman);

@override
String toString() {
  return 'OrderReviewResponse(id: $id, content: $content, rating: $rating, ratingStars: $ratingStars, status: $status, likesCount: $likesCount, isLiked: $isLiked, createdAt: $createdAt, updatedAt: $updatedAt, createdAtHuman: $createdAtHuman)';
}


}

/// @nodoc
abstract mixin class $OrderReviewResponseCopyWith<$Res>  {
  factory $OrderReviewResponseCopyWith(OrderReviewResponse value, $Res Function(OrderReviewResponse) _then) = _$OrderReviewResponseCopyWithImpl;
@useResult
$Res call({
 int id, String content, String rating,@JsonKey(name: 'rating_stars') String ratingStars, String status,@JsonKey(name: 'likes_count') int likesCount,@JsonKey(name: 'is_liked') bool isLiked,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'created_at_human') String createdAtHuman
});




}
/// @nodoc
class _$OrderReviewResponseCopyWithImpl<$Res>
    implements $OrderReviewResponseCopyWith<$Res> {
  _$OrderReviewResponseCopyWithImpl(this._self, this._then);

  final OrderReviewResponse _self;
  final $Res Function(OrderReviewResponse) _then;

/// Create a copy of OrderReviewResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? content = null,Object? rating = null,Object? ratingStars = null,Object? status = null,Object? likesCount = null,Object? isLiked = null,Object? createdAt = null,Object? updatedAt = null,Object? createdAtHuman = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as String,ratingStars: null == ratingStars ? _self.ratingStars : ratingStars // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,createdAtHuman: null == createdAtHuman ? _self.createdAtHuman : createdAtHuman // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderReviewResponse].
extension OrderReviewResponsePatterns on OrderReviewResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderReviewResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderReviewResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderReviewResponse value)  $default,){
final _that = this;
switch (_that) {
case _OrderReviewResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderReviewResponse value)?  $default,){
final _that = this;
switch (_that) {
case _OrderReviewResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String content,  String rating, @JsonKey(name: 'rating_stars')  String ratingStars,  String status, @JsonKey(name: 'likes_count')  int likesCount, @JsonKey(name: 'is_liked')  bool isLiked, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'created_at_human')  String createdAtHuman)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderReviewResponse() when $default != null:
return $default(_that.id,_that.content,_that.rating,_that.ratingStars,_that.status,_that.likesCount,_that.isLiked,_that.createdAt,_that.updatedAt,_that.createdAtHuman);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String content,  String rating, @JsonKey(name: 'rating_stars')  String ratingStars,  String status, @JsonKey(name: 'likes_count')  int likesCount, @JsonKey(name: 'is_liked')  bool isLiked, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'created_at_human')  String createdAtHuman)  $default,) {final _that = this;
switch (_that) {
case _OrderReviewResponse():
return $default(_that.id,_that.content,_that.rating,_that.ratingStars,_that.status,_that.likesCount,_that.isLiked,_that.createdAt,_that.updatedAt,_that.createdAtHuman);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String content,  String rating, @JsonKey(name: 'rating_stars')  String ratingStars,  String status, @JsonKey(name: 'likes_count')  int likesCount, @JsonKey(name: 'is_liked')  bool isLiked, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'created_at_human')  String createdAtHuman)?  $default,) {final _that = this;
switch (_that) {
case _OrderReviewResponse() when $default != null:
return $default(_that.id,_that.content,_that.rating,_that.ratingStars,_that.status,_that.likesCount,_that.isLiked,_that.createdAt,_that.updatedAt,_that.createdAtHuman);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderReviewResponse implements OrderReviewResponse {
  const _OrderReviewResponse({required this.id, required this.content, required this.rating, @JsonKey(name: 'rating_stars') required this.ratingStars, required this.status, @JsonKey(name: 'likes_count') required this.likesCount, @JsonKey(name: 'is_liked') required this.isLiked, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'created_at_human') required this.createdAtHuman});
  factory _OrderReviewResponse.fromJson(Map<String, dynamic> json) => _$OrderReviewResponseFromJson(json);

@override final  int id;
@override final  String content;
@override final  String rating;
@override@JsonKey(name: 'rating_stars') final  String ratingStars;
@override final  String status;
@override@JsonKey(name: 'likes_count') final  int likesCount;
@override@JsonKey(name: 'is_liked') final  bool isLiked;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
@override@JsonKey(name: 'created_at_human') final  String createdAtHuman;

/// Create a copy of OrderReviewResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderReviewResponseCopyWith<_OrderReviewResponse> get copyWith => __$OrderReviewResponseCopyWithImpl<_OrderReviewResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderReviewResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderReviewResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.ratingStars, ratingStars) || other.ratingStars == ratingStars)&&(identical(other.status, status) || other.status == status)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAtHuman, createdAtHuman) || other.createdAtHuman == createdAtHuman));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,rating,ratingStars,status,likesCount,isLiked,createdAt,updatedAt,createdAtHuman);

@override
String toString() {
  return 'OrderReviewResponse(id: $id, content: $content, rating: $rating, ratingStars: $ratingStars, status: $status, likesCount: $likesCount, isLiked: $isLiked, createdAt: $createdAt, updatedAt: $updatedAt, createdAtHuman: $createdAtHuman)';
}


}

/// @nodoc
abstract mixin class _$OrderReviewResponseCopyWith<$Res> implements $OrderReviewResponseCopyWith<$Res> {
  factory _$OrderReviewResponseCopyWith(_OrderReviewResponse value, $Res Function(_OrderReviewResponse) _then) = __$OrderReviewResponseCopyWithImpl;
@override @useResult
$Res call({
 int id, String content, String rating,@JsonKey(name: 'rating_stars') String ratingStars, String status,@JsonKey(name: 'likes_count') int likesCount,@JsonKey(name: 'is_liked') bool isLiked,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'created_at_human') String createdAtHuman
});




}
/// @nodoc
class __$OrderReviewResponseCopyWithImpl<$Res>
    implements _$OrderReviewResponseCopyWith<$Res> {
  __$OrderReviewResponseCopyWithImpl(this._self, this._then);

  final _OrderReviewResponse _self;
  final $Res Function(_OrderReviewResponse) _then;

/// Create a copy of OrderReviewResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? content = null,Object? rating = null,Object? ratingStars = null,Object? status = null,Object? likesCount = null,Object? isLiked = null,Object? createdAt = null,Object? updatedAt = null,Object? createdAtHuman = null,}) {
  return _then(_OrderReviewResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as String,ratingStars: null == ratingStars ? _self.ratingStars : ratingStars // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,createdAtHuman: null == createdAtHuman ? _self.createdAtHuman : createdAtHuman // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
