import 'package:flutter/material.dart';

/// 通用空状态展示组件
class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.inbox_outlined, size: 48, color: Colors.grey),
          const SizedBox(height: 16),
          Text(message ?? '暂无数据', style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
