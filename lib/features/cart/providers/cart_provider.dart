import 'dart:async';

import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/features/cart/entities/cart_item_model.dart';
import 'package:lunchbox/features/cart/entities/cart_product_model.dart';
import 'package:lunchbox/features/cart/providers/cart_state.dart';
import 'package:lunchbox/features/cart/repositories/cart_repository.dart';
import 'package:lunchbox/features/device/providers/device_provider.dart';
import 'package:lunchbox/features/product/entities/category_product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  FutureOr<CartState> build() async {
    final repository = ref.watch(cartRepositoryProvider);
    final items = await repository.getCartItems();
    return CartState(cartItems: items);
  }

  Future<void> addToCart(ProductModel product, {int quantity = 1}) async {
    final cartProduct = CartProductModel.fromProductModel(product);
    final selectedDevice = ref.read(selectedDeviceProvider);
    await addCartProductToCart(
      cartProduct,
      quantity: quantity,
      deviceId: selectedDevice?.id.toString(),
    );
  }

  Future<void> addCartProductToCart(
    CartProductModel product, {
    int quantity = 1,
    String? deviceId,
  }) async {
    state = const AsyncLoading<CartState>();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(cartRepositoryProvider);

      // 如果提供了设备ID，更新仓库中的当前设备ID
      if (deviceId != null) {
        repository.setCurrentDeviceId(deviceId);
      }

      await repository.addToCart(
        product,
        quantity: quantity,
        deviceId: deviceId,
      );
      final items = await repository.getCartItems();
      LoggerUtils.i('CartNotifier: Added ${product.name} to cart');
      return CartState(cartItems: items);
    });
  }

  Future<void> updateQuantity(CartItemModel item, int quantity) async {
    state = const AsyncLoading<CartState>();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(cartRepositoryProvider);
      await repository.updateCartItemQuantity(item.id, quantity);
      final items = await repository.getCartItems();
      LoggerUtils.i(
        'CartNotifier: Updated quantity for ${item.product.name} to $quantity',
      );
      return CartState(cartItems: items);
    });
  }

  /// 切换商品选中状态
  Future<void> toggleSelection(String itemId, bool isSelected) async {
    state = await AsyncValue.guard(() async {
      final repository = ref.read(cartRepositoryProvider);
      await repository.toggleItemSelected(itemId, isSelected);
      final items = await repository.getCartItems();
      return CartState(cartItems: items);
    });
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
    state = const AsyncLoading<CartState>();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(cartRepositoryProvider);
      await repository.removeFromCart(itemId);
      final items = await repository.getCartItems();
      LoggerUtils.i('CartNotifier: Removed item $itemId');
      return CartState(cartItems: items);
    });
  }

  Future<void> removeItems(List<String> itemIds) async {
    state = const AsyncLoading<CartState>();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(cartRepositoryProvider);
      await repository.removeItems(itemIds);
      final items = await repository.getCartItems();
      LoggerUtils.i('CartNotifier: Removed items $itemIds');
      return CartState(cartItems: items);
    });
  }

  Future<void> clearCart() async {
    state = const AsyncLoading<CartState>();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(cartRepositoryProvider);
      await repository.clearCart();
      final items = await repository.getCartItems();
      LoggerUtils.i('CartNotifier: Cleared cart');
      return CartState(cartItems: items);
    });
  }
}
