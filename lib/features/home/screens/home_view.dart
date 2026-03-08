import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/home/providers/home_provider.dart';
import 'package:lunchbox/features/home/widgets/home_function_grid.dart';
import 'package:lunchbox/features/home/widgets/home_header_carousel.dart';
import 'package:lunchbox/features/home/widgets/home_recommend_section.dart';
import 'package:lunchbox/features/home/widgets/home_welcome_section.dart';

/// 首页视图
///
/// 按照设计图重构，包含轮播图、欢迎区、点餐入口、功能矩阵和推荐列表
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      body: RefreshIndicator(
        onRefresh: () => ref.read(homeProvider.notifier).refresh(),
        child: CustomScrollView(
          slivers: [
            // 顶部状态栏占位和轮播图
            const SliverToBoxAdapter(child: HomeHeaderCarousel()),

            // 欢迎区和点餐入口
            const SliverToBoxAdapter(child: HomeWelcomeSection()),

            // 功能矩阵
            const SliverToBoxAdapter(child: HomeFunctionGrid()),

            // 推荐列表 (包含标题和轮播)
            const SliverToBoxAdapter(child: HomeRecommendSection()),

            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
          ],
        ),
      ),
    );
  }
}
