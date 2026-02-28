// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductReviewModel {

/// 评价ID
 String get id;/// 商品ID
 String get productId;/// 用户ID
 String get userId;/// 用户昵称
 String get userName;/// 用户头像
 String get avatarUrl;/// 评分 (1-5)
 double get rating;/// 评价内容
 String get content;/// 评价时间
@JsonKey(name: 'created_at') String get createdAt;/// 评价图片列表
 List<String> get images;
/// Create a copy of ProductReviewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductReviewModelCopyWith<ProductReviewModel> get copyWith => _$ProductReviewModelCopyWithImpl<ProductReviewModel>(this as ProductReviewModel, _$identity);

  /// Serializes this ProductReviewModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductReviewModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.images, images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,userId,userName,avatarUrl,rating,content,createdAt,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'ProductReviewModel(id: $id, productId: $productId, userId: $userId, userName: $userName, avatarUrl: $avatarUrl, rating: $rating, content: $content, createdAt: $createdAt, images: $images)';
}


}

/// @nodoc
abstract mixin class $ProductReviewModelCopyWith<$Res>  {
  factory $ProductReviewModelCopyWith(ProductReviewModel value, $Res Function(ProductReviewModel) _then) = _$ProductReviewModelCopyWithImpl;
@useResult
$Res call({
 String id, String productId, String userId, String userName, String avatarUrl, double rating, String content,@JsonKey(name: 'created_at') String createdAt, List<String> images
});




}
/// @nodoc
class _$ProductReviewModelCopyWithImpl<$Res>
    implements $ProductReviewModelCopyWith<$Res> {
  _$ProductReviewModelCopyWithImpl(this._self, this._then);

  final ProductReviewModel _self;
  final $Res Function(ProductReviewModel) _then;

/// Create a copy of ProductReviewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? userId = null,Object? userName = null,Object? avatarUrl = null,Object? rating = null,Object? content = null,Object? createdAt = null,Object? images = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductReviewModel].
extension ProductReviewModelPatterns on ProductReviewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductReviewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductReviewModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductReviewModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductReviewModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductReviewModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductReviewModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String productId,  String userId,  String userName,  String avatarUrl,  double rating,  String content, @JsonKey(name: 'created_at')  String createdAt,  List<String> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductReviewModel() when $default != null:
return $default(_that.id,_that.productId,_that.userId,_that.userName,_that.avatarUrl,_that.rating,_that.content,_that.createdAt,_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String productId,  String userId,  String userName,  String avatarUrl,  double rating,  String content, @JsonKey(name: 'created_at')  String createdAt,  List<String> images)  $default,) {final _that = this;
switch (_that) {
case _ProductReviewModel():
return $default(_that.id,_that.productId,_that.userId,_that.userName,_that.avatarUrl,_that.rating,_that.content,_that.createdAt,_that.images);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String productId,  String userId,  String userName,  String avatarUrl,  double rating,  String content, @JsonKey(name: 'created_at')  String createdAt,  List<String> images)?  $default,) {final _that = this;
switch (_that) {
case _ProductReviewModel() when $default != null:
return $default(_that.id,_that.productId,_that.userId,_that.userName,_that.avatarUrl,_that.rating,_that.content,_that.createdAt,_that.images);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductReviewModel implements ProductReviewModel {
  const _ProductReviewModel({required this.id, this.productId = '', this.userId = '', this.userName = '', this.avatarUrl = '', this.rating = 5.0, this.content = '', @JsonKey(name: 'created_at') this.createdAt = '', final  List<String> images = const []}): _images = images;
  factory _ProductReviewModel.fromJson(Map<String, dynamic> json) => _$ProductReviewModelFromJson(json);

/// 评价ID
@override final  String id;
/// 商品ID
@override@JsonKey() final  String productId;
/// 用户ID
@override@JsonKey() final  String userId;
/// 用户昵称
@override@JsonKey() final  String userName;
/// 用户头像
@override@JsonKey() final  String avatarUrl;
/// 评分 (1-5)
@override@JsonKey() final  double rating;
/// 评价内容
@override@JsonKey() final  String content;
/// 评价时间
@override@JsonKey(name: 'created_at') final  String createdAt;
/// 评价图片列表
 final  List<String> _images;
/// 评价图片列表
@override@JsonKey() List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of ProductReviewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductReviewModelCopyWith<_ProductReviewModel> get copyWith => __$ProductReviewModelCopyWithImpl<_ProductReviewModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductReviewModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductReviewModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,userId,userName,avatarUrl,rating,content,createdAt,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'ProductReviewModel(id: $id, productId: $productId, userId: $userId, userName: $userName, avatarUrl: $avatarUrl, rating: $rating, content: $content, createdAt: $createdAt, images: $images)';
}


}

/// @nodoc
abstract mixin class _$ProductReviewModelCopyWith<$Res> implements $ProductReviewModelCopyWith<$Res> {
  factory _$ProductReviewModelCopyWith(_ProductReviewModel value, $Res Function(_ProductReviewModel) _then) = __$ProductReviewModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String productId, String userId, String userName, String avatarUrl, double rating, String content,@JsonKey(name: 'created_at') String createdAt, List<String> images
});




}
/// @nodoc
class __$ProductReviewModelCopyWithImpl<$Res>
    implements _$ProductReviewModelCopyWith<$Res> {
  __$ProductReviewModelCopyWithImpl(this._self, this._then);

  final _ProductReviewModel _self;
  final $Res Function(_ProductReviewModel) _then;

/// Create a copy of ProductReviewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? userId = null,Object? userName = null,Object? avatarUrl = null,Object? rating = null,Object? content = null,Object? createdAt = null,Object? images = null,}) {
  return _then(_ProductReviewModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
