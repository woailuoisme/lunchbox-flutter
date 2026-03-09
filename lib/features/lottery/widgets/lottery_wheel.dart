import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 抽奖转盘组件（纯展示，无内部状态）
class LotteryWheel extends StatelessWidget {
  const LotteryWheel({
    required this.items,
    required this.isSpinning,
    required this.onSpin,
    required this.rotation,
    super.key,
  });

  final List<String> items;
  final bool isSpinning;
  final VoidCallback onSpin;
  final double rotation;

  static const List<Color> _sectorColors = [
    Color(0xFFFF8A80),
    Color(0xFFFFFFFF),
    Color(0xFFFFD180),
    Color(0xFFFFFFFF),
    Color(0xFF80D8FF),
    Color(0xFFFFFFFF),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 外圈装饰
          DecoratedBox(
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
            child: SizedBox(width: 320.w, height: 320.w),
          ),
          // 旋转转盘
          Transform.rotate(
            angle: rotation,
            child: SizedBox(
              width: 300.w,
              height: 300.w,
              child: CustomPaint(
                painter: _WheelPainter(items: items, colors: _sectorColors),
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
          // 中心触发按钮
          _SpinButton(
            isSpinning: isSpinning,
            onTap: isSpinning ? null : onSpin,
            colorScheme: colorScheme,
          ),
        ],
      ),
    );
  }
}

/// 中心"抽奖"按钮
class _SpinButton extends StatelessWidget {
  const _SpinButton({
    required this.isSpinning,
    required this.onTap,
    required this.colorScheme,
  });

  final bool isSpinning;
  final VoidCallback? onTap;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80.w,
        height: 80.w,
        decoration: BoxDecoration(
          color: isSpinning
              ? colorScheme.primary.withValues(alpha: 0.5)
              : colorScheme.primary,
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
    );
  }
}

/// 转盘绘制器（private，仅供 LotteryWheel 使用）
class _WheelPainter extends CustomPainter {
  const _WheelPainter({required this.items, required this.colors});

  final List<String> items;
  final List<Color> colors;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final sectorAngle = 2 * math.pi / items.length;

    for (int i = 0; i < items.length; i++) {
      final startAngle = -math.pi / 2 + i * sectorAngle - sectorAngle / 2;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sectorAngle,
        true,
        Paint()
          ..color = colors[i % colors.length]
          ..style = PaintingStyle.fill,
      );

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
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    canvas
      ..save()
      ..translate(center.dx, center.dy)
      ..rotate(angle + math.pi / 2)
      ..drawPath(Path(), Paint());

    textPainter.paint(canvas, Offset(-textPainter.width / 2, -radius * 0.75));
    canvas.restore();
  }

  @override
  bool shouldRepaint(_WheelPainter old) =>
      old.items != items || old.colors != colors;
}
