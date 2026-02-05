import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

/// 支付状态枚举
enum PaymentStatus {
  pending, // 待支付
  processing, // 处理中
  success, // 支付成功
  failed, // 支付失败
  cancelled, // 已取消
  timeout, // 超时
}

/// 支付模型类
/// 表示支付交易信息
@freezed
abstract class PaymentModel with _$PaymentModel {
  const factory PaymentModel({
    /// 支付ID
    required String id,

    /// 订单ID
    required String orderId,

    /// 支付方式：wechat、alipay
    required String paymentMethod,

    /// 支付金额
    required double amount,

    /// 支付创建时间
    required DateTime createdAt,

    /// 支付过期时间
    required DateTime expireAt,

    /// 支付状态
    @Default(PaymentStatus.pending) PaymentStatus status,

    /// 支付二维码URL
    String? qrCodeUrl,

    /// 支付二维码内容
    String? qrCodeData,

    /// 第三方支付交易号
    String? transactionId,

    /// 支付完成时间
    DateTime? paidAt,

    /// 支付备注
    String? remark,
  }) = _PaymentModel;
  const PaymentModel._();

  /// 从JSON映射创建PaymentModel实例
  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  /// 判断支付是否已过期
  bool get isExpired => DateTime.now().isAfter(expireAt);

  /// 获取剩余时间（秒）
  int get remainingSeconds {
    if (isExpired) {
      return 0;
    }
    return expireAt.difference(DateTime.now()).inSeconds;
  }

  /// 获取支付状态的中文描述
  String get statusText {
    switch (status) {
      case PaymentStatus.pending:
        return '待支付';
      case PaymentStatus.processing:
        return '处理中';
      case PaymentStatus.success:
        return '支付成功';
      case PaymentStatus.failed:
        return '支付失败';
      case PaymentStatus.cancelled:
        return '已取消';
      case PaymentStatus.timeout:
        return '支付超时';
    }
  }

  /// 获取支付方式的中文描述
  String get paymentMethodText {
    switch (paymentMethod) {
      case 'wechat':
        return '微信支付';
      case 'alipay':
        return '支付宝';
      default:
        return '其他支付方式';
    }
  }
}
