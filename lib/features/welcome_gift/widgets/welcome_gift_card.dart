import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/welcome_gift/entities/welcome_gift_item_response.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// 单个礼包卡片组件
class WelcomeGiftCard extends StatelessWidget {
  const WelcomeGiftCard({
    required this.gift,
    required this.index,
    this.onClaim,
    this.isProcessing = false,
    super.key,
  });

  /// 礼包数据模型
  final WelcomeGiftItemResponse gift;

  /// 点击领取的回调
  final VoidCallback? onClaim;

  /// 索引，用于动画延迟
  final int index;

  /// 是否正在处理领取中
  final bool isProcessing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isReceived = gift.isClaimed;

    return Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          height: 120.h,
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadow.withValues(alpha: 0.08),
                blurRadius: 15,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Stack(
              children: [
                Row(
                  children: [
                    // 左侧装饰栏
                    Container(
                      width: 6.w,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: isReceived
                            ? colorScheme.outlineVariant
                            : colorScheme.primary,
                      ),
                    ),
                    // 图标区域
                    Container(
                      width: 80.w,
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color:
                              (isReceived
                                      ? colorScheme.surfaceContainerHighest
                                      : colorScheme.primaryContainer)
                                  .withValues(alpha: 0.5),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          gift.type == 'coupon'
                              ? Symbols.confirmation_number
                              : Symbols.card_giftcard,
                          color: isReceived
                              ? colorScheme.onSurfaceVariant
                              : colorScheme.primary,
                          size: 32.sp,
                        ),
                      ),
                    ),
                    // 分割虚线 (模拟)
                    CustomPaint(
                      size: Size(1.w, double.infinity),
                      painter: _DashLinePainter(
                        color: colorScheme.outlineVariant,
                      ),
                    ),
                    // 内容区域
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    gift.name,
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: isReceived
                                              ? colorScheme.onSurfaceVariant
                                              : colorScheme.onSurface,
                                        ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (isReceived)
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6.w,
                                      vertical: 2.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: colorScheme.outlineVariant,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    child: Text(
                                      t.welcome_gift.card.status.received,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              gift.description,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (onClaim != null) ...[
                              const Spacer(),
                              // 底部按钮
                              Align(
                                alignment: Alignment.centerRight,
                                child: _buildButton(
                                  context,
                                  isReceived,
                                  colorScheme,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // 背景水印或装饰
                Positioned(
                  right: -20,
                  bottom: -20,
                  child: IgnorePointer(
                    child: Opacity(
                      opacity: 0.05,
                      child: Icon(
                        Symbols.card_giftcard,
                        size: 100.sp,
                        color: isReceived
                            ? colorScheme.outline
                            : colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
        .animate()
        .fadeIn(delay: (index * 100).ms, duration: 500.ms)
        .slideX(begin: 0.1, end: 0);
  }

  Widget _buildButton(
    BuildContext context,
    bool isReceived,
    ColorScheme colorScheme,
  ) {
    if (isReceived) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        decoration: BoxDecoration(
          border: Border.all(color: colorScheme.outlineVariant),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          t.welcome_gift.card.button.received,
          style: TextStyle(fontSize: 12.sp, color: colorScheme.outline),
        ),
      );
    }

    return Skeletonizer(
      enabled: isProcessing,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isProcessing ? null : onClaim,
          borderRadius: BorderRadius.circular(20.r),
          child: Ink(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorScheme.primary,
                  colorScheme.primary.withValues(alpha: 0.8),
                ],
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              t.welcome_gift.card.button.claim,
              style: TextStyle(
                fontSize: 12.sp,
                color: colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DashLinePainter extends CustomPainter {
  _DashLinePainter({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
