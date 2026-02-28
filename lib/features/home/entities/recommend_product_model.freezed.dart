// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommend_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecommendProductModel {

 int get id; String get name; String get image; String get category; String get price;@JsonKey(name: 'original_price') String? get originalPrice; List<String> get tags;
/// Create a copy of RecommendProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendProductModelCopyWith<RecommendProductModel> get copyWith => _$RecommendProductModelCopyWithImpl<RecommendProductModel>(this as RecommendProductModel, _$identity);

  /// Serializes this RecommendProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&const DeepCollectionEquality().equals(other.tags, tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image,category,price,originalPrice,const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'RecommendProductModel(id: $id, name: $name, image: $image, category: $category, price: $price, originalPrice: $originalPrice, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $RecommendProductModelCopyWith<$Res>  {
  factory $RecommendProductModelCopyWith(RecommendProductModel value, $Res Function(RecommendProductModel) _then) = _$RecommendProductModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String image, String category, String price,@JsonKey(name: 'original_price') String? originalPrice, List<String> tags
});




}
/// @nodoc
class _$RecommendProductModelCopyWithImpl<$Res>
    implements $RecommendProductModelCopyWith<$Res> {
  _$RecommendProductModelCopyWithImpl(this._self, this._then);

  final RecommendProductModel _self;
  final $Res Function(RecommendProductModel) _then;

/// Create a copy of RecommendProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? image = null,Object? category = null,Object? price = null,Object? originalPrice = freezed,Object? tags = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [RecommendProductModel].
extension RecommendProductModelPatterns on RecommendProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendProductModel value)  $default,){
final _that = this;
switch (_that) {
case _RecommendProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String image,  String category,  String price, @JsonKey(name: 'original_price')  String? originalPrice,  List<String> tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendProductModel() when $default != null:
return $default(_that.id,_that.name,_that.image,_that.category,_that.price,_that.originalPrice,_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String image,  String category,  String price, @JsonKey(name: 'original_price')  String? originalPrice,  List<String> tags)  $default,) {final _that = this;
switch (_that) {
case _RecommendProductModel():
return $default(_that.id,_that.name,_that.image,_that.category,_that.price,_that.originalPrice,_that.tags);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String image,  String category,  String price, @JsonKey(name: 'original_price')  String? originalPrice,  List<String> tags)?  $default,) {final _that = this;
switch (_that) {
case _RecommendProductModel() when $default != null:
return $default(_that.id,_that.name,_that.image,_that.category,_that.price,_that.originalPrice,_that.tags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendProductModel implements RecommendProductModel {
  const _RecommendProductModel({required this.id, this.name = '', this.image = '', this.category = '', this.price = '', @JsonKey(name: 'original_price') this.originalPrice = '', final  List<String> tags = const []}): _tags = tags;
  factory _RecommendProductModel.fromJson(Map<String, dynamic> json) => _$RecommendProductModelFromJson(json);

@override final  int id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String image;
@override@JsonKey() final  String category;
@override@JsonKey() final  String price;
@override@JsonKey(name: 'original_price') final  String? originalPrice;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of RecommendProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendProductModelCopyWith<_RecommendProductModel> get copyWith => __$RecommendProductModelCopyWithImpl<_RecommendProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&const DeepCollectionEquality().equals(other._tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image,category,price,originalPrice,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'RecommendProductModel(id: $id, name: $name, image: $image, category: $category, price: $price, originalPrice: $originalPrice, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$RecommendProductModelCopyWith<$Res> implements $RecommendProductModelCopyWith<$Res> {
  factory _$RecommendProductModelCopyWith(_RecommendProductModel value, $Res Function(_RecommendProductModel) _then) = __$RecommendProductModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String image, String category, String price,@JsonKey(name: 'original_price') String? originalPrice, List<String> tags
});




}
/// @nodoc
class __$RecommendProductModelCopyWithImpl<$Res>
    implements _$RecommendProductModelCopyWith<$Res> {
  __$RecommendProductModelCopyWithImpl(this._self, this._then);

  final _RecommendProductModel _self;
  final $Res Function(_RecommendProductModel) _then;

/// Create a copy of RecommendProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? image = null,Object? category = null,Object? price = null,Object? originalPrice = freezed,Object? tags = null,}) {
  return _then(_RecommendProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
