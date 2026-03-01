import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/lottery/providers/lottery_provider.dart';
import 'package:lunchbox/features/lottery/widgets/lottery_bottom_buttons.dart';
import 'package:lunchbox/features/lottery/widgets/lottery_header.dart';
import 'package:lunchbox/features/lottery/widgets/lottery_prize_list.dart';
import 'package:lunchbox/features/lottery/widgets/lottery_result_dialog.dart';
import 'package:lunchbox/features/lottery/widgets/lottery_rules.dart';
import 'package:lunchbox/features/lottery/widgets/lottery_wheel.dart';
import 'package:lunchbox/i18n/translations.g.dart';

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
  double _currentRotation = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
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
    final items = notifier.wheelItems;
    final sectorAngle = 2 * math.pi / items.length;

    // 目标角度：让中奖扇区对准顶部指针
    final randomOffset =
        math.Random().nextDouble() * sectorAngle * 0.8 - (sectorAngle * 0.4);

    // 基础旋转圈数 (5圈)
    const minSpins = 5;
    const spinRotation = minSpins * 2 * math.pi;

    // 计算目标位置
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
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

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
      await LotteryResultDialog.show(context, prize.name);
    }
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
            LotteryHeader(remainingSpins: lotteryState.remainingSpins)
                .animate()
                .fadeIn(duration: 600.ms, curve: Curves.easeOut)
                .slideY(begin: -0.2, end: 0, duration: 600.ms),
            SizedBox(height: 20.h),
            LotteryWheel(
              items: lotteryNotifier.wheelItems,
              isSpinning: lotteryState.isSpinning,
              onSpin: _handleSpin,
              rotation: _currentRotation,
            ).animate().scale(
              duration: 800.ms,
              curve: Curves.elasticOut,
              begin: const Offset(0.8, 0.8),
            ),
            SizedBox(height: 30.h),
            LotteryPrizeList(prizes: lotteryNotifier.wheelItems)
                .animate(delay: 200.ms)
                .fadeIn(duration: 600.ms)
                .slideY(begin: 0.1, end: 0),
            SizedBox(height: 20.h),
            const LotteryRules()
                .animate(delay: 400.ms)
                .fadeIn(duration: 600.ms)
                .slideY(begin: 0.1, end: 0),
            SizedBox(height: 30.h),
            const LotteryBottomButtons()
                .animate(delay: 600.ms)
                .fadeIn(duration: 600.ms)
                .slideY(begin: 0.2, end: 0),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
