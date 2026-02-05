import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('设置'), centerTitle: true),
      body: const Center(
        child: Text('设置页面正在开发中', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
