import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/features/payment/entities/payment_intent_response.dart';

part 'payment_state.freezed.dart';

enum PaymentMethod { balance, stripe }

@freezed
abstract class PaymentState with _$PaymentState {
  const factory PaymentState({
    PaymentIntentResponse? paymentIntent,
    @Default(false) bool isPaymentSheetReady,
    @Default(false) bool isPaymentSuccessful,
    @Default(false) bool isPaymentCanceled,
    @Default(PaymentMethod.stripe) PaymentMethod selectedMethod,
  }) = _PaymentState;

  const PaymentState._();
}
