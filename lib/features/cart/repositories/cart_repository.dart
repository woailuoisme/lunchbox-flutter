import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:lunchbox/features/cart/datasources/cart_rest_client.dart';
import 'package:lunchbox/core/services/database_service.dart';
import 'package:lunchbox/core/services/storage_service.dart';
import 'package:lunchbox/features/cart/entities/cart_item_model.dart';
import 'package:lunchbox/features/cart/entities/cart_product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_repository.g.dart';

@Riverpod(keepAlive: true)
CartRepository cartRepository(Ref ref) {
  final storageService = ref.watch(storageServiceProvider);
  final client = ref.watch(cartRestClientProvider);
  final database = ref.watch(databaseServiceProvider);
  return CartRepository(storageService, client, database);
}

/// 购物车仓库类
/// 负责处理购物车相关的数据访问和业务逻辑
class CartRepository {
  CartRepository(this._storage, this._client, this._db);
  static const String currentDeviceKey = 'current_device_id';

  final StorageService _storage;
  final CartRestClient _client;
  final AppDatabase _db;

  /// 获取当前购物车中的所有商品
  Future<List<CartItemModel>> getCartItems() async {
    final items = await _db.select(_db.cartItems).get();
    return items.map((item) {
      final product = CartProductModel.fromJson(
        jsonDecode(item.productData) as Map<String, dynamic>,
      );
      return CartItemModel(
        id: item.id.toString(),
        productId: item.productId,
        product: product,
        deviceId: item.deviceId,
        quantity: item.quantity,
        addedTime: item.createdAt,
        isSelected: item.isSelected,
      );
    }).toList();
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
  Future<void> addToCart(
    CartProductModel product, {
    int quantity = 1,
    String? deviceId,
  }) async {
    final existingItem =
        await (_db.select(_db.cartItems)
              ..where((t) => t.productId.equals(product.id.toString())))
            .getSingleOrNull();

    if (existingItem != null) {
      // 如果商品已存在，更新数量
      final newQuantity = existingItem.quantity + quantity;
      final finalQuantity = newQuantity <= product.stock
          ? newQuantity
          : product.stock;

      await (_db.update(
        _db.cartItems,
      )..where((t) => t.id.equals(existingItem.id))).write(
        CartItemsCompanion(
          quantity: Value(finalQuantity),
          updatedAt: Value(DateTime.now()),
        ),
      );
    } else {
      // 如果商品不存在，添加新商品
      await _db
          .into(_db.cartItems)
          .insert(
            CartItemsCompanion.insert(
              deviceId: deviceId ?? getCurrentDeviceId() ?? '',
              productId: product.id.toString(),
              productData: jsonEncode(product.toJson()),
              quantity: Value(quantity),
              isSelected: const Value(true),
              createdAt: Value(DateTime.now()),
              updatedAt: Value(DateTime.now()),
            ),
          );
    }
  }

  /// 从购物车移除商品
  Future<void> removeFromCart(String itemId) async {
    final id = int.tryParse(itemId);
    if (id == null) return;

    await (_db.delete(_db.cartItems)..where((t) => t.id.equals(id))).go();
  }

  /// 更新购物车中商品的数量
  Future<void> updateCartItemQuantity(String itemId, int quantity) async {
    if (quantity <= 0) {
      await removeFromCart(itemId);
      return;
    }

    final id = int.tryParse(itemId);
    if (id == null) return;

    await (_db.update(_db.cartItems)..where((t) => t.id.equals(id))).write(
      CartItemsCompanion(
        quantity: Value(quantity),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  /// 切换选中状态
  Future<void> toggleItemSelected(String itemId, bool isSelected) async {
    final id = int.tryParse(itemId);
    if (id == null) return;

    await (_db.update(_db.cartItems)..where((t) => t.id.equals(id))).write(
      CartItemsCompanion(
        isSelected: Value(isSelected),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  /// 从购物车移除多个商品
  Future<void> removeItems(List<String> itemIds) async {
    final ids = itemIds.map(int.tryParse).whereType<int>().toList();
    if (ids.isEmpty) return;

    await (_db.delete(_db.cartItems)..where((t) => t.id.isIn(ids))).go();
  }

  /// 清空购物车
  Future<void> clearCart() async {
    await _db.delete(_db.cartItems).go();
  }

  /// 获取购物车总金额
  Future<double> getCartTotal() async {
    final List<CartItemModel> items = await getCartItems();
    return items.fold<double>(
      0.0,
      (double total, item) => total + item.totalPrice,
    );
  }

  /// 获取购物车商品总数
  Future<int> getCartItemCount() async {
    final List<CartItemModel> items = await getCartItems();
    return items.fold<int>(0, (int count, item) => count + item.quantity);
  }

  /// 检查购物车是否为空
  Future<bool> isCartEmpty() async {
    final count = await getCartItemCount();
    return count == 0;
  }

  /// 检查商品是否在购物车中
  Future<bool> isInCart(String productId) async {
    final item = await (_db.select(
      _db.cartItems,
    )..where((t) => t.productId.equals(productId))).getSingleOrNull();
    return item != null;
  }

  /// 获取购物车中指定商品的数量
  Future<int> getProductQuantityInCart(String productId) async {
    final item = await (_db.select(
      _db.cartItems,
    )..where((t) => t.productId.equals(productId))).getSingleOrNull();
    return item?.quantity ?? 0;
  }

  /// 同步购物车数据（与服务器同步）
  Future<bool> syncCart() async {
    // 在实际项目中，这里应该与服务器同步购物车数据
    // 例如：final remoteCart = await _client.getCart();
    // 然后更新本地数据库
    return true;
  }

  /// 批量添加商品到购物车
  Future<void> addMultipleToCart(
    Map<CartProductModel, int> productsWithQuantity,
  ) async {
    for (final entry in productsWithQuantity.entries) {
      await addToCart(entry.key, quantity: entry.value);
    }
  }
}
