import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/features/cart/cart.dart';
import 'package:lunchbox/features/device/device.dart';
import 'package:lunchbox/i18n/translations.g.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

/// 订单状态枚举
enum OrderStatus {
  pending, // 待支付
  paid, // 已支付
  completed, // 已完成（商品已取出）
  cancelled, // 已取消
  refunded, // 已退款
  failed, // 支付失败
}

/// 支付方式枚举
enum PaymentMethod {
  wechatPay, // 微信支付
  alipay, // 支付宝
  cash, // 现金支付
  stripe, // Stripe支付
}

/// 订单模型类
/// 表示用户购买商品后的订单信息
@freezed
abstract class OrderModel with _$OrderModel {
  const factory OrderModel({
    /// 订单ID
    required String id,

    /// 用户ID
    required String userId,

    /// 设备ID
    required String deviceId,

    /// 订单包含的商品列表
    required List<CartItemModel> items,

    /// 订单总金额
    required double totalAmount,

    /// 订单创建时间
    required DateTime createdAt,

    /// 设备信息
    DeviceModel? device,

    /// 支付金额（可能包含优惠）
    @Default(0.0) double paidAmount,

    /// 订单状态
    @Default(OrderStatus.pending) OrderStatus status,

    /// 支付方式
    PaymentMethod? paymentMethod,

    /// 支付时间
    DateTime? paidAt,

    /// 订单完成时间
    DateTime? completedAt,

    /// 订单取消时间
    DateTime? cancelledAt,

    /// 取货码（用于从设备取货）
    String? pickupCode,

    /// 取餐提示（如：请前往1号窗口取餐）
    String? pickupHint,

    /// 堂食码
    String? diningCode,

    /// 门店名称
    String? storeName,

    /// 门店地址
    String? storeAddress,

    /// 门店电话
    String? storePhone,

    /// 二维码数据
    String? qrCodeData,

    /// 订单备注
    String? remark,
  }) = _OrderModel;
  const OrderModel._();

  /// 从JSON映射创建OrderModel实例
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  /// 获取订单商品总数
  int get totalItemsCount {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }

  /// 判断订单是否可以取消
  bool get canCancel {
    return status == OrderStatus.pending || status == OrderStatus.paid;
  }

  /// 获取订单状态的中文描述
  String get statusText {
    switch (status) {
      case OrderStatus.pending:
        return '待支付';
      case OrderStatus.paid:
        return '已支付';
      case OrderStatus.completed:
        return '已完成';
      case OrderStatus.cancelled:
        return '已取消';
      case OrderStatus.refunded:
        return '已退款';
      case OrderStatus.failed:
        return '支付失败';
    }
  }

  /// 获取支付方式的中文描述
  String? get paymentMethodText {
    if (paymentMethod == null) {
      return null;
    }
    switch (paymentMethod!) {
      case PaymentMethod.wechatPay:
        return '微信支付';
      case PaymentMethod.alipay:
        return '支付宝';
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
      case OrderStatus.completed:
        return t.order.status.completed;
      case OrderStatus.cancelled:
        return t.order.status.cancelled;
      case OrderStatus.refunded:
        return t.order.status.refunded;
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
      case OrderStatus.completed:
        return Colors.blue;
      case OrderStatus.cancelled:
        return Colors.grey;
      case OrderStatus.refunded:
        return Colors.purple;
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
      case OrderStatus.completed:
        return Icons.task_alt;
      case OrderStatus.cancelled:
        return Icons.cancel;
      case OrderStatus.refunded:
        return Icons.remove_circle;
      case OrderStatus.failed:
        return Icons.error;
    }
  }
}
