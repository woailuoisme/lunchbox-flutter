import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/core/widgets/widgets.dart';
import 'package:lunchbox/features/cart/entities/cart_item_model.dart';
import 'package:lunchbox/features/cart/providers/cart_notifier.dart';
import 'package:lunchbox/features/cart/providers/cart_state.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/app_routes.dart';
import 'package:material_symbols_icons/symbols.dart';

/// 购物车视图
class CartView extends ConsumerStatefulWidget {
  const CartView({super.key});

  @override
  ConsumerState<CartView> createState() => _CartViewState();
}

class _CartViewState extends ConsumerState<CartView> {
  // 选择模式
  bool _isSelectionMode = false;
  // 选中的项目ID集合
  final Set<String> _selectedItemIds = {};

  void _toggleSelectionMode() {
    setState(() {
      _isSelectionMode = !_isSelectionMode;
      _selectedItemIds.clear();
    });
  }

  void _toggleItemSelection(String itemId) {
    setState(() {
      if (_selectedItemIds.contains(itemId)) {
        _selectedItemIds.remove(itemId);
        // 如果取消选中后没有选中项，退出选择模式
        if (_selectedItemIds.isEmpty) {
          _isSelectionMode = false;
        }
      } else {
        _selectedItemIds.add(itemId);
      }
    });
  }

  void _selectAll(List<CartItemModel> items) {
    setState(() {
      if (_selectedItemIds.length == items.length) {
        _selectedItemIds.clear();
      } else {
        _selectedItemIds.addAll(items.map((e) => e.id));
      }
    });
  }

