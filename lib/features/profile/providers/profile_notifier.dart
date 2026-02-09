import 'package:lunchbox/core/services/storage_service.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/features/auth/repositories/auth_repository.dart';
import 'package:lunchbox/features/device/entities/device_model.dart';
import 'package:lunchbox/features/profile/providers/profile_state.dart';
import 'package:lunchbox/features/profile/repositories/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_notifier.g.dart';

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  static const String _keyFavoriteDevices = 'favorite_devices';

  @override
  ProfileState build() {
    // 异步初始化
    Future.microtask(_init);
    return const ProfileState();
  }

  Future<void> _init() async {
    await loadUserInfo();
    loadFavoriteDevices();
  }

  /// 加载用户信息
  Future<void> loadUserInfo() async {
    try {
      state = state.copyWith(isLoading: true);
      LoggerUtils.i(
        'ProfileNotifier: Loading user info from Mock Repository (v2)',
      );
      final repository = ref.read(profileRepositoryProvider.notifier);
      final user = await repository.getUserInfo();

      state = state.copyWith(currentUser: user);
      LoggerUtils.i('ProfileNotifier: User info loaded successfully');
    } catch (e) {
      LoggerUtils.e('ProfileNotifier: Failed to load user info', e);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  /// 加载收藏设备
  void loadFavoriteDevices() {
    try {
      final storageService = ref.read(storageServiceProvider);
      final data = storageService.read<List<dynamic>>(_keyFavoriteDevices);
      if (data != null) {
        final devices = data
            .map((json) => DeviceModel.fromJson(json as Map<String, dynamic>))
            .toList();
        state = state.copyWith(favoriteDevices: devices);
        LoggerUtils.i(
          'ProfileNotifier: Loaded ${devices.length} favorite devices',
        );
      }
    } catch (e) {
      LoggerUtils.e('ProfileNotifier: Failed to load favorite devices', e);
    }
  }

  /// 添加收藏设备
  Future<void> addFavoriteDevice(DeviceModel device) async {
    try {
      if (isFavorite(device.id)) {
        return;
      }

      final updatedList = [...state.favoriteDevices, device];
      state = state.copyWith(favoriteDevices: updatedList);
      await _saveFavoriteDevices();
      LoggerUtils.i('ProfileNotifier: Added favorite device: ${device.name}');
    } catch (e) {
      LoggerUtils.e('ProfileNotifier: Failed to add favorite device', e);
      rethrow;
    }
  }

  /// 移除收藏设备
  Future<void> removeFavoriteDevice(String deviceId) async {
    try {
      final updatedList = state.favoriteDevices
          .where((d) => d.id != deviceId)
          .toList();
      state = state.copyWith(favoriteDevices: updatedList);
      await _saveFavoriteDevices();
      LoggerUtils.i('ProfileNotifier: Removed favorite device: $deviceId');
    } catch (e) {
      LoggerUtils.e('ProfileNotifier: Failed to remove favorite device', e);
      rethrow;
    }
  }

  /// 检查设备是否已收藏
  bool isFavorite(String deviceId) {
    return state.favoriteDevices.any((device) => device.id == deviceId);
  }

  /// 保存收藏设备
  Future<void> _saveFavoriteDevices() async {
    try {
      final storageService = ref.read(storageServiceProvider);
      final data = state.favoriteDevices
          .map((device) => device.toJson())
          .toList();
      await storageService.write(_keyFavoriteDevices, data);
    } catch (e) {
      LoggerUtils.e('ProfileNotifier: Failed to save favorite devices', e);
    }
  }

  /// 更新用户信息
  Future<void> updateUserInfo({
    String? nickname,
    String? avatar,
    String? gender,
    DateTime? birthday,
  }) async {
    try {
      if (state.currentUser == null) {
        return;
      }

      state = state.copyWith(isLoading: true);

      final repository = ref.read(profileRepositoryProvider.notifier);
      final updatedUser = await repository.updateUserInfo(
        currentUser: state.currentUser!,
        nickname: nickname,
        avatar: avatar,
        gender: gender,
        birthday: birthday,
      );

      state = state.copyWith(currentUser: updatedUser);
      LoggerUtils.i('ProfileNotifier: User info updated');
    } catch (e) {
      LoggerUtils.e('ProfileNotifier: Failed to update user info', e);
      rethrow;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  /// 登出
  Future<void> logout() async {
    try {
      final authRepository = ref.read(authRepositoryProvider);
      await authRepository.logout().run();
      state = state.copyWith(currentUser: null);
      LoggerUtils.i('ProfileNotifier: User logged out');
    } catch (e) {
      LoggerUtils.e('ProfileNotifier: Failed to logout', e);
      rethrow;
    }
  }
}
