import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/features/profile/entities/user_profile.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// 用户模型类
/// 表示系统用户信息
@freezed
sealed class UserModel with _$UserModel {
  const factory UserModel({
    /// 用户ID
    required String id,

    /// 用户名（手机号或邮箱）
    @Default('') String username,

    /// 用户注册时间
    @JsonKey(name: 'registered_at') @Default('') String registeredAt,

    /// 手机号
    @Default('') String? phone,

    /// 邮箱
    @Default('') String? email,

    /// 用户昵称
    @Default('') String nickname,

    /// 用户头像URL
    @Default('') String? avatar,

    /// 用户性别：male、female、unknown
    @Default('unknown') String gender,

    /// 用户生日
    @Default('') String? birthday,

    /// 用户最后登录时间
    @JsonKey(name: 'last_login_at') @Default('') String? lastLoginAt,

    /// 用户积分
    @Default(0) int points,

    /// 用户会员等级
    @Default('normal') String memberLevel,

    /// 用户是否已实名认证
    @Default(false) bool isVerified,

    /// 保存的设备ID列表（常用设备）
    @Default([]) List<String> favoriteDevices,
  }) = _UserModel;
  const UserModel._();

  /// 从JSON映射创建UserModel实例
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// 从 UserProfile 模型创建 UserModel 实例
  factory UserModel.fromProfile(UserProfile profile) {
    return UserModel(
      id: profile.id.toString(),
      username: profile.email ?? profile.nickname,
      phone: profile.telephone,
      email: profile.email,
      nickname: profile.nickname,
      avatar: profile.avatar,
      gender: profile.gender,
      points: double.tryParse(profile.integral)?.toInt() ?? 0,
      memberLevel: profile.role,
    );
  }

  /// 检查是否为常用设备
  bool isFavoriteDevice(String deviceId) {
    return favoriteDevices.contains(deviceId);
  }

  /// 获取用户年龄
  int? get age {
    if (birthday == null || birthday!.isEmpty) {
      return null;
    }
    try {
      final birthDate = DateTime.parse(birthday!);
      final now = DateTime.now();
      int age = now.year - birthDate.year;
      if (now.month < birthDate.month ||
          (now.month == birthDate.month && now.day < birthDate.day)) {
        age--;
      }
      return age;
    } catch (_) {
      return null;
    }
  }
}
