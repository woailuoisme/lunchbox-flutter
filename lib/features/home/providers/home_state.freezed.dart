// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 CityModel? get currentCity; List<DeviceModel> get nearbyDevices; bool get isLoading; int get selectedTabIndex;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.currentCity, currentCity) || other.currentCity == currentCity)&&const DeepCollectionEquality().equals(other.nearbyDevices, nearbyDevices)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selectedTabIndex, selectedTabIndex) || other.selectedTabIndex == selectedTabIndex));
}


@override
int get hashCode => Object.hash(runtimeType,currentCity,const DeepCollectionEquality().hash(nearbyDevices),isLoading,selectedTabIndex);

@override
String toString() {
  return 'HomeState(currentCity: $currentCity, nearbyDevices: $nearbyDevices, isLoading: $isLoading, selectedTabIndex: $selectedTabIndex)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 CityModel? currentCity, List<DeviceModel> nearbyDevices, bool isLoading, int selectedTabIndex
});


$CityModelCopyWith<$Res>? get currentCity;

}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentCity = freezed,Object? nearbyDevices = null,Object? isLoading = null,Object? selectedTabIndex = null,}) {
  return _then(_self.copyWith(
currentCity: freezed == currentCity ? _self.currentCity : currentCity // ignore: cast_nullable_to_non_nullable
as CityModel?,nearbyDevices: null == nearbyDevices ? _self.nearbyDevices : nearbyDevices // ignore: cast_nullable_to_non_nullable
as List<DeviceModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,selectedTabIndex: null == selectedTabIndex ? _self.selectedTabIndex : selectedTabIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityModelCopyWith<$Res>? get currentCity {
    if (_self.currentCity == null) {
    return null;
  }

  return $CityModelCopyWith<$Res>(_self.currentCity!, (value) {
    return _then(_self.copyWith(currentCity: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CityModel? currentCity,  List<DeviceModel> nearbyDevices,  bool isLoading,  int selectedTabIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.currentCity,_that.nearbyDevices,_that.isLoading,_that.selectedTabIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CityModel? currentCity,  List<DeviceModel> nearbyDevices,  bool isLoading,  int selectedTabIndex)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.currentCity,_that.nearbyDevices,_that.isLoading,_that.selectedTabIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CityModel? currentCity,  List<DeviceModel> nearbyDevices,  bool isLoading,  int selectedTabIndex)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.currentCity,_that.nearbyDevices,_that.isLoading,_that.selectedTabIndex);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({this.currentCity, final  List<DeviceModel> nearbyDevices = const [], this.isLoading = false, this.selectedTabIndex = 0}): _nearbyDevices = nearbyDevices;
  

@override final  CityModel? currentCity;
 final  List<DeviceModel> _nearbyDevices;
@override@JsonKey() List<DeviceModel> get nearbyDevices {
  if (_nearbyDevices is EqualUnmodifiableListView) return _nearbyDevices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nearbyDevices);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  int selectedTabIndex;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.currentCity, currentCity) || other.currentCity == currentCity)&&const DeepCollectionEquality().equals(other._nearbyDevices, _nearbyDevices)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selectedTabIndex, selectedTabIndex) || other.selectedTabIndex == selectedTabIndex));
}


@override
int get hashCode => Object.hash(runtimeType,currentCity,const DeepCollectionEquality().hash(_nearbyDevices),isLoading,selectedTabIndex);

@override
String toString() {
  return 'HomeState(currentCity: $currentCity, nearbyDevices: $nearbyDevices, isLoading: $isLoading, selectedTabIndex: $selectedTabIndex)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 CityModel? currentCity, List<DeviceModel> nearbyDevices, bool isLoading, int selectedTabIndex
});


@override $CityModelCopyWith<$Res>? get currentCity;

}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentCity = freezed,Object? nearbyDevices = null,Object? isLoading = null,Object? selectedTabIndex = null,}) {
  return _then(_HomeState(
currentCity: freezed == currentCity ? _self.currentCity : currentCity // ignore: cast_nullable_to_non_nullable
as CityModel?,nearbyDevices: null == nearbyDevices ? _self._nearbyDevices : nearbyDevices // ignore: cast_nullable_to_non_nullable
as List<DeviceModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,selectedTabIndex: null == selectedTabIndex ? _self.selectedTabIndex : selectedTabIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityModelCopyWith<$Res>? get currentCity {
    if (_self.currentCity == null) {
    return null;
  }

  return $CityModelCopyWith<$Res>(_self.currentCity!, (value) {
    return _then(_self.copyWith(currentCity: value));
  });
}
}

// dart format on
