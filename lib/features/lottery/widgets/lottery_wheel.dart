import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 抽奖转盘组件
/// 包含转盘旋转动画、中奖逻辑和中心按钮
class LotteryWheel extends StatefulWidget {
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

  @override
  State<LotteryWheel> createState() => _LotteryWheelState();
}

class _LotteryWheelState extends State<LotteryWheel> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

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
            angle: widget.rotation,
            child: SizedBox(
              width: 300.w,
              height: 300.w,
              child: CustomPaint(
                painter: WheelPainter(
                  items: widget.items,
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
            onTap: widget.isSpinning ? null : widget.onSpin,
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
                widget.isSpinning ? '...' : '抽奖',
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

      // 这里的逻辑：我们希望 index 0 在顶部。
      // drawArc 0度在右边 (3点钟)。
      // 顶部是 -pi/2.
      // 所以扇区 i 的起始角度是 -pi/2 + i * sectorAngle
      final startAngle =
          -math.pi / 2 + i * sectorAngle - (sectorAngle / 2); // 居中

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
