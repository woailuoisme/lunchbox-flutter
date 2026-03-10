import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/features/points/entities/mall_product_response.dart';

part 'points_state.freezed.dart';

/// 积分商城页面状态
@freezed
sealed class PointsMallState with _$PointsMallState {
  const factory PointsMallState({
    /// 余额类商品列表
    @Default([]) List<MallProductResponse> balanceProducts,

    /// 优惠券类商品列表
    @Default([]) List<MallProductResponse> couponProducts,

    /// 当前用户积分余额
    @Default(0) int balance,

    /// 是否正在兑换
    @Default(false) bool isRedeeming,

    /// 正在兑换的商品 ID
    int? redeemingId,

    /// 错误消息
    String? errorMessage,

    /// 成功消息
    String? successMessage,
  }) = _PointsMallState;
}
