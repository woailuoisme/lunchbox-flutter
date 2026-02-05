import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderView extends ConsumerWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('我的订单'), centerTitle: true),
      body: const Center(
        child: Text('订单页面正在开发中', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
