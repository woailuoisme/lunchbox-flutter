import 'package:flutter/material.dart';

/// 优惠券列表页面 TabBar 组件
class CouponTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CouponTabBar({super.key, required this.controller, required this.tabs});
  final TabController controller;
  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TabBar(
      controller: controller,
      indicatorColor: theme.colorScheme.primary,
      labelColor: theme.colorScheme.primary,
      unselectedLabelColor: theme.textTheme.bodyMedium?.color?.withValues(
        alpha: 0.54,
      ),
      tabs: tabs.map((text) => Tab(text: text)).toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
