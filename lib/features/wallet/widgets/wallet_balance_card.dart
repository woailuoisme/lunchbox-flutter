import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/features/wallet/repositories/wallet_repository.dart';
import 'package:lunchbox/i18n/translations.g.dart';

class WalletBalanceCard extends ConsumerWidget {
  const WalletBalanceCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final balanceAsync = ref.watch(walletBalanceProvider);
    final balance = balanceAsync.when(
      data: (value) => value,
      loading: () => 0.00,
      error: (_, _) => 0.00,
    );

    return Container(
      margin: EdgeInsets.all(16.w),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  theme.colorScheme.primary,
                  theme.colorScheme.primary.withValues(alpha: 0.8),
                ],
              ),
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary.withValues(alpha: 0.3),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Symbols.account_balance_wallet,
                      size: 18.sp,
                      color: theme.colorScheme.onPrimary.withValues(alpha: 0.9),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      t.profile.walletPage.balance,
                      style: TextStyle(
                        color: theme.colorScheme.onPrimary.withValues(
                          alpha: 0.9,
                        ),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '¥ ${balance.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: theme.colorScheme.onPrimary,
                        fontSize: 36.sp,
                        fontWeight: FontWeight.bold,
                        height: 1.0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(24.r),
                        border: Border.all(
                          color: theme.colorScheme.surface.withValues(
                            alpha: 0.3,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Symbols.add,
                            color: theme.colorScheme.onPrimary,
                            size: 16.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            t.profile.walletPage.topUp,
                            style: TextStyle(
                              color: theme.colorScheme.onPrimary,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: -20,
            top: -20,
            child: Icon(
              Symbols.account_balance_wallet,
              size: 120.sp,
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.1),
            ),
          ),
        ],
      ),
    );
  }
}
