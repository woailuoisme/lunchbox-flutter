import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lunchbox/i18n/translations.g.dart';

class OrderView extends ConsumerWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(t.order.myOrders), centerTitle: true),
      body: Center(
        child: Text(t.common.developing, style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
