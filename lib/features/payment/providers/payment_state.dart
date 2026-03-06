import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/features/payment/entities/payment_intent_response.dart';

part 'payment_state.freezed.dart';

@freezed
/// 支付状态
abstract class PaymentState with _$PaymentState {
  const factory PaymentState({
    PaymentIntentResponse? paymentIntent,
    @Default(false) bool isLoading,
    @Default(false) bool isPaymentSheetReady,
    @Default(false) bool isPaymentSuccessful,
    @Default(false) bool isPaymentCanceled,
    String? errorMessage,
  }) = _PaymentState;
}
