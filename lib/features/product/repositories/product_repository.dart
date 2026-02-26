import 'package:lunchbox/core/errors/errors.dart';
import 'package:lunchbox/core/errors/repository_error_handler_mixin.dart';
import 'package:lunchbox/features/product/datasources/product_rest_client.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';
import 'package:lunchbox/features/product/repositories/simulated_product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository.g.dart';

@Riverpod(keepAlive: true)
ProductRepository productRepository(Ref ref) {
  final restClient = ref.watch(productRestClientProvider);
  // 使用模拟仓库
  return SimulatedProductRepository(restClient);
}

/// 产品仓库类
/// 负责处理自动售货机产品相关的数据访问和业务逻辑
class ProductRepository with RepositoryErrorHandlerMixin {
  ProductRepository(this._client);

  final ProductRestClient _client;

  /// 获取设备的所有产品列表
  Future<List<ProductModel>> getProductsByDeviceId(String deviceId) async {
    try {
      final response = await _client.getProductsByDeviceId(deviceId);
      if (response.success && response.data != null) {
        return response.data!.items;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    } catch (e, stack) {
      throw handleError(e, stack);
    }
  }

  /// 根据产品ID获取产品详情
  Future<ProductModel> getProductById(String productId) async {
    try {
      final response = await _client.getProductById(productId);
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    } catch (e, stack) {
      throw handleError(e, stack);
    }
  }

  /// 获取设备中有库存的产品
  Future<List<ProductModel>> getAvailableProducts(String deviceId) async {
    final products = await getProductsByDeviceId(deviceId);
    return products.where((product) => product.hasStock).toList();
  }

  /// 获取设备中的特价产品
  Future<List<ProductModel>> getDiscountProducts(String deviceId) async {
    final products = await getProductsByDeviceId(deviceId);
    return products.where((product) => product.hasDiscount).toList();
  }

  /// 根据类别获取产品
  Future<List<ProductModel>> getProductsByCategory(
    String deviceId,
    String category,
  ) async {
    final products = await getProductsByDeviceId(deviceId);
    return products.where((product) => product.category == category).toList();
  }

  /// 获取设备的所有产品类别
  Future<List<String>> getProductCategories(String deviceId) async {
    final products = await getProductsByDeviceId(deviceId);
    final categories = <String>{};
    for (final product in products) {
      categories.add(product.category);
    }
    return categories.toList()..sort();
  }

  /// 搜索产品
  Future<List<ProductModel>> searchProducts(
    String deviceId,
    String keyword, {
    String? category,
  }) async {
    final products = category != null
        ? await getProductsByCategory(deviceId, category)
        : await getProductsByDeviceId(deviceId);

    if (keyword.isEmpty) {
      return products;
    }

    final lowercaseKeyword = keyword.toLowerCase();

    return products
        .where(
          (product) =>
              product.name.toLowerCase().contains(lowercaseKeyword) ||
              product.description.toLowerCase().contains(lowercaseKeyword),
        )
        .toList();
  }

  /// 根据价格范围获取产品
  Future<List<ProductModel>> getProductsByPriceRange(
    String deviceId,
    double minPrice,
    double maxPrice,
  ) async {
    final products = await getProductsByDeviceId(deviceId);
    return products.where((product) {
      final effectivePrice = product.price;
      return effectivePrice >= minPrice && effectivePrice <= maxPrice;
    }).toList();
  }

  /// 更新产品库存
  Future<bool> updateProductStock(
    String deviceId,
    String productId,
    int quantity,
  ) async {
    try {
      final response = await _client.updateProductStock(deviceId, productId, {
        'quantity': quantity,
      });
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    } catch (e, stack) {
      throw handleError(e, stack);
    }
  }

  /// 获取产品推荐列表
  Future<List<ProductModel>> getRecommendedProducts(
    String deviceId, {
    int limit = 5,
  }) async {
    final products = await getProductsByDeviceId(deviceId);
    // 简单的推荐逻辑：优先推荐有库存、有折扣的产品
    final sortedProducts = [...products]
      ..sort((a, b) {
        // 首先按库存状态排序
        if (a.stock > 0 && b.stock == 0) {
          return -1;
        }
        if (a.stock == 0 && b.stock > 0) {
          return 1;
        }

        // 然后按是否有折扣排序
        if (a.hasDiscount && !b.hasDiscount) {
          return -1;
        }
        if (!a.hasDiscount && b.hasDiscount) {
          return 1;
        }

        // 最后按价格排序
        return a.price.compareTo(b.price);
      });

    return sortedProducts.take(limit).toList();
  }

  /// 批量获取产品信息
  Future<List<ProductModel>> getProductsByIds(List<String> productIds) async {
    try {
      final response = await _client.getProductsBatch({'ids': productIds});
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    } catch (e, stack) {
      throw handleError(e, stack);
    }
  }
}
