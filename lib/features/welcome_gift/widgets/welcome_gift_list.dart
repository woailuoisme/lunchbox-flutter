import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/welcome_gift/entities/welcome_gift_item_model.dart';
import 'package:lunchbox/features/welcome_gift/widgets/welcome_gift_card.dart';

/// 礼包列表组件
class WelcomeGiftList extends StatelessWidget {
  const WelcomeGiftList({required this.gifts, this.onClaim, super.key});

  /// 礼包数据列表
  final List<WelcomeGiftItemModel> gifts;

  /// 领取礼包的回调
  final void Function(WelcomeGiftItemModel)? onClaim;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: gifts.length,
      itemBuilder: (context, index) {
        final gift = gifts[index];
        return WelcomeGiftCard(
          gift: gift,
          onClaim: onClaim != null ? () => onClaim!(gift) : null,
        );
      },
    );
  }
}
