import 'package:lunchbox/core/mixins/async_runner_mixin.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/features/cart/entities/cart_item_model.dart';
import 'package:lunchbox/features/cart/providers/cart_state.dart';
import 'package:lunchbox/features/cart/repositories/cart_repository.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier with AsyncRunnerMixin<CartState> {
  @override
  CartState build() {
    // Initial load
    Future.microtask(loadCart);
    return const CartState();
  }

  Future<void> loadCart() async {
    await runAsync(() async {
      final repository = ref.read(cartRepositoryProvider);
      final items = await repository.getCartItems();
      state = state.copyWith(cartItems: items);
    }, errorLabel: '加载购物车失败');
  }

  Future<void> addToCart(ProductModel product, {int quantity = 1}) async {
    await runAsync(() async {
      await ref
          .read(cartRepositoryProvider)
          .addToCart(product, quantity: quantity);
      await loadCart();
      LoggerUtils.i('CartNotifier: Added ${product.name} to cart');
    }, errorLabel: '添加商品到购物车失败');
  }

  Future<void> updateQuantity(CartItemModel item, int quantity) async {
    await runAsync(() async {
      await ref
          .read(cartRepositoryProvider)
          .updateCartItemQuantity(item.id, quantity);
      await loadCart();
      LoggerUtils.i(
        'CartNotifier: Updated quantity for ${item.product.name} to $quantity',
      );
    }, errorLabel: '更新商品数量失败');
  }

  /// 切换商品选中状态
  Future<void> toggleSelection(String itemId, bool isSelected) async {
    await runAsync(
      () async {
        await ref
            .read(cartRepositoryProvider)
            .toggleItemSelected(itemId, isSelected);
        await loadCart();
      },
      showLoading: false,
      errorLabel: '切换选中状态失败',
    );
  }

  Future<void> increaseQuantity(CartItemModel item) async {
    if (item.quantity >= item.product.stock) {
      LoggerUtils.w('Stock limit reached for ${item.product.name}');
      return;
    }
    await updateQuantity(item, item.quantity + 1);
  }

  Future<void> decreaseQuantity(CartItemModel item) async {
    if (item.quantity <= 1) {
      await removeItem(item.id);
      return;
    }
    await updateQuantity(item, item.quantity - 1);
  }

  Future<void> removeItem(String itemId) async {
    await runAsync(() async {
      await ref.read(cartRepositoryProvider).removeFromCart(itemId);
      await loadCart();
      LoggerUtils.i('CartNotifier: Removed item $itemId');
    }, errorLabel: '移除商品失败');
  }

  Future<void> removeItems(List<String> itemIds) async {
    await runAsync(() async {
      await ref.read(cartRepositoryProvider).removeItems(itemIds);
      await loadCart();
      LoggerUtils.i('CartNotifier: Removed items $itemIds');
    }, errorLabel: '移除多个商品失败');
  }

  Future<void> clearCart() async {
    await runAsync(() async {
      await ref.read(cartRepositoryProvider).clearCart();
      await loadCart();
      LoggerUtils.i('CartNotifier: Cleared cart');
    }, errorLabel: '清空购物车失败');
  }
}
