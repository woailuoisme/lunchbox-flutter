// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partner_consult_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartnerConsultRequest {

 String get name; String get phone; String get company; String get message;
/// Create a copy of PartnerConsultRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartnerConsultRequestCopyWith<PartnerConsultRequest> get copyWith => _$PartnerConsultRequestCopyWithImpl<PartnerConsultRequest>(this as PartnerConsultRequest, _$identity);

  /// Serializes this PartnerConsultRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerConsultRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.company, company) || other.company == company)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,company,message);

@override
String toString() {
  return 'PartnerConsultRequest(name: $name, phone: $phone, company: $company, message: $message)';
}


}

/// @nodoc
abstract mixin class $PartnerConsultRequestCopyWith<$Res>  {
  factory $PartnerConsultRequestCopyWith(PartnerConsultRequest value, $Res Function(PartnerConsultRequest) _then) = _$PartnerConsultRequestCopyWithImpl;
@useResult
$Res call({
 String name, String phone, String company, String message
});




}
/// @nodoc
class _$PartnerConsultRequestCopyWithImpl<$Res>
    implements $PartnerConsultRequestCopyWith<$Res> {
  _$PartnerConsultRequestCopyWithImpl(this._self, this._then);

  final PartnerConsultRequest _self;
  final $Res Function(PartnerConsultRequest) _then;

/// Create a copy of PartnerConsultRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? phone = null,Object? company = null,Object? message = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PartnerConsultRequest].
extension PartnerConsultRequestPatterns on PartnerConsultRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartnerConsultRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartnerConsultRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartnerConsultRequest value)  $default,){
final _that = this;
switch (_that) {
case _PartnerConsultRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartnerConsultRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PartnerConsultRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String phone,  String company,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartnerConsultRequest() when $default != null:
return $default(_that.name,_that.phone,_that.company,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String phone,  String company,  String message)  $default,) {final _that = this;
switch (_that) {
case _PartnerConsultRequest():
return $default(_that.name,_that.phone,_that.company,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String phone,  String company,  String message)?  $default,) {final _that = this;
switch (_that) {
case _PartnerConsultRequest() when $default != null:
return $default(_that.name,_that.phone,_that.company,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartnerConsultRequest implements PartnerConsultRequest {
  const _PartnerConsultRequest({required this.name, required this.phone, required this.company, required this.message});
  factory _PartnerConsultRequest.fromJson(Map<String, dynamic> json) => _$PartnerConsultRequestFromJson(json);

@override final  String name;
@override final  String phone;
@override final  String company;
@override final  String message;

/// Create a copy of PartnerConsultRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartnerConsultRequestCopyWith<_PartnerConsultRequest> get copyWith => __$PartnerConsultRequestCopyWithImpl<_PartnerConsultRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartnerConsultRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartnerConsultRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.company, company) || other.company == company)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,company,message);

@override
String toString() {
  return 'PartnerConsultRequest(name: $name, phone: $phone, company: $company, message: $message)';
}


}

/// @nodoc
abstract mixin class _$PartnerConsultRequestCopyWith<$Res> implements $PartnerConsultRequestCopyWith<$Res> {
  factory _$PartnerConsultRequestCopyWith(_PartnerConsultRequest value, $Res Function(_PartnerConsultRequest) _then) = __$PartnerConsultRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String phone, String company, String message
});




}
/// @nodoc
class __$PartnerConsultRequestCopyWithImpl<$Res>
    implements _$PartnerConsultRequestCopyWith<$Res> {
  __$PartnerConsultRequestCopyWithImpl(this._self, this._then);

  final _PartnerConsultRequest _self;
  final $Res Function(_PartnerConsultRequest) _then;

/// Create a copy of PartnerConsultRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? phone = null,Object? company = null,Object? message = null,}) {
  return _then(_PartnerConsultRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
