import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lunchbox/core/errors/failure.dart';
import 'package:lunchbox/core/network/rest_client.dart';
import 'package:lunchbox/core/services/storage_service.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/features/cart/entities/cart_item_model.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_repository.g.dart';

@Riverpod(keepAlive: true)
CartRepository cartRepository(Ref ref) {
  final storageService = ref.watch(storageServiceProvider);
  final client = ref.watch(restClientProvider);
  return CartRepository(storageService, client);
}

/// 购物车仓库类
/// 负责处理购物车相关的数据访问和业务逻辑
class CartRepository {
  CartRepository(this._storage, this._client);
  static const String cartStorageKey = 'cart_items';
  static const String currentDeviceKey = 'current_device_id';

  final StorageService _storage;
  final RestClient _client;

  /// 获取当前购物车中的所有商品
  List<CartItemModel> getCartItems() {
    final cartJson = _storage.read<String>(cartStorageKey);
    if (cartJson == null) {
      return [];
    }

    try {
      final List<dynamic> decoded = jsonDecode(cartJson) as List<dynamic>;
      return decoded
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      LoggerUtils.e('Failed to parse cart items', e);
      return [];
    }
  }

  /// 设置当前设备ID
  void setCurrentDeviceId(String deviceId) {
    _storage.write(currentDeviceKey, deviceId);
  }

  /// 获取当前设备ID
  String? getCurrentDeviceId() {
    return _storage.read<String>(currentDeviceKey);
  }

  /// 添加商品到购物车
  void addToCart(ProductModel product, {int quantity = 1}) {
    final cartItems = getCartItems();
    final existingItemIndex = cartItems.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingItemIndex >= 0) {
      // 如果商品已存在，更新数量
      final existingItem = cartItems[existingItemIndex];
      final newQuantity = existingItem.quantity + quantity;

      // 检查是否超过库存
      if (newQuantity <= product.stock) {
        // 更新数量 - 使用 copyWith 因为 Freezed 类是不可变的
        cartItems[existingItemIndex] = existingItem.copyWith(
          quantity: newQuantity,
        );
      } else {
        // 如果超过库存，设置为最大库存
        cartItems[existingItemIndex] = existingItem.copyWith(
          quantity: product.stock,
        );
      }
    } else {
      // 如果商品不存在，添加新商品
      final newItem = CartItemModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        productId: product.id,
        product: product,
        deviceId: getCurrentDeviceId() ?? '',
        quantity: quantity,
        addedTime: DateTime.now(),
      );
      cartItems.add(newItem);
    }

    // 保存到本地存储
    _saveCartItems(cartItems);
  }

  /// 从购物车移除商品
  void removeFromCart(String itemId) {
    final cartItems = getCartItems()..removeWhere((item) => item.id == itemId);
    _saveCartItems(cartItems);
  }

  /// 更新购物车中商品的数量
  void updateCartItemQuantity(String itemId, int quantity) {
    if (quantity <= 0) {
      removeFromCart(itemId);
      return;
    }

    final cartItems = getCartItems();
    final itemIndex = cartItems.indexWhere((item) => item.id == itemId);

    if (itemIndex >= 0) {
      final item = cartItems[itemIndex];

      // 检查是否超过库存
      if (quantity <= item.product.stock) {
        cartItems[itemIndex] = item.copyWith(quantity: quantity);
        _saveCartItems(cartItems);
      }
    }
  }

  /// 从购物车移除多个商品
  void removeItems(List<String> itemIds) {
    final cartItems = getCartItems();
    cartItems.removeWhere((item) => itemIds.contains(item.id));
    _saveCartItems(cartItems);
  }

  /// 清空购物车
  void clearCart() {
    _storage.remove(cartStorageKey);
  }

  /// 获取购物车总金额
  double getCartTotal() {
    final cartItems = getCartItems();
    return cartItems.fold(0, (total, item) => total + item.totalPrice);
  }

  /// 获取购物车商品总数
  int getCartItemCount() {
    final cartItems = getCartItems();
    return cartItems.fold(0, (count, item) => count + item.quantity);
  }

  /// 检查购物车是否为空
  bool isCartEmpty() {
    return getCartItemCount() == 0;
  }

  /// 检查商品是否在购物车中
  bool isInCart(String productId) {
    final cartItems = getCartItems();
    return cartItems.any((item) => item.product.id == productId);
  }

  /// 获取购物车中指定商品的数量
  int getProductQuantityInCart(String productId) {
    final cartItems = getCartItems();
    final item = cartItems.firstWhere(
      (item) => item.product.id == productId,
      orElse: () => CartItemModel(
        id: '',
        productId: '',
        product: ProductModel(
          id: '',
          name: '',
          description: '',
          price: 0,
          imageUrl: '',
          updateTime: DateTime.now(),
        ),
        deviceId: '',
        quantity: 0,
        addedTime: DateTime.now(),
      ),
    );
    return item.quantity;
  }

  /// 同步购物车数据（与服务器同步）
  TaskEither<Failure, bool> syncCart() {
    return TaskEither.tryCatch(() async {
      // 在实际项目中，这里应该与服务器同步购物车数据
      // TODO: Implement actual sync logic with _client when endpoints are available
      return true;
    }, _handleError);
  }

  /// 批量添加商品到购物车
  void addMultipleToCart(Map<ProductModel, int> productsWithQuantity) {
    final cartItems = getCartItems();

    productsWithQuantity.forEach((product, quantity) {
      final existingItemIndex = cartItems.indexWhere(
        (item) => item.product.id == product.id,
      );

      if (existingItemIndex >= 0) {
        // 如果商品已存在，更新数量
        final existingItem = cartItems[existingItemIndex];
        final newQuantity = existingItem.quantity + quantity;

        if (newQuantity <= product.stock) {
          cartItems[existingItemIndex] = existingItem.copyWith(
            quantity: newQuantity,
          );
        }
      } else {
        // 如果商品不存在，添加新商品
        final newItem = CartItemModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          productId: product.id,
          product: product,
          deviceId: getCurrentDeviceId() ?? '',
          quantity: quantity,
          addedTime: DateTime.now(),
        );
        cartItems.add(newItem);
      }
    });

    _saveCartItems(cartItems);
  }

  /// 保存购物车数据到本地存储
  void _saveCartItems(List<CartItemModel> cartItems) {
    try {
      final jsonList = cartItems.map((item) => item.toJson()).toList();
      final jsonString = jsonEncode(jsonList);
      _storage.write(cartStorageKey, jsonString);
    } catch (e) {
      LoggerUtils.e('Failed to save cart items', e);
    }
  }

  Failure _handleError(Object error, StackTrace stackTrace) {
    if (error is DioException) {
      return Failure.network(
        message: error.message ?? 'Unknown network error',
        statusCode: error.response?.statusCode,
      );
    }
    return Failure.server(message: error.toString(), statusCode: 500);
  }
}
