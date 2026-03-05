import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

/// 用户个人资料模型
@freezed
sealed class UserProfile with _$UserProfile {
  const factory UserProfile({
    /// 用户ID
    required int id,

    /// 微信 OpenID
    String? openid,

    /// 昵称
    required String nickname,

    /// 头像
    String? avatar,

    /// 优惠券数量
    @JsonKey(name: 'user_coupon_count') required int userCouponCount,

    /// 余额
    required String balance,

    /// 积分
    required String integral,

    /// 抽奖次数
    @JsonKey(name: 'lottery_count') required int lotteryCount,

    /// 邮箱
    String? email,

    /// 真实姓名
    @JsonKey(name: 'real_name') String? realName,

    /// 手机号
    String? telephone,

    /// 生日
    String? birthday,

    /// 性别
    required String gender,

    /// 语言
    required String language,

    /// 国家
    String? country,

    /// 省份
    String? province,

    /// 城市
    String? city,

    /// 角色
    required String role,
  }) = _UserProfile;

  /// 从JSON映射创建 UserProfile 实例
  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
