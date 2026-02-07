import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/core/values/app_colors.dart';
import 'package:lunchbox/features/home/providers/lottery_provider.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/app_routes.dart';

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
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://img.icons8.com/emoji/96/party-popper.png',
                width: 80.w,
                height: 80.w,
              ),
              SizedBox(height: 16.h),
              Text(
                '恭喜获得',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),
              Text(
                prizeName,
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: const Text('开心收下'),
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

    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F5),
      appBar: AppBar(
        title: Text(t.home.grid.lottery),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(lotteryState.remainingSpins),
            SizedBox(height: 20.h),
            _buildWheelSection(
              lotteryState.isSpinning,
              lotteryNotifier.wheelItems,
            ),
            SizedBox(height: 30.h),
            _buildPrizeInfo(lotteryNotifier.wheelItems),
            SizedBox(height: 20.h),
            _buildRules(),
            SizedBox(height: 30.h),
            _buildBottomButtons(),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  /// 顶部标题卡片
  Widget _buildHeader(int remainingSpins) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.network(
            'https://img.icons8.com/emoji/96/wrapped-gift.png',
            width: 48.w,
            height: 48.w,
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
                    color: Colors.black87,
                  ),
                ),
                Text(
                  '参与抽奖，赢取好礼',
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              '剩余次数: $remainingSpins',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 转盘区域
  Widget _buildWheelSection(bool isSpinning, List<String> items) {
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
              Icons.arrow_drop_down,
              size: 40.w,
              color: const Color(0xFFD32F2F),
            ),
          ),
          // 中心按钮
          GestureDetector(
            onTap: isSpinning ? null : _handleSpin,
            child: Container(
              width: 80.w,
              height: 80.w,
              decoration: BoxDecoration(
                color: AppColors.primary,
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
                  color: Colors.white,
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
  Widget _buildPrizeInfo(List<String> prizes) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '奖品说明',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.h),
          ...prizes.map(
            (prize) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 20.w),
                  SizedBox(width: 8.w),
                  Text(
                    prize,
                    style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 抽奖规则
  Widget _buildRules() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '抽奖规则',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                '收起',
                style: TextStyle(fontSize: 12.sp, color: AppColors.primary),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          _buildRuleItem('每日有免费抽奖次数，次数用完后可领取任务获得'),
          _buildRuleItem('优惠券48小时内有效，乖乖币自动到账'),
          _buildRuleItem('活动最终解释权归平台所有'),
        ],
      ),
    );
  }

  Widget _buildRuleItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(color: Colors.grey, fontSize: 14.sp),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.sp,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 底部按钮
  Widget _buildBottomButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFF0F0),
                foregroundColor: AppColors.primary,
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: const Text('返回'),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                context.push('${AppRoutes.lottery}/${AppRoutes.myPrizes}');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  side: BorderSide(color: Colors.grey.withValues(alpha: 0.2)),
                ),
              ),
              child: const Text('我的奖品'),
            ),
          ),
        ],
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
