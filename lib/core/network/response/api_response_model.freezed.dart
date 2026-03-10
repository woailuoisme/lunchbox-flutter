// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiResponseModel<T> {

/// 响应状态码
 int get code;/// 响应消息
 String get message;/// 响应时间戳
 int get timestamp;/// 响应数据
 T? get data;
/// Create a copy of ApiResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResponseModelCopyWith<T, ApiResponseModel<T>> get copyWith => _$ApiResponseModelCopyWithImpl<T, ApiResponseModel<T>>(this as ApiResponseModel<T>, _$identity);

  /// Serializes this ApiResponseModel to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponseModel<T>&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,timestamp,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ApiResponseModel<$T>(code: $code, message: $message, timestamp: $timestamp, data: $data)';
}


}

/// @nodoc
abstract mixin class $ApiResponseModelCopyWith<T,$Res>  {
  factory $ApiResponseModelCopyWith(ApiResponseModel<T> value, $Res Function(ApiResponseModel<T>) _then) = _$ApiResponseModelCopyWithImpl;
@useResult
$Res call({
 int code, String message, int timestamp, T? data
});




}
/// @nodoc
class _$ApiResponseModelCopyWithImpl<T,$Res>
    implements $ApiResponseModelCopyWith<T, $Res> {
  _$ApiResponseModelCopyWithImpl(this._self, this._then);

  final ApiResponseModel<T> _self;
  final $Res Function(ApiResponseModel<T>) _then;

/// Create a copy of ApiResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? message = null,Object? timestamp = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiResponseModel].
extension ApiResponseModelPatterns<T> on ApiResponseModel<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiResponseModel<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiResponseModel<T> value)  $default,){
final _that = this;
switch (_that) {
case _ApiResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiResponseModel<T> value)?  $default,){
final _that = this;
switch (_that) {
case _ApiResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int code,  String message,  int timestamp,  T? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiResponseModel() when $default != null:
return $default(_that.code,_that.message,_that.timestamp,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int code,  String message,  int timestamp,  T? data)  $default,) {final _that = this;
switch (_that) {
case _ApiResponseModel():
return $default(_that.code,_that.message,_that.timestamp,_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int code,  String message,  int timestamp,  T? data)?  $default,) {final _that = this;
switch (_that) {
case _ApiResponseModel() when $default != null:
return $default(_that.code,_that.message,_that.timestamp,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _ApiResponseModel<T> extends ApiResponseModel<T> {
  const _ApiResponseModel({this.code = 0, this.message = '', this.timestamp = 0, this.data}): super._();
  factory _ApiResponseModel.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$ApiResponseModelFromJson(json,fromJsonT);

/// 响应状态码
@override@JsonKey() final  int code;
/// 响应消息
@override@JsonKey() final  String message;
/// 响应时间戳
@override@JsonKey() final  int timestamp;
/// 响应数据
@override final  T? data;

/// Create a copy of ApiResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiResponseModelCopyWith<T, _ApiResponseModel<T>> get copyWith => __$ApiResponseModelCopyWithImpl<T, _ApiResponseModel<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$ApiResponseModelToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiResponseModel<T>&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,timestamp,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ApiResponseModel<$T>(code: $code, message: $message, timestamp: $timestamp, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ApiResponseModelCopyWith<T,$Res> implements $ApiResponseModelCopyWith<T, $Res> {
  factory _$ApiResponseModelCopyWith(_ApiResponseModel<T> value, $Res Function(_ApiResponseModel<T>) _then) = __$ApiResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int code, String message, int timestamp, T? data
});




}
/// @nodoc
class __$ApiResponseModelCopyWithImpl<T,$Res>
    implements _$ApiResponseModelCopyWith<T, $Res> {
  __$ApiResponseModelCopyWithImpl(this._self, this._then);

  final _ApiResponseModel<T> _self;
  final $Res Function(_ApiResponseModel<T>) _then;

/// Create a copy of ApiResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,Object? timestamp = null,Object? data = freezed,}) {
  return _then(_ApiResponseModel<T>(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}


/// @nodoc
mixin _$PaginatedResponseModel<T> {

/// 数据列表
 List<T> get list;/// 总数
 int get total;/// 当前页码
 int get page;/// 每页数量
 int get pageSize;
/// Create a copy of PaginatedResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedResponseModelCopyWith<T, PaginatedResponseModel<T>> get copyWith => _$PaginatedResponseModelCopyWithImpl<T, PaginatedResponseModel<T>>(this as PaginatedResponseModel<T>, _$identity);

  /// Serializes this PaginatedResponseModel to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedResponseModel<T>&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list),total,page,pageSize);

@override
String toString() {
  return 'PaginatedResponseModel<$T>(list: $list, total: $total, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class $PaginatedResponseModelCopyWith<T,$Res>  {
  factory $PaginatedResponseModelCopyWith(PaginatedResponseModel<T> value, $Res Function(PaginatedResponseModel<T>) _then) = _$PaginatedResponseModelCopyWithImpl;
@useResult
$Res call({
 List<T> list, int total, int page, int pageSize
});




}
/// @nodoc
class _$PaginatedResponseModelCopyWithImpl<T,$Res>
    implements $PaginatedResponseModelCopyWith<T, $Res> {
  _$PaginatedResponseModelCopyWithImpl(this._self, this._then);

  final PaginatedResponseModel<T> _self;
  final $Res Function(PaginatedResponseModel<T>) _then;

/// Create a copy of PaginatedResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? total = null,Object? page = null,Object? pageSize = null,}) {
  return _then(_self.copyWith(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<T>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedResponseModel].
extension PaginatedResponseModelPatterns<T> on PaginatedResponseModel<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedResponseModel<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedResponseModel<T> value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedResponseModel<T> value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<T> list,  int total,  int page,  int pageSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedResponseModel() when $default != null:
return $default(_that.list,_that.total,_that.page,_that.pageSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<T> list,  int total,  int page,  int pageSize)  $default,) {final _that = this;
switch (_that) {
case _PaginatedResponseModel():
return $default(_that.list,_that.total,_that.page,_that.pageSize);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<T> list,  int total,  int page,  int pageSize)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedResponseModel() when $default != null:
return $default(_that.list,_that.total,_that.page,_that.pageSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _PaginatedResponseModel<T> extends PaginatedResponseModel<T> {
  const _PaginatedResponseModel({final  List<T> list = const [], this.total = 0, this.page = 1, this.pageSize = 10}): _list = list,super._();
  factory _PaginatedResponseModel.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$PaginatedResponseModelFromJson(json,fromJsonT);

/// 数据列表
 final  List<T> _list;
/// 数据列表
@override@JsonKey() List<T> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

/// 总数
@override@JsonKey() final  int total;
/// 当前页码
@override@JsonKey() final  int page;
/// 每页数量
@override@JsonKey() final  int pageSize;

/// Create a copy of PaginatedResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedResponseModelCopyWith<T, _PaginatedResponseModel<T>> get copyWith => __$PaginatedResponseModelCopyWithImpl<T, _PaginatedResponseModel<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$PaginatedResponseModelToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedResponseModel<T>&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list),total,page,pageSize);

@override
String toString() {
  return 'PaginatedResponseModel<$T>(list: $list, total: $total, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$PaginatedResponseModelCopyWith<T,$Res> implements $PaginatedResponseModelCopyWith<T, $Res> {
  factory _$PaginatedResponseModelCopyWith(_PaginatedResponseModel<T> value, $Res Function(_PaginatedResponseModel<T>) _then) = __$PaginatedResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<T> list, int total, int page, int pageSize
});




}
/// @nodoc
class __$PaginatedResponseModelCopyWithImpl<T,$Res>
    implements _$PaginatedResponseModelCopyWith<T, $Res> {
  __$PaginatedResponseModelCopyWithImpl(this._self, this._then);

  final _PaginatedResponseModel<T> _self;
  final $Res Function(_PaginatedResponseModel<T>) _then;

/// Create a copy of PaginatedResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? total = null,Object? page = null,Object? pageSize = null,}) {
  return _then(_PaginatedResponseModel<T>(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<T>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
