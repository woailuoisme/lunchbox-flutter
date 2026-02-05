import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductView extends ConsumerWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('商品详情'), centerTitle: true),
      body: const Center(
        child: Text('商品详情页面正在开发中', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
