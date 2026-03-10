import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/welcome_gift/entities/welcome_gift_item_response.dart';
import 'package:lunchbox/features/welcome_gift/widgets/welcome_gift_card.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 礼包列表组件
class WelcomeGiftList extends StatelessWidget {
  const WelcomeGiftList({
    required this.gifts,
    this.onClaim,
    this.processingId,
    super.key,
  });

  /// 礼包数据列表
  final List<WelcomeGiftItemResponse> gifts;

  /// 正在处理的礼包ID
  final int? processingId;

  /// 领取礼包的回调
  final void Function(WelcomeGiftItemResponse)? onClaim;

  @override
  Widget build(BuildContext context) {
    if (gifts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Symbols.sentiment_dissatisfied,
              size: 64.sp,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
            SizedBox(height: 16.h),
            Text(
              t.common.noData,
              style: TextStyle(
                color: Theme.of(context).colorScheme.outline,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      itemCount: gifts.length,
      itemBuilder: (context, index) {
        final gift = gifts[index];
        return WelcomeGiftCard(
          index: index,
          gift: gift,
          isProcessing: processingId == gift.id,
          onClaim: onClaim != null ? () => onClaim!(gift) : null,
        );
      },
    );
  }
}
