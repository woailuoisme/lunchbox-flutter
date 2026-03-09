import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/my_coupons/providers/user_coupons_provider.dart';
import 'package:lunchbox/features/my_coupons/widgets/coupon_card.dart';
import 'package:lunchbox/features/my_coupons/widgets/coupon_empty_state.dart';
import 'package:lunchbox/i18n/translations.g.dart';

/// 优惠券列表 Tab 内容组件
/// 负责根据状态（可用/不可用）获取数据并展示
class CouponListTabContent extends ConsumerWidget {
  const CouponListTabContent({required this.isAvailable, super.key});

  final bool isAvailable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usedType = isAvailable ? 'active' : 'inactive';
    final couponsAsync = ref.watch(userCouponsProvider(usedType: usedType));

    return couponsAsync.when(
      data: (coupons) {
        if (coupons.isEmpty) {
          return const CouponEmptyState();
        }

        return ListView.separated(
          padding: EdgeInsets.all(16.w),
          itemCount: coupons.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            return CouponCard(coupon: coupons[index], isAvailable: isAvailable);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) =>
          Center(child: Text('${t.common.loadFailed}: $error')),
    );
  }
}
