import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_request_model.freezed.dart';
part 'payment_request_model.g.dart';

@freezed
abstract class PaymentRequestModel with _$PaymentRequestModel {
  const factory PaymentRequestModel({
    /// 支付金额
    required double amount,

    /// 支付方式 (wechat, alipay, etc.)
    @JsonKey(name: 'payment_method') required String paymentMethod,

    /// 商品列表 (包含 product_id, quantity)
    required List<Map<String, dynamic>> items,

    /// 设备ID
    @JsonKey(name: 'device_id') String? deviceId,

    /// 优惠券ID
    @JsonKey(name: 'coupon_id') String? couponId,

    /// 备注
    String? remark,
  }) = _PaymentRequestModel;

  factory PaymentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequestModelFromJson(json);
}
