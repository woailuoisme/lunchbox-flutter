import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/core/widgets/widgets.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/routes.dart';

/// 首页视图
///
/// 按照设计图重构，包含轮播图、欢迎区、点餐入口、功能矩阵和推荐列表
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int _currentHeaderIndex = 0;
  final CarouselSliderController _headerController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      body: CustomScrollView(
        slivers: [
          // 顶部状态栏占位和轮播图
          SliverToBoxAdapter(child: _buildHeader(colorScheme)),

          // 欢迎区和点餐入口
          SliverToBoxAdapter(child: _buildWelcomeAndActions(colorScheme)),

          // 功能矩阵
          SliverToBoxAdapter(child: _buildFunctionGrid(colorScheme)),

          // 为我推荐标题
          SliverToBoxAdapter(child: _buildRecommendHeader(colorScheme)),

          // 推荐列表 (使用 CarouselSlider 实现横向轮播)
          SliverToBoxAdapter(child: _buildRecommendCarousel(colorScheme)),

          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        ],
      ),
    );
  }

  /// 构建头部轮播图
  ///
  /// 使用 carousel_slider 实现自动播放的横幅展示，包含自定义指示器和文字阴影效果
  Widget _buildHeader(ColorScheme colorScheme) {
    final List<Map<String, String>> headerItems = [
      {
        'image': 'https://picsum.photos/seed/header1/800/400',
        'title': '持久 锁鲜 保鲜',
        'subtitle': '10年无人餐饮技术',
      },
      {
        'image': 'https://picsum.photos/seed/header2/800/400',
        'title': '新鲜美味 准时送达',
        'subtitle': '智能取餐柜 快捷高效',
      },
      {
        'image': 'https://picsum.photos/seed/header3/800/400',
        'title': '团队订餐 更多优惠',
        'subtitle': '多人拼单 更划算',
      },
    ];

    return Stack(
      children: [
        CarouselSlider(
          carouselController: _headerController,
          options: CarouselOptions(
            height: 260.h,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            onPageChanged: (index, reason) {
              setState(() {
                _currentHeaderIndex = index;
              });
            },
          ),
          items: headerItems.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: AppImage(
                          imageUrl: item['image']!,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      // 渐变蒙层，提升文字可读性
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withValues(alpha: 0.5),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // 运营文字叠加
                      Positioned(
                        left: 24.w,
                        bottom: 60.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                  item['title']!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                                )
                                .animate()
                                .fadeIn(duration: 600.ms, delay: 200.ms)
                                .slideX(
                                  begin: -0.1,
                                  end: 0,
                                  duration: 600.ms,
                                  curve: Curves.easeOutQuad,
                                ),
                            SizedBox(height: 4.h),
                            Text(
                                  item['subtitle']!,
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.9),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                                .animate()
                                .fadeIn(duration: 600.ms, delay: 400.ms)
                                .slideX(
                                  begin: -0.1,
                                  end: 0,
                                  duration: 600.ms,
                                  curve: Curves.easeOutQuad,
                                ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        // 自定义指示器
        Positioned(
          bottom: 25.h,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: headerItems.asMap().entries.map((entry) {
              final isSelected = _currentHeaderIndex == entry.key;
              return GestureDetector(
                onTap: () => _headerController.animateToPage(entry.key),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: isSelected ? 20.w : 8.w,
                  height: 8.h,
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: Colors.white.withValues(
                      alpha: isSelected ? 1.0 : 0.5,
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  /// 构建欢迎区和点餐入口
  Widget _buildWelcomeAndActions(ColorScheme colorScheme) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.home.welcome,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(
                Symbols.location_on,
                size: 14.sp,
                color: colorScheme.primary,
              ),
              SizedBox(width: 4.w),
              Text(
                t.home.deviceDistance(name: '20号机', distance: '8.9km'),
                style: TextStyle(
                  fontSize: 12.sp,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  const DeviceRoute().go(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: colorScheme.primary.withValues(alpha: 0.1),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Symbols.store,
                        size: 14.sp,
                        color: colorScheme.primary,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        t.home.moreDevices,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Icon(
                        Symbols.chevron_right,
                        size: 14.sp,
                        color: colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: _buildActionButton(
                  title: t.home.selfPickup,
                  subtitle: t.home.selfPickupHint,
                  icon: Symbols.storefront,
                  color: colorScheme.primary,
                  onTap: () {
                    const DeviceRoute().go(context);
                  },
                  iconColor: colorScheme.onPrimary,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildActionButton(
                  title: t.home.teamOrder,
                  subtitle: t.home.teamOrderHint,
                  icon: Symbols.moped,
                  color: colorScheme.primary,
                  onTap: () {
                    const TeamOrderingRoute().push<void>(context);
                  },
                  iconColor: colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 构建点餐按钮
  ///
  /// 为自取和团队点餐提供大尺寸入口，采用圆角卡片样式
  Widget _buildActionButton({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    VoidCallback? onTap,
    Color? iconColor,
  }) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fade,
      openBuilder: (context, _) {
        // 由于 onTap 中调用了路由跳转，这里我们需要模拟一下目标页面
        // 但实际上 OpenContainer 通常直接包裹目标页面的 Widget
        // 这里为了保持原有逻辑，我们只用 OpenContainer 做一个过渡效果的容器
        // 实际点击时会立即调用 onTap 进行路由跳转
        // 为了更好的体验，最好是将 onTap 中的路由逻辑改为返回目标 Widget
        return const SizedBox();
      },
      closedElevation: 0,
      closedColor: Colors.transparent,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      tappable: false, // 我们自己处理点击
      closedBuilder: (context, openContainer) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(icon, color: iconColor ?? Colors.white, size: 24.sp),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 10.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).animate().scale(
      duration: 400.ms,
      curve: Curves.easeOutBack,
      begin: const Offset(0.9, 0.9),
    );
  }

  /// 构建功能矩阵
  ///
  /// 展示福利、客服、领券等五个核心功能入口
  Widget _buildFunctionGrid(ColorScheme colorScheme) {
    final items = [
      {
        'icon': Symbols.card_giftcard,
        'label': t.home.grid.welfare,
        'color': colorScheme.primary,
      },
      {
        'icon': Symbols.headset_mic,
        'label': t.home.grid.service,
        'color': colorScheme.primary,
      },
      {
        'icon': Symbols.confirmation_number,
        'label': t.home.grid.coupon,
        'color': colorScheme.primary,
      },
      {
        'icon': Symbols.stars,
        'label': t.home.grid.lottery,
        'color': colorScheme.primary,
      },
      {
        'icon': Symbols.person_add,
        'label': t.home.grid.invite,
        'color': colorScheme.primary,
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child:
          Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: items.map((item) {
                  return GestureDetector(
                    onTap: () {
                      if (item['label'] == t.home.grid.lottery) {
                        const LotteryRoute().push<void>(context);
                      } else if (item['label'] == t.home.grid.welfare) {
                        const CommunityRoute().push<void>(context);
                      } else if (item['label'] == t.home.grid.coupon) {
                        const CouponsRoute().push<void>(context);
                      } else if (item['label'] == t.home.grid.invite) {
                        const InviteRoute().push<void>(context);
                      }
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 48.w,
                          height: 48.w,
                          decoration: BoxDecoration(
                            color: (item['color']! as Color).withValues(
                              alpha: 0.1,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            item['icon']! as IconData,
                            color: item['color']! as Color,
                            size: 26.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          item['label']! as String,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              )
              .animate()
              .fadeIn(duration: 600.ms, delay: 200.ms)
              .slideY(begin: 0.1, end: 0, curve: Curves.easeOutQuad),
    );
  }

  /// 构建推荐标题
  ///
  /// 居中展示“为我推荐”文字及红色装饰线
  Widget _buildRecommendHeader(ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            t.home.recommendTitle,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 4.h),
          Container(width: 20.w, height: 2.h, color: colorScheme.primary),
        ],
      ),
    );
  }

  /// 构建推荐轮播
  ///
  /// 使用 carousel_slider 实现商品推荐的横向滑动效果，突出显示当前项
  Widget _buildRecommendCarousel(ColorScheme colorScheme) {
    final products = [
      {'name': '客家酸甜咕噜肉饭', 'price': '14.99', 'originalPrice': '21.4'},
      {'name': '古法爆汁红烧肉饭', 'price': '15.59', 'originalPrice': '22.23'},
      {'name': '经典台式卤肉饭', 'price': '13.99', 'originalPrice': '19.9'},
      {'name': '香菇滑鸡饭', 'price': '14.59', 'originalPrice': '20.8'},
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 240.h,
        viewportFraction: 0.75,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        autoPlayCurve: Curves.easeInOutCubic,
      ),
      items: products.asMap().entries.map((entry) {
        return _buildRecommendCard(entry.key, entry.value, colorScheme);
      }).toList(),
    );
  }

  /// 构建推荐卡片
  ///
  /// 展示商品图片、名称、价格及抢购按钮
  Widget _buildRecommendCard(
    int index,
    Map<String, String> product,
    ColorScheme colorScheme,
  ) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fade,
      openBuilder: (context, _) {
        // 模拟商品详情页跳转
        return Scaffold(
          appBar: AppBar(title: Text(product['name']!)),
          body: Center(child: Text('商品详情: ${product['name']}')),
        );
      },
      closedElevation: 0,
      closedColor: Colors.transparent,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      tappable: true,
      closedBuilder: (context, openContainer) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 15,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: AppImage(
                          imageUrl:
                              'https://picsum.photos/seed/${index + 10}/400/300',
                        ),
                      ),
                      Positioned(
                        top: 10.h,
                        left: 10.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.error.withValues(alpha: 0.85),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            '今日推荐',
                            style: TextStyle(
                              color: colorScheme.onError,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product['name']!,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      '¥',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 2.w),
                                    Text(
                                      product['price']!,
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        color: colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '¥${product['originalPrice']}',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: colorScheme.onSurfaceVariant,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                                vertical: 8.h,
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    colorScheme.primary,
                                    const Color(0xFFFFB74D),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(25.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: colorScheme.primary.withValues(
                                      alpha: 0.3,
                                    ),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Text(
                                '马上抢',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
