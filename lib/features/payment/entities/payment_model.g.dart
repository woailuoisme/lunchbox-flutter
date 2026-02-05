// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_PaymentModel',
      json,
      ($checkedConvert) {
        final val = _PaymentModel(
          id: $checkedConvert('id', (v) => v as String),
          orderId: $checkedConvert('order_id', (v) => v as String),
          paymentMethod: $checkedConvert('payment_method', (v) => v as String),
          amount: $checkedConvert('amount', (v) => (v as num).toDouble()),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
          expireAt: $checkedConvert(
            'expire_at',
            (v) => DateTime.parse(v as String),
          ),
          status: $checkedConvert(
            'status',
            (v) =>
                $enumDecodeNullable(_$PaymentStatusEnumMap, v) ??
                PaymentStatus.pending,
          ),
          qrCodeUrl: $checkedConvert('qr_code_url', (v) => v as String?),
          qrCodeData: $checkedConvert('qr_code_data', (v) => v as String?),
          transactionId: $checkedConvert('transaction_id', (v) => v as String?),
          paidAt: $checkedConvert(
            'paid_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          remark: $checkedConvert('remark', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'orderId': 'order_id',
        'paymentMethod': 'payment_method',
        'createdAt': 'created_at',
        'expireAt': 'expire_at',
        'qrCodeUrl': 'qr_code_url',
        'qrCodeData': 'qr_code_data',
        'transactionId': 'transaction_id',
        'paidAt': 'paid_at',
      },
    );

Map<String, dynamic> _$PaymentModelToJson(_PaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'payment_method': instance.paymentMethod,
      'amount': instance.amount,
      'created_at': instance.createdAt.toIso8601String(),
      'expire_at': instance.expireAt.toIso8601String(),
      'status': _$PaymentStatusEnumMap[instance.status]!,
      'qr_code_url': ?instance.qrCodeUrl,
      'qr_code_data': ?instance.qrCodeData,
      'transaction_id': ?instance.transactionId,
      'paid_at': ?instance.paidAt?.toIso8601String(),
      'remark': ?instance.remark,
    };

const _$PaymentStatusEnumMap = {
  PaymentStatus.pending: 'pending',
  PaymentStatus.processing: 'processing',
  PaymentStatus.success: 'success',
  PaymentStatus.failed: 'failed',
  PaymentStatus.cancelled: 'cancelled',
  PaymentStatus.timeout: 'timeout',
};
