import 'dart:async';
import 'dart:math' as math;

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/features/lottery/providers/lottery_notifier.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/app_routes.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:timelines_plus/timelines_plus.dart';

/// 抽奖页面
///
/// 包含转盘动画、规则说明和导航按钮
class LotteryView extends ConsumerStatefulWidget {
  const LotteryView({super.key});

  @override
  ConsumerState<LotteryView> createState() => _LotteryViewState();
}

class _LotteryViewState extends ConsumerState<LotteryView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _currentRotation = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// 开始旋转
  Future<void> _handleSpin() async {
    final notifier = ref.read(lotteryProvider.notifier);

    // 1. 获取中奖结果
    final winIndex = await notifier.spin();
    if (winIndex == null) {
      return;
    }

    // 2. 计算旋转角度
    // 扇区数量
    final items = notifier.wheelItems;
    final sectorAngle = 2 * math.pi / items.length;

    // 目标角度：让中奖扇区对准顶部指针
    // 假设指针在顶部(-pi/2)，扇区0从-pi/2开始绘制(或者0位置修正)
    // 为了简化，我们在Painter里把扇区0放在顶部
    // 如果中奖index是i，那么需要多转 (items.length - i) * sectorAngle
    // 另外加上随机偏移(扇区内部随机)，避免每次都停在正中间
    final randomOffset =
        math.Random().nextDouble() * sectorAngle * 0.8 - (sectorAngle * 0.4);

    // 基础旋转圈数 (5圈)
    const minSpins = 5;
    const spinRotation = minSpins * 2 * math.pi;

    // 计算目标位置
    // 我们希望结束时：(current + total) % 2pi 对应 winIndex
    // 实际上更简单的逻辑是：
    // 目标角度 = 当前角度 + 基础圈数 + (目标扇区相对当前位置的偏移)

    // 重新计算：
    // 假设绘制时，index 0 在顶部。
    // 要让 index i 到达顶部，需要逆时针旋转 i * sectorAngle，或者顺时针旋转 (count - i) * sectorAngle
    final targetAngleFromTop = (items.length - winIndex) * sectorAngle;

    // 当前角度归一化
    final normalizedCurrent = _currentRotation % (2 * math.pi);

    // 需要旋转的额外角度
    var extraRotation = targetAngleFromTop - normalizedCurrent;
    if (extraRotation < 0) {
      extraRotation += 2 * math.pi;
    }

    final totalRotation = spinRotation + extraRotation + randomOffset;

    final startRotation = _currentRotation;
    final endRotation = startRotation + totalRotation;

    // 3. 执行动画
    final animation = Tween<double>(
      begin: startRotation,
      end: endRotation,
    ).animate(_controller);

    animation.addListener(() {
      setState(() {
        _currentRotation = animation.value;
      });
    });

    await _controller.forward(from: 0);

    // 4. 动画结束，显示结果
    _currentRotation = endRotation; // 修正最终位置
    final prize = notifier.createPrize(winIndex);
    notifier.completeSpin(prize);

    if (mounted) {
      _showResultDialog(prize.name);
    }
  }

  void _showResultDialog(String prizeName) {
    final colorScheme = Theme.of(context).colorScheme;
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Symbols.celebration,
                size: 80.w,
                color: Colors.amber,
                fill: 1.0,
              ),
              SizedBox(height: 16.h),
              Text(
                t.home.lottery.congratulations,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),
              Text(
                prizeName,
                style: TextStyle(
                  fontSize: 24.sp,
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: Text(t.home.lottery.accept),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lotteryState = ref.watch(lotteryProvider);
    final lotteryNotifier = ref.read(lotteryProvider.notifier);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      appBar: AppBar(
        title: Text(t.home.grid.lottery),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(lotteryState.remainingSpins, colorScheme)
                .animate()
                .fadeIn(duration: 600.ms, curve: Curves.easeOut)
                .slideY(begin: -0.2, end: 0, duration: 600.ms),
            SizedBox(height: 20.h),
            _buildWheelSection(
              lotteryState.isSpinning,
              lotteryNotifier.wheelItems,
              colorScheme,
            ).animate().scale(
              duration: 800.ms,
              curve: Curves.elasticOut,
              begin: const Offset(0.8, 0.8),
            ),
            SizedBox(height: 30.h),
            _buildPrizeInfo(lotteryNotifier.wheelItems, colorScheme)
                .animate(delay: 200.ms)
                .fadeIn(duration: 600.ms)
                .slideY(begin: 0.1, end: 0),
            SizedBox(height: 20.h),
            _buildRules(colorScheme)
                .animate(delay: 400.ms)
                .fadeIn(duration: 600.ms)
                .slideY(begin: 0.1, end: 0),
            SizedBox(height: 30.h),
            _buildBottomButtons(colorScheme)
                .animate(delay: 600.ms)
                .fadeIn(duration: 600.ms)
                .slideY(begin: 0.2, end: 0),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  /// 顶部标题卡片
  Widget _buildHeader(int remainingSpins, ColorScheme colorScheme) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Symbols.card_giftcard,
            size: 48.w,
            color: colorScheme.primary,
            fill: 1.0,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.home.grid.lottery,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  t.home.lottery.subtitle,
                  style: TextStyle(fontSize: 12.sp, color: colorScheme.outline),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Flexible(
            flex: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                t.home.lottery.remaining(count: remainingSpins),
                style: TextStyle(
                  color: colorScheme.onPrimary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 转盘区域
  Widget _buildWheelSection(
    bool isSpinning,
    List<String> items,
    ColorScheme colorScheme,
  ) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 外圈装饰
          Container(
            width: 320.w,
            height: 320.w,
            decoration: BoxDecoration(
              color: const Color(0xFFFFE0B2),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
          ),
          // 旋转的转盘
          Transform.rotate(
            angle: _currentRotation,
            child: SizedBox(
              width: 300.w,
              height: 300.w,
              child: CustomPaint(
                painter: WheelPainter(
                  items: items,
                  colors: const [
                    Color(0xFFFF8A80), // Red
                    Color(0xFFFFFFFF), // White
                    Color(0xFFFFD180), // Orange
                    Color(0xFFFFFFFF), // White
                    Color(0xFF80D8FF), // Blue
                    Color(0xFFFFFFFF), // White
                  ],
                ),
              ),
            ),
          ),
          // 顶部指针
          Positioned(
            top: 0,
            child: Icon(
              Symbols.arrow_drop_down,
              size: 40.w,
              color: const Color(0xFFD32F2F),
              fill: 1.0,
            ),
          ),
          // 中心按钮
          GestureDetector(
            onTap: isSpinning ? null : _handleSpin,
            child: Container(
              width: 80.w,
              height: 80.w,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                isSpinning ? '...' : '抽奖',
                style: TextStyle(
                  color: colorScheme.onPrimary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 奖品说明列表
  Widget _buildPrizeInfo(List<String> prizes, ColorScheme colorScheme) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ExpandableNotifier(
        initialExpanded: true,
        child: ExpandablePanel(
          header: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: Colors.amber.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Symbols.trophy,
                    color: Colors.amber,
                    size: 24.w,
                    fill: 1.0,
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  '奖品一览',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          collapsed: const SizedBox.shrink(),
          expanded: Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Wrap(
              spacing: 12.w,
              runSpacing: 12.h,
              children: prizes.map((prize) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: colorScheme.outline.withValues(alpha: 0.1),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Symbols.star,
                        size: 16.w,
                        color: Colors.orange,
                        fill: 1.0,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        prize,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          theme: ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            tapBodyToCollapse: true,
            hasIcon: true,
            iconColor: colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }

  /// 抽奖规则
  Widget _buildRules(ColorScheme colorScheme) {
    final rules = [
      '每日有免费抽奖次数，次数用完后可领取任务获得',
      '优惠券48小时内有效，乖乖币自动到账',
      '活动最终解释权归平台所有',
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ExpandableNotifier(
        initialExpanded: true,
        child: ExpandablePanel(
          header: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Symbols.description,
                    color: colorScheme.primary,
                    size: 24.w,
                    fill: 1.0,
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  '活动规则',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          collapsed: const SizedBox.shrink(),
          expanded: Padding(
            padding: EdgeInsets.only(bottom: 10.h, left: 10.w),
            child: FixedTimeline.tileBuilder(
              theme: TimelineThemeData(
                nodePosition: 0,
                color: colorScheme.primary,
                indicatorTheme: IndicatorThemeData(position: 0.5, size: 10.w),
                connectorTheme: ConnectorThemeData(
                  thickness: 1.5.w,
                  color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                ),
              ),
              builder: TimelineTileBuilder.connected(
                connectionDirection: ConnectionDirection.after,
                itemCount: rules.length,
                contentsBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      top: 12.h,
                      bottom: 12.h,
                    ),
                    child: Text(
                      rules[index],
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: colorScheme.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                  );
                },
                indicatorBuilder: (context, index) {
                  return DotIndicator(
                    size: 8.w,
                    color: colorScheme.primary.withValues(alpha: 0.8),
                    border: Border.all(
                      color: colorScheme.primary.withValues(alpha: 0.2),
                      width: 2.w,
                    ),
                  );
                },
                connectorBuilder: (context, index, type) => SolidLineConnector(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.3),
                ),
              ),
            ),
          ),
          theme: ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            tapBodyToCollapse: true,
            hasIcon: true,
            iconColor: colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }

  /// 底部按钮
  Widget _buildBottomButtons(ColorScheme colorScheme) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        width: double.infinity,
        child: FilledButton.icon(
          onPressed: () {
            context.push('${AppRoutes.lottery}/${AppRoutes.myPrizes}');
          },
          style: FilledButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            padding: EdgeInsets.symmetric(vertical: 14.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            elevation: 2,
          ),
          icon: const Icon(Symbols.card_giftcard, size: 20),
          label: const Text('我的奖品'),
        ),
      ),
    );
  }
}

/// 转盘绘制器
class WheelPainter extends CustomPainter {
  WheelPainter({required this.items, required this.colors});

  final List<String> items;
  final List<Color> colors;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final sectorAngle = 2 * math.pi / items.length;

    // 绘制扇区
    for (int i = 0; i < items.length; i++) {
      final paint = Paint()
        ..color = colors[i % colors.length]
        ..style = PaintingStyle.fill;

      // Start angle: -pi/2 (top) + i * sectorAngle
      // 这里的逻辑：我们希望 index 0 在顶部。
      // drawArc 0度在右边 (3点钟)。
      // 顶部是 -pi/2.
      // 所以扇区 i 的起始角度是 -pi/2 + i * sectorAngle
      final startAngle =
          -math.pi / 2 + i * sectorAngle - (sectorAngle / 2); // 居中

      // 修正：通常扇区边界在 -pi/2 上，而不是扇区中心在 -pi/2 上。
      // 让我们定义：扇区 0 跨越 [-pi/2 - sector/2, -pi/2 + sector/2] 这样 0 就在正上方
      // 这样对应我们逻辑里的 "0在顶部"

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sectorAngle,
        true,
        paint,
      );

      // 绘制文字
      _drawText(canvas, center, radius, startAngle + sectorAngle / 2, items[i]);
    }
  }

  void _drawText(
    Canvas canvas,
    Offset center,
    double radius,
    double angle,
    String text,
  ) {
    canvas
      ..save()
      ..translate(center.dx, center.dy)
      ..rotate(angle + math.pi / 2); // 旋转使得文字垂直向外

    final textSpan = TextSpan(
      text: text,
      style: TextStyle(
        color: Colors.black87,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    )..layout();

    // 文字绘制在半径的 2/3 处
    final offset = Offset(-textPainter.width / 2, -radius * 0.75);
    textPainter.paint(canvas, offset);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
