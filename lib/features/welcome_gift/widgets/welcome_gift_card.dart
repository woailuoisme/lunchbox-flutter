import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/welcome_gift/entities/welcome_gift_item_model.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 单个礼包卡片组件
class WelcomeGiftCard extends StatelessWidget {
  const WelcomeGiftCard({required this.gift, this.onClaim, super.key});

  /// 礼包数据模型
  final WelcomeGiftItemModel gift;

  /// 点击领取的回调
  final VoidCallback? onClaim;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isReceived = gift.isClaimed;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      height: 100.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // 左侧礼包标识
          Container(
            width: 100.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFFFCCBC).withValues(alpha: 0.3),
                  const Color(0xFFFFAB91).withValues(alpha: 0.1),
                ],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                bottomLeft: Radius.circular(12.r),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              t.welcome_gift.card.tag,
              style: TextStyle(
                color: const Color(0xFFFF7043),
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // 右侧内容
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        gift.title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      // 状态标签
                      if (isReceived)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF4DB6AC), // 绿色背景
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            t.welcome_gift.card.status.received,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Text(
                    gift.description,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  // 底部按钮区域
                  Align(
                    alignment: Alignment.centerRight,
                    child: isReceived
                        ? Container(
                            width: 80.w,
                            height: 28.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                            child: Text(
                              t.welcome_gift.card.button.received,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: onClaim,
                            child: Container(
                              width: 80.w,
                              height: 28.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFFF8A65),
                                    Color(0xFFFFAB91),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(14.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(
                                      0xFFFF8A65,
                                    ).withValues(alpha: 0.4),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Text(
                                t.welcome_gift.card.button.claim,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
