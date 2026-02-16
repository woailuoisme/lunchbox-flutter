import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:lunchbox/features/payment/widgets/order_confirmation_view.dart';
import 'package:lunchbox/features/payment/widgets/payment_process_view.dart';

/// 支付视图
/// 合并了订单确认和支付功能
class PaymentView extends ConsumerStatefulWidget {
  const PaymentView({super.key, this.order});

  /// 如果传入 order，则直接进入支付流程
  /// 如果为 null，则显示订单确认页面
  final OrderModel? order;

  @override
  ConsumerState<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends ConsumerState<PaymentView> {
  OrderModel? _currentOrder;

  @override
  void initState() {
    super.initState();
    _currentOrder = widget.order;
  }

  @override
  Widget build(BuildContext context) {
    if (_currentOrder == null) {
      return OrderConfirmationView(
        onOrderCreated: (order) {
          setState(() {
            _currentOrder = order;
          });
        },
      );
    } else {
      return PaymentProcessView(order: _currentOrder!);
    }
  }
}
