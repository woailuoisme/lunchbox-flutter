import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/i18n/translations.g.dart';

class WalletNoHistory extends StatelessWidget {
  const WalletNoHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.h),
        child: Column(
          children: [
            Icon(
              Symbols.receipt_long,
              size: 48.sp,
              color: theme.disabledColor.withValues(alpha: 0.3),
            ),
            SizedBox(height: 12.h),
            Text(
              t.profile.walletPage.noHistory,
              style: TextStyle(color: theme.hintColor, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
