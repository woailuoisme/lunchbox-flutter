import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/features/auth/models/user_model.dart';
import 'package:lunchbox/features/device/entities/device_model.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    UserModel? currentUser,
    @Default([]) List<DeviceModel> favoriteDevices,
    @Default(false) bool isLoading,
  }) = _ProfileState;
}
