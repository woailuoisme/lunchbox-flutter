import 'package:freezed_annotation/freezed_annotation.dart';
import '../../city/entities/city_model.dart';
import '../../device/entities/device_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    CityModel? currentCity,
    @Default([]) List<DeviceModel> nearbyDevices,
    @Default(false) bool isLoading,
    @Default(0) int selectedTabIndex,
  }) = _HomeState;
}
