import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/features/wallet/entities/wallet_transaction_model.dart';

class WalletTransactionItem extends StatelessWidget {
  const WalletTransactionItem({super.key, required this.transaction});

  final WalletTransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isRecharge = transaction.type == 'recharge';

    final iconColor = isRecharge
        ? const Color(0xFF4CAF50)
        : const Color(0xFFF44336);
    final backgroundColor = isRecharge
        ? const Color(0xFFE8F5E9)
        : const Color(0xFFFFEBEE);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: theme.brightness == Brightness.dark
                  ? iconColor.withValues(alpha: 0.2)
                  : backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isRecharge ? Symbols.add : Symbols.remove,
              size: 20.sp,
              color: iconColor,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  transaction.date,
                  style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
                ),
              ],
            ),
          ),
          Text(
            '${isRecharge ? '+' : '-'} ${transaction.amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: iconColor,
            ),
          ),
        ],
      ),
    );
  }
}
