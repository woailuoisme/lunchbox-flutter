import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_request.freezed.dart';
part 'payment_request.g.dart';

enum PaymentPayType {
  @JsonValue('balance')
  balance,
  @JsonValue('wechat')
  wechat,
  @JsonValue('stripe')
  stripe,
  @JsonValue('alipay')
  alipay,
  @JsonValue('paypal')
  paypal,
}

@freezed
sealed class PaymentRequest with _$PaymentRequest {
  const factory PaymentRequest({
    /// 支付金额
    required double amount,

    /// 支付方式 (balance:余额支付, wechat:微信支付)
    @JsonKey(name: 'pay_type') required PaymentPayType payType,

    /// 产品列表
    @JsonKey(name: 'product_list')
    required List<PaymentProductItem> productList,

    /// 用户优惠券ID
    @JsonKey(name: 'user_coupon_id') int? userCouponId,

    /// 订单描述
    String? description,
  }) = _PaymentRequest;

  factory PaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequestFromJson(json);
}

@freezed
sealed class PaymentProductItem with _$PaymentProductItem {
  const factory PaymentProductItem({
    /// 设备ID
    @JsonKey(name: 'device_id') required int deviceId,

    /// 产品ID
    @JsonKey(name: 'product_id') required int productId,

    /// 数量
    required int quantity,
  }) = _PaymentProductItem;

  factory PaymentProductItem.fromJson(Map<String, dynamic> json) =>
      _$PaymentProductItemFromJson(json);
}
