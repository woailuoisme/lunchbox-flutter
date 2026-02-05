import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// 用户模型类
/// 表示系统用户信息
@freezed
abstract class UserModel with _$UserModel {
  
  const factory UserModel({
    /// 用户ID
    required String id,
    
    /// 用户名（手机号或邮箱）
    required String username,
    
    /// 用户注册时间
    required DateTime registeredAt, /// 手机号
    String? phone,
    
    /// 邮箱
    String? email,
    
    /// 用户昵称
    @Default('') String nickname,
    
    /// 用户头像URL
    String? avatar,
    
    /// 用户性别：male、female、unknown
    @Default('unknown') String gender,
    
    /// 用户生日
    DateTime? birthday,
    
    /// 用户最后登录时间
    DateTime? lastLoginAt,
    
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
  
  /// 检查是否为常用设备
  bool isFavoriteDevice(String deviceId) {
    return favoriteDevices.contains(deviceId);
  }
  
  /// 获取用户年龄
  int? get age {
    if (birthday == null) return null;
    final now = DateTime.now();
    int age = now.year - birthday!.year;
    if (now.month < birthday!.month || 
        (now.month == birthday!.month && now.day < birthday!.day)) {
      age--;
    }
    return age;
  }
}
