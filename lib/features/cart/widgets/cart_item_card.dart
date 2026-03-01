import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lunchbox/core/widgets/widgets.dart';
import 'package:lunchbox/features/cart/entities/cart_item_model.dart';
import 'package:lunchbox/features/cart/widgets/cart_quantity_control.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 购物车商品项卡片组件
class CartItemCard extends StatelessWidget {

  const CartItemCard({
    super.key,
    required this.item,
    this.isSelectionMode = false,
    this.isSelected = false,
    required this.onToggleSelection,
    required this.onLongPress,
    required this.onIncrease,
    required this.onDecrease,
    required this.onDelete,
  });
  final CartItemModel item;
  final bool isSelectionMode;
  final bool isSelected;
  final VoidCallback onToggleSelection;
  final VoidCallback onLongPress;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final content = InkWell(
      onLongPress: onLongPress,
      onTap: isSelectionMode ? onToggleSelection : null,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.primaryContainer.withValues(alpha: 0.3)
              : theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16.r),
          border: isSelectionMode && isSelected
              ? Border.all(color: theme.colorScheme.primary, width: 2)
              : null,
          boxShadow: [
            if (!isSelected)
              BoxShadow(
                color: theme.shadowColor.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 选择模式下的复选框
            if (isSelectionMode)
              Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: SizedBox(
                  height: 88.w,
                  child: Center(
                    child: Icon(
                      isSelected
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: isSelected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.outline,
                      size: 24.sp,
                    ),
                  ),
                ),
              ),

            // 商品图片
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: AppImage(
                imageUrl: item.product.imageUrl,
                width: 88.w,
                height: 88.w,
              ),
            ),
            SizedBox(width: 16.w),

            // 商品信息
            Expanded(
              child: SizedBox(
                height: 88.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.product.name,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onSurface,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          item.product.description,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),

                    // 价格和数量控制
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '¥',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                              TextSpan(
                                text: item.product.price.toStringAsFixed(2),
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // 选择模式下隐藏数量控制
                        if (!isSelectionMode)
                          CartQuantityControl(
                            quantity: item.quantity,
                            onIncrease: onIncrease,
                            onDecrease: onDecrease,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    if (isSelectionMode) {
      return content;
    }

    return Slidable(
      key: ValueKey(item.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.25,
        children: [
          CustomSlidableAction(
            onPressed: (_) => onDelete(),
            backgroundColor: theme.colorScheme.error,
            foregroundColor: theme.colorScheme.onError,
            borderRadius: BorderRadius.horizontal(right: Radius.circular(16.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Symbols.delete, size: 24.sp),
                SizedBox(height: 4.h),
                Text(t.common.delete, style: TextStyle(fontSize: 12.sp)),
              ],
            ),
          ),
        ],
      ),
      child: content,
    );
  }
}
