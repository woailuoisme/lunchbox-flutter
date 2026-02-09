import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/features/device/entities/cart_item_model.dart';
import 'package:lunchbox/features/device/providers/cart_state.dart';
import 'package:lunchbox/features/device/repositories/cart_repository.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_notifier.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  CartState build() {
    // Initial load
    Future.microtask(loadCart);
    return const CartState();
  }

  Future<void> loadCart() async {
    state = state.copyWith(isLoading: true);
    try {
      final repository = ref.read(cartRepositoryProvider);
      final items = repository.getCartItems();
      state = state.copyWith(cartItems: items, isLoading: false);
    } catch (e) {
      LoggerUtils.e('CartNotifier: Failed to load cart', e);
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> addToCart(ProductModel product, {int quantity = 1}) async {
    try {
      ref.read(cartRepositoryProvider).addToCart(product, quantity: quantity);
      await loadCart();
      LoggerUtils.i('CartNotifier: Added ${product.name} to cart');
    } catch (e) {
      LoggerUtils.e('CartNotifier: Failed to add to cart', e);
    }
  }

  Future<void> updateQuantity(CartItemModel item, int quantity) async {
    try {
      ref
          .read(cartRepositoryProvider)
          .updateCartItemQuantity(item.id, quantity);
      await loadCart();
      LoggerUtils.i(
        'CartNotifier: Updated quantity for ${item.product.name} to $quantity',
      );
    } catch (e) {
      LoggerUtils.e('CartNotifier: Failed to update quantity', e);
    }
  }

  Future<void> increaseQuantity(CartItemModel item) async {
    if (item.quantity >= item.product.stock) {
      // Show toast/snackbar (handled by UI listener usually, or we can use a side effect provider)
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
    try {
      ref.read(cartRepositoryProvider).removeFromCart(itemId);
      await loadCart();
      LoggerUtils.i('CartNotifier: Removed item $itemId');
    } catch (e) {
      LoggerUtils.e('CartNotifier: Failed to remove item', e);
    }
  }

  Future<void> clearCart() async {
    try {
      ref.read(cartRepositoryProvider).clearCart();
      await loadCart();
      LoggerUtils.i('CartNotifier: Cleared cart');
    } catch (e) {
      LoggerUtils.e('CartNotifier: Failed to clear cart', e);
    }
  }
}
