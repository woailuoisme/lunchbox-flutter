import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HelpView extends ConsumerWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('帮助中心'), centerTitle: true),
      body: const Center(
        child: Text('帮助页面正在开发中', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
