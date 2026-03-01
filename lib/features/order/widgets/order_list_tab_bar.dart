import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 订单列表顶部 TabBar 组件
class OrderListTabBar extends StatelessWidget {
  const OrderListTabBar({
    super.key,
    required this.controller,
    required this.titles,
    this.onTap,
  });
  final TabController controller;
  final List<String> titles;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.cardColor,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: TabBar(
        controller: controller,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        padding: EdgeInsets.zero,
        labelColor: theme.colorScheme.primary,
        unselectedLabelColor: theme.hintColor,
        indicatorColor: theme.colorScheme.primary,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 0,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 3.h, color: theme.colorScheme.primary),
          insets: EdgeInsets.symmetric(horizontal: 14.w),
          borderRadius: BorderRadius.circular(2.r),
        ),
        labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        ),
        labelPadding: EdgeInsets.symmetric(horizontal: 12.w),
        splashFactory: NoSplash.splashFactory,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        dividerColor: Colors.transparent,
        tabs: titles.map((title) => Tab(text: title)).toList(),
        onTap: onTap,
      ),
    );
  }
}
