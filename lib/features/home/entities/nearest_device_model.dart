import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearest_device_model.freezed.dart';
part 'nearest_device_model.g.dart';

@freezed
sealed class NearestDeviceModel with _$NearestDeviceModel {
  const factory NearestDeviceModel({
    required int id,
    @Default('') String name,
    @Default('') String distance,
    @JsonKey(name: 'distance_km') @Default('') String distanceKm,
    @Default('') String latitude,
    @Default('') String longitude,
    @Default(NearestCity(name: '', code: '')) NearestCity city,
    @JsonKey(name: 'street_address') @Default('') String streetAddress,
  }) = _NearestDeviceModel;

  factory NearestDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$NearestDeviceModelFromJson(json);
}

@freezed
sealed class NearestCity with _$NearestCity {
  const factory NearestCity({
    @Default('') String name,
    @Default('') String code,
  }) = _NearestCity;

  factory NearestCity.fromJson(Map<String, dynamic> json) =>
      _$NearestCityFromJson(json);
}
