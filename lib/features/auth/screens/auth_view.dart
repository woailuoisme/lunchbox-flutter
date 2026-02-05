import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthView extends ConsumerWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('登录'), centerTitle: true),
      body: const Center(
        child: Text('登录页面正在开发中', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
