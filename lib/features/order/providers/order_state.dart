import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';

part 'order_state.freezed.dart';

@freezed
abstract class OrderState with _$OrderState {
  const factory OrderState({
    @Default([]) List<OrderModel> orders,
    OrderModel? selectedOrder,
    @Default(false) bool isLoading,
    @Default('all')
    String selectedStatus, // all, pending, paid, completed, cancelled
    @Default('stripe') String selectedPaymentMethod, // stripe
    @Default(0.0) double orderTotal,
  }) = _OrderState;
}
