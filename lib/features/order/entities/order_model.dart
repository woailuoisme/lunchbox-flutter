import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/i18n/translations.g.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

/// 订单状态枚举
@JsonEnum(alwaysCreate: true)
enum OrderStatus {
  @JsonValue('pending')
  pending, // 待支付
  @JsonValue('paid')
  paid, // 已支付
  @JsonValue('used')
  used, // 已使用
  @JsonValue('cancelled')
  cancelled, // 已取消
  @JsonValue('refund')
  refund, // 退款中
  @JsonValue('completed')
  completed, // 已完成
  @JsonValue('failed')
  failed, // 支付失败
}

/// 支付状态枚举
@JsonEnum(alwaysCreate: true)
enum PayStatus {
  @JsonValue('unpaid')
  unpaid, // 未支付
  @JsonValue('paid')
  paid, // 已支付
  @JsonValue('refunded')
  refunded, // 已退款
}

/// 支付方式枚举
@JsonEnum(alwaysCreate: true)
enum PaymentMethod {
  @JsonValue('wechat')
  wechat, // 微信支付
  @JsonValue('alipay')
  alipay, // 支付宝
  @JsonValue('balance')
  balance, // 余额支付
  @JsonValue('cash')
  cash, // 现金支付
  @JsonValue('stripe')
  stripe, // Stripe支付
}

/// 订单中的用户信息
@freezed
abstract class OrderUserModel with _$OrderUserModel {
  const factory OrderUserModel({
    required int id,
    required String nickname,
    required String telephone,
  }) = _OrderUserModel;

  factory OrderUserModel.fromJson(Map<String, dynamic> json) =>
      _$OrderUserModelFromJson(json);
}

/// 订单中的设备信息
@freezed
abstract class OrderDeviceModel with _$OrderDeviceModel {
  const factory OrderDeviceModel({required int id, required String sn}) =
      _OrderDeviceModel;

  factory OrderDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDeviceModelFromJson(json);
}

/// 订单中的商品信息
@freezed
abstract class OrderProductModel with _$OrderProductModel {
  const factory OrderProductModel({
    required int id,
    required String name,
    required String category,
    required String thumb,
    required String description,
    @JsonKey(name: 'sale_price') required String salePrice,
    required int quantity,
  }) = _OrderProductModel;

  factory OrderProductModel.fromJson(Map<String, dynamic> json) =>
      _$OrderProductModelFromJson(json);
}

/// 订单模型类
/// 表示用户购买商品后的订单信息
@freezed
abstract class OrderModel with _$OrderModel {
  const factory OrderModel({
    /// 订单ID
    required int id,

    /// 用户信息
    required OrderUserModel user,

    /// 订单流水号
    required String sn,

    /// 设备信息
    OrderDeviceModel? device,

    /// 订单金额状态 (String)
    @JsonKey(name: 'order_status') required String orderStatusAmount,

    /// 标称金额
    @JsonKey(name: 'nominal_amount') required String nominalAmount,

    /// 支付金额
    @JsonKey(name: 'pay_amount') required String payAmount,

    /// 优惠金额
    @JsonKey(name: 'coupon_amount') required String couponAmount,

    /// 支付流水号
    @JsonKey(name: 'pay_sn') String? paySn,

    /// 外部支付流水号
    @JsonKey(name: 'pay_external_sn') String? payExternalSn,

    /// 支付方式
    @JsonKey(name: 'pay_type') PaymentMethod? payType,

    /// 支付状态
    @JsonKey(name: 'pay_status') PayStatus? payStatus,

    /// 用户评论数
    @JsonKey(name: 'user_comments_count') required int userCommentsCount,

    /// 用户是否已评价
    @JsonKey(name: 'user_has_comments') required bool userHasComments,

    /// 订单状态
    required OrderStatus status,

    /// 取餐二维码图片 (Base64 or URL)
    @JsonKey(name: 'qr_code_image') String? qrCodeImage,

    /// 订单创建时间
    @JsonKey(name: 'created_at') required String createdAt,

    /// 订单包含的商品列表
    required List<OrderProductModel> products,
  }) = _OrderModel;

  const OrderModel._();

  /// 从JSON映射创建OrderModel实例
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  /// 获取订单商品总数
  int get totalItemsCount {
    return products.fold(0, (sum, product) => sum + product.quantity);
  }

  /// 判断订单是否可以取消
  bool get canCancel {
    return status == OrderStatus.pending;
  }

  /// 获取订单总金额 (double)
  double get totalAmount => double.tryParse(payAmount) ?? 0.0;

  /// 获取订单创建时间 (DateTime)
  DateTime get createdAtDateTime =>
      DateTime.tryParse(createdAt) ?? DateTime.now();

  /// 获取支付方式的中文描述
  String? get payTypeText {
    if (payType == null) {
      return null;
    }
    switch (payType!) {
      case PaymentMethod.wechat:
        return '微信支付';
      case PaymentMethod.alipay:
        return '支付宝';
      case PaymentMethod.balance:
        return '余额支付';
      case PaymentMethod.cash:
        return '现金支付';
      case PaymentMethod.stripe:
        return 'Stripe支付';
    }
  }
}

extension OrderStatusX on OrderStatus {
  String get label {
    switch (this) {
      case OrderStatus.pending:
        return t.order.status.pending;
      case OrderStatus.paid:
        return t.order.status.paid;
      case OrderStatus.used:
        return '已使用'; // TODO: add to translation
      case OrderStatus.cancelled:
        return t.order.status.cancelled;
      case OrderStatus.refund:
        return '退款中'; // TODO: add to translation
      case OrderStatus.completed:
        return t.order.status.completed;
      case OrderStatus.failed:
        return t.order.status.failed;
    }
  }

  Color get color {
    switch (this) {
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.paid:
        return Colors.green;
      case OrderStatus.used:
        return Colors.blue;
      case OrderStatus.cancelled:
        return Colors.grey;
      case OrderStatus.refund:
        return Colors.purple;
      case OrderStatus.completed:
        return Colors.blue;
      case OrderStatus.failed:
        return Colors.red;
    }
  }

  IconData get icon {
    switch (this) {
      case OrderStatus.pending:
        return Icons.access_time_filled;
      case OrderStatus.paid:
        return Icons.check_circle;
      case OrderStatus.used:
        return Icons.task_alt;
      case OrderStatus.cancelled:
        return Icons.cancel;
      case OrderStatus.refund:
        return Icons.remove_circle;
      case OrderStatus.completed:
        return Icons.task_alt;
      case OrderStatus.failed:
        return Icons.error;
    }
  }
}
