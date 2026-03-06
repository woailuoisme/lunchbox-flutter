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

 NearestDeviceModel? get nearestDevice; List<BannerModel> get banners; List<RecommendProductModel> get recommendProducts; bool get isLoading; int get selectedTabIndex; String? get errorMessage;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.nearestDevice, nearestDevice) || other.nearestDevice == nearestDevice)&&const DeepCollectionEquality().equals(other.banners, banners)&&const DeepCollectionEquality().equals(other.recommendProducts, recommendProducts)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selectedTabIndex, selectedTabIndex) || other.selectedTabIndex == selectedTabIndex)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,nearestDevice,const DeepCollectionEquality().hash(banners),const DeepCollectionEquality().hash(recommendProducts),isLoading,selectedTabIndex,errorMessage);

@override
String toString() {
  return 'HomeState(nearestDevice: $nearestDevice, banners: $banners, recommendProducts: $recommendProducts, isLoading: $isLoading, selectedTabIndex: $selectedTabIndex, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 NearestDeviceModel? nearestDevice, List<BannerModel> banners, List<RecommendProductModel> recommendProducts, bool isLoading, int selectedTabIndex, String? errorMessage
});


$NearestDeviceModelCopyWith<$Res>? get nearestDevice;

}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nearestDevice = freezed,Object? banners = null,Object? recommendProducts = null,Object? isLoading = null,Object? selectedTabIndex = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
nearestDevice: freezed == nearestDevice ? _self.nearestDevice : nearestDevice // ignore: cast_nullable_to_non_nullable
as NearestDeviceModel?,banners: null == banners ? _self.banners : banners // ignore: cast_nullable_to_non_nullable
as List<BannerModel>,recommendProducts: null == recommendProducts ? _self.recommendProducts : recommendProducts // ignore: cast_nullable_to_non_nullable
as List<RecommendProductModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,selectedTabIndex: null == selectedTabIndex ? _self.selectedTabIndex : selectedTabIndex // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NearestDeviceModelCopyWith<$Res>? get nearestDevice {
    if (_self.nearestDevice == null) {
    return null;
  }

  return $NearestDeviceModelCopyWith<$Res>(_self.nearestDevice!, (value) {
    return _then(_self.copyWith(nearestDevice: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NearestDeviceModel? nearestDevice,  List<BannerModel> banners,  List<RecommendProductModel> recommendProducts,  bool isLoading,  int selectedTabIndex,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.nearestDevice,_that.banners,_that.recommendProducts,_that.isLoading,_that.selectedTabIndex,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NearestDeviceModel? nearestDevice,  List<BannerModel> banners,  List<RecommendProductModel> recommendProducts,  bool isLoading,  int selectedTabIndex,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.nearestDevice,_that.banners,_that.recommendProducts,_that.isLoading,_that.selectedTabIndex,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NearestDeviceModel? nearestDevice,  List<BannerModel> banners,  List<RecommendProductModel> recommendProducts,  bool isLoading,  int selectedTabIndex,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.nearestDevice,_that.banners,_that.recommendProducts,_that.isLoading,_that.selectedTabIndex,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({this.nearestDevice, final  List<BannerModel> banners = const [], final  List<RecommendProductModel> recommendProducts = const [], this.isLoading = false, this.selectedTabIndex = 0, this.errorMessage}): _banners = banners,_recommendProducts = recommendProducts;
  

@override final  NearestDeviceModel? nearestDevice;
 final  List<BannerModel> _banners;
@override@JsonKey() List<BannerModel> get banners {
  if (_banners is EqualUnmodifiableListView) return _banners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_banners);
}

 final  List<RecommendProductModel> _recommendProducts;
@override@JsonKey() List<RecommendProductModel> get recommendProducts {
  if (_recommendProducts is EqualUnmodifiableListView) return _recommendProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recommendProducts);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  int selectedTabIndex;
@override final  String? errorMessage;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.nearestDevice, nearestDevice) || other.nearestDevice == nearestDevice)&&const DeepCollectionEquality().equals(other._banners, _banners)&&const DeepCollectionEquality().equals(other._recommendProducts, _recommendProducts)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selectedTabIndex, selectedTabIndex) || other.selectedTabIndex == selectedTabIndex)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,nearestDevice,const DeepCollectionEquality().hash(_banners),const DeepCollectionEquality().hash(_recommendProducts),isLoading,selectedTabIndex,errorMessage);

@override
String toString() {
  return 'HomeState(nearestDevice: $nearestDevice, banners: $banners, recommendProducts: $recommendProducts, isLoading: $isLoading, selectedTabIndex: $selectedTabIndex, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 NearestDeviceModel? nearestDevice, List<BannerModel> banners, List<RecommendProductModel> recommendProducts, bool isLoading, int selectedTabIndex, String? errorMessage
});


@override $NearestDeviceModelCopyWith<$Res>? get nearestDevice;

}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nearestDevice = freezed,Object? banners = null,Object? recommendProducts = null,Object? isLoading = null,Object? selectedTabIndex = null,Object? errorMessage = freezed,}) {
  return _then(_HomeState(
nearestDevice: freezed == nearestDevice ? _self.nearestDevice : nearestDevice // ignore: cast_nullable_to_non_nullable
as NearestDeviceModel?,banners: null == banners ? _self._banners : banners // ignore: cast_nullable_to_non_nullable
as List<BannerModel>,recommendProducts: null == recommendProducts ? _self._recommendProducts : recommendProducts // ignore: cast_nullable_to_non_nullable
as List<RecommendProductModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,selectedTabIndex: null == selectedTabIndex ? _self.selectedTabIndex : selectedTabIndex // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NearestDeviceModelCopyWith<$Res>? get nearestDevice {
    if (_self.nearestDevice == null) {
    return null;
  }

  return $NearestDeviceModelCopyWith<$Res>(_self.nearestDevice!, (value) {
    return _then(_self.copyWith(nearestDevice: value));
  });
}
}

// dart format on
