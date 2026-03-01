import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 购物车选择模式底部操作栏
class CartSelectionBottomBar extends StatelessWidget {
  const CartSelectionBottomBar({
    super.key,
    required this.selectedCount,
    required this.onDelete,
  });
  final int selectedCount;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.fromLTRB(
        24.w,
        16.h,
        24.w,
        MediaQuery.of(context).padding.bottom + 16.h,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.08),
            offset: const Offset(0, -4),
            blurRadius: 16,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              t.cart.selectedCount(count: selectedCount),
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          FilledButton.icon(
            onPressed: selectedCount > 0 ? onDelete : null,
            icon: const Icon(Symbols.delete),
            label: Text(t.common.delete),
            style: FilledButton.styleFrom(
              backgroundColor: theme.colorScheme.error,
              foregroundColor: theme.colorScheme.onError,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
