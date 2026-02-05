import 'package:freezed_annotation/freezed_annotation.dart';
import '../../order/entities/order_model.dart';

part 'payment_state.freezed.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState({
    OrderModel? order,
    @Default('') String paymentQrCode,
    @Default(false) bool isLoading,
    @Default(false) bool isPolling,
    @Default(300) int countdown,
  }) = _PaymentState;
}
