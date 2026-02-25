import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearest_device_model.freezed.dart';
part 'nearest_device_model.g.dart';

@freezed
abstract class NearestDeviceModel with _$NearestDeviceModel {
  const factory NearestDeviceModel({
    required int id,
    required String name,
    required String distance,
    @JsonKey(name: 'distance_km') required String distanceKm,
    required String latitude,
    required String longitude,
    required NearestCity city,
    @JsonKey(name: 'street_address') required String streetAddress,
  }) = _NearestDeviceModel;

  factory NearestDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$NearestDeviceModelFromJson(json);
}

@freezed
abstract class NearestCity with _$NearestCity {
  const factory NearestCity({required String name, required String code}) =
      _NearestCity;

  factory NearestCity.fromJson(Map<String, dynamic> json) =>
      _$NearestCityFromJson(json);
}