  Future<void> _deleteSelectedItems(CartNotifier notifier) async {
    if (_selectedItemIds.isEmpty) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.common.delete),
        content: Text(t.cart.deleteConfirm(count: _selectedItemIds.length)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(t.common.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(t.common.confirm),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await notifier.removeItems(_selectedItemIds.toList());
      setState(() {
        _selectedItemIds.clear();
        _isSelectionMode = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cartProvider);
    final notifier = ref.read(cartProvider.notifier);
    final theme = Theme.of(context);

    return PopScope(
      canPop: !_isSelectionMode,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _isSelectionMode) {
          setState(() {
            _isSelectionMode = false;
            _selectedItemIds.clear();
          });
        }
      },
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: _buildAppBar(context, state, notifier, theme),
        body: Builder(
          builder: (context) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.cartItems.isEmpty) {
              return _buildEmptyCart(context, theme);
            }

            return Column(
              children: [
                // 购物车列表
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
                    itemCount: state.cartItems.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                    itemBuilder: (context, index) {
                      final item = state.cartItems[index];
                      return _buildCartItem(item, notifier, theme);
                    },
                  ),
                ),

                // 底部结算栏或操作栏
                if (_isSelectionMode)
                  _buildSelectionBottomBar(context, notifier, theme)
                else
                  _buildBottomBar(context, state, theme),
              ],
            );
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    CartState state,
    CartNotifier notifier,
    ThemeData theme,
  ) {
    if (_isSelectionMode) {
      return AppBar(
        title: Text(
          t.cart.selectedCount(count: _selectedItemIds.length),
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            setState(() {
              _isSelectionMode = false;
              _selectedItemIds.clear();
            });
          },
        ),
        actions: [
          TextButton(
            onPressed: () => _selectAll(state.cartItems),
            child: Text(
              _selectedItemIds.length == state.cartItems.length
                  ? t.common.deselectAll
                  : t.common.selectAll,
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      );
    }

    return AppBar(
      title: Text(t.cart.title),
      centerTitle: true,
      backgroundColor: theme.colorScheme.surface,
      elevation: 0,
      actions: [
        if (state.cartItems.isNotEmpty)
          TextButton(
            onPressed: () => _showClearCartDialog(context, notifier),
            child: Text(
              t.cart.clear,
              style: TextStyle(
                color: theme.colorScheme.error,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }

  Future<void> _showClearCartDialog(
    BuildContext context,
    CartNotifier notifier,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.cart.clearCart),
        content: Text(t.cart.clearCartConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(t.common.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(t.common.confirm),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await notifier.clearCart();
    }
  }

  /// 构建空购物车
  Widget _buildEmptyCart(BuildContext context, ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.3,
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Symbols.shopping_cart_off,
              size: 64.sp,
              color: theme.colorScheme.outline,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            t.cart.empty,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            t.cart.emptyHint,
            style: TextStyle(
              fontSize: 14.sp,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(height: 32.h),
          FilledButton.icon(
            onPressed: () => context.go(AppRoutes.home),
            icon: const Icon(Symbols.storefront),
            label: Text(t.cart.goShopping),
            style: FilledButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
              textStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 构建购物车商品项
  Widget _buildCartItem(
    CartItemModel item,
    CartNotifier notifier,
    ThemeData theme,
  ) {
    final isSelected = _selectedItemIds.contains(item.id);

    // 选择模式下禁用侧滑删除
    final child = InkWell(
      onLongPress: () {
        if (!_isSelectionMode) {
          setState(() {
            _isSelectionMode = true;
            _selectedItemIds.add(item.id);
          });
        }
      },
      onTap: _isSelectionMode ? () => _toggleItemSelection(item.id) : null,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.primaryContainer.withValues(alpha: 0.3)
              : theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16.r),
          border: _isSelectionMode && isSelected
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
            if (_isSelectionMode)
              Padding(
                padding: EdgeInsets.only(right: 12.w),
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
                        ...[
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
                        if (!_isSelectionMode)
                          _buildQuantityControl(item, notifier, theme),
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

    if (_isSelectionMode) {
      return child;
    }

    return Slidable(
      key: ValueKey(item.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.25,
        children: [
          CustomSlidableAction(
            onPressed: (_) => notifier.removeItem(item.id),
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
      child: child,
    );
  }

  Widget _buildQuantityControl(
    CartItemModel item,
    CartNotifier notifier,
    ThemeData theme,
  ) {
    return Container(
      height: 32.h,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16.h),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildQuantityButton(
            icon: Symbols.remove,
            onPressed: () => notifier.decreaseQuantity(item),
            theme: theme,
          ),
          Container(
            constraints: BoxConstraints(minWidth: 32.w),
            alignment: Alignment.center,
            child: Text(
              '${item.quantity}',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
          _buildQuantityButton(
            icon: Symbols.add,
            onPressed: () => notifier.increaseQuantity(item),
            theme: theme,
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onPressed,
    required ThemeData theme,
  }) {
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

  /// 构建底部结算栏
  Widget _buildBottomBar(
    BuildContext context,
    CartState state,
    ThemeData theme,
  ) {
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
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      t.cart.total,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: theme.colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (state.totalQuantity > 0) ...[
                      SizedBox(width: 6.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          '${state.totalQuantity}',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: 4.h),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '¥',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.error,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      TextSpan(
                        text: state.totalAmount.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w800,
                          color: theme.colorScheme.error,
                          height: 1.1,
                          letterSpacing: -0.5,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            flex: 3,
            child: FilledButton(
              onPressed: state.isEmpty
                  ? null
                  : () {
                      context.push(AppRoutes.payment);
                    },
              style: FilledButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
                backgroundColor: theme.colorScheme.primary,
                elevation: 4,
                shadowColor: theme.colorScheme.primary.withValues(alpha: 0.4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    t.cart.checkout,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
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

  /// 构建选择模式下的底部栏
  Widget _buildSelectionBottomBar(
    BuildContext context,
    CartNotifier notifier,
    ThemeData theme,
  ) {
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                _isSelectionMode = false;
                _selectedItemIds.clear();
              });
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            ),
            child: Text(
              t.common.cancel,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          ),
          FilledButton.icon(
            onPressed: _selectedItemIds.isEmpty
                ? null
                : () => _deleteSelectedItems(notifier),
            icon: Icon(Icons.delete_outline, size: 20.sp),
            label: Text(
              t.common.delete,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            style: FilledButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
              backgroundColor: theme.colorScheme.error,
              foregroundColor: theme.colorScheme.onError,
              elevation: 0,
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
