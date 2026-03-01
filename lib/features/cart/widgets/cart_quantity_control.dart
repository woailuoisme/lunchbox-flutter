import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 购物车商品数量控制组件
class CartQuantityControl extends StatelessWidget {
  const CartQuantityControl({
    super.key,
    required this.quantity,
    required this.onDecrease,
    required this.onIncrease,
  });
  final int quantity;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 32.h,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16.h),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _QuantityButton(icon: Symbols.remove, onPressed: onDecrease),
          Container(
            constraints: BoxConstraints(minWidth: 32.w),
            alignment: Alignment.center,
            child: Text(
              '$quantity',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
          _QuantityButton(icon: Symbols.add, onPressed: onIncrease),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16.h),
      child: Container(
        width: 32.h,
        height: 32.h,
        alignment: Alignment.center,
        child: Icon(icon, size: 18.sp, color: theme.colorScheme.onSurface),
      ),
    );
  }
}
