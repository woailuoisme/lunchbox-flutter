import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 用户中心视图（Riverpod 版本）
///
/// 临时实现，用于路由配置
// TODO(User): 完整实现用户中心功能
class ProfileViewRiverpod extends ConsumerWidget {
  const ProfileViewRiverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('我的')),
      body: const Center(child: Text('用户中心 - 待实现')),
    );
  }
}
