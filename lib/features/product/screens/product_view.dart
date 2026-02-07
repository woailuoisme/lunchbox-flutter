import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lunchbox/i18n/translations.g.dart';

class ProductView extends ConsumerWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(t.product.detail), centerTitle: true),
      body: Center(
        child: Text(t.common.developing, style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
