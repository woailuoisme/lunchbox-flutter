import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/cart/entities/cart_item_model.dart';
import 'package:lunchbox/features/cart/providers/cart_provider.dart';
import 'package:lunchbox/features/cart/providers/cart_state.dart';
import 'package:lunchbox/features/cart/widgets/cart_bottom_bar.dart';
import 'package:lunchbox/features/cart/widgets/cart_empty_state.dart';
import 'package:lunchbox/features/cart/widgets/cart_item_card.dart';
import 'package:lunchbox/features/cart/widgets/cart_selection_bottom_bar.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/routes.dart';

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
    final cartState = ref.watch(cartProvider);
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
        appBar: _buildAppBar(context, cartState.value, notifier, theme),
        body: cartState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('加载购物车失败: $error'),
                TextButton(
                  onPressed: () => ref.refresh(cartProvider),
                  child: const Text('重试'),
                ),
              ],
            ),
          ),
          data: (state) {
            if (state.cartItems.isEmpty) {
              return const CartEmptyState();
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
                      return CartItemCard(
                        item: item,
                        isSelectionMode: _isSelectionMode,
                        isSelected: _selectedItemIds.contains(item.id),
                        onToggleSelection: () => _toggleItemSelection(item.id),
                        onLongPress: () {
                          if (!_isSelectionMode) {
                            setState(() {
                              _isSelectionMode = true;
                              _selectedItemIds.add(item.id);
                            });
                          }
                        },
                        onIncrease: () => notifier.increaseQuantity(item),
                        onDecrease: () => notifier.decreaseQuantity(item),
                        onDelete: () => notifier.removeItem(item.id),
                      );
                    },
                  ),
                ),

                // 底部结算栏或操作栏
                if (_isSelectionMode)
                  CartSelectionBottomBar(
                    selectedCount: _selectedItemIds.length,
                    onDelete: () => _deleteSelectedItems(notifier),
                  )
                else
                  CartBottomBar(
                    totalQuantity: state.totalQuantity,
                    totalAmount: state.totalAmount,
                    isEmpty: state.isEmpty,
                    onCheckout: () {
                      final selectedItems = state.cartItems
                          .where((item) => item.isSelected)
                          .toList();
                      if (selectedItems.isNotEmpty) {
                        PaymentRoute($extra: selectedItems).push<void>(context);
                      }
                    },
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    CartState? state,
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
          if (state != null)
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
        if (state != null && state.cartItems.isNotEmpty)
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
}
