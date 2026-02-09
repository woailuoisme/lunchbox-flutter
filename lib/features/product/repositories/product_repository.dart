import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lunchbox/core/errors/errors.dart';
import 'package:lunchbox/core/network/network.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';
import 'package:lunchbox/features/product/repositories/simulated_product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository.g.dart';

@Riverpod(keepAlive: true)
ProductRepository productRepository(Ref ref) {
  final restClient = ref.watch(restClientProvider);
  // 使用模拟仓库
  return SimulatedProductRepository(restClient);
}

/// 产品仓库类
/// 负责处理自动售货机产品相关的数据访问和业务逻辑
class ProductRepository {
  ProductRepository(this._client);

  final RestClient _client;

  /// 获取设备的所有产品列表
  TaskEither<Failure, List<ProductModel>> getProductsByDeviceId(
    String deviceId,
  ) {
    return TaskEither.tryCatch(() async {
      final response = await _client.getProductsByDeviceId(deviceId);
      if (response.success && response.data != null) {
        return response.data!.items;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  /// 根据产品ID获取产品详情
  TaskEither<Failure, ProductModel> getProductById(String productId) {
    return TaskEither.tryCatch(() async {
      final response = await _client.getProductById(productId);
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
  }

  /// 获取设备中有库存的产品
  TaskEither<Failure, List<ProductModel>> getAvailableProducts(
    String deviceId,
  ) {
    return getProductsByDeviceId(
      deviceId,
    ).map((products) => products.where((product) => product.hasStock).toList());
  }

  /// 获取设备中的特价产品
  TaskEither<Failure, List<ProductModel>> getDiscountProducts(String deviceId) {
    return getProductsByDeviceId(deviceId).map(
      (products) => products.where((product) => product.hasDiscount).toList(),
    );
  }

  /// 根据类别获取产品
  TaskEither<Failure, List<ProductModel>> getProductsByCategory(
    String deviceId,
    String category,
  ) {
    return getProductsByDeviceId(deviceId).map(
      (products) =>
          products.where((product) => product.category == category).toList(),
    );
  }

  /// 获取设备的所有产品类别
  TaskEither<Failure, List<String>> getProductCategories(String deviceId) {
    return getProductsByDeviceId(deviceId).map((products) {
      final categories = <String>{};
      for (final product in products) {
        categories.add(product.category);
      }
      return categories.toList()..sort();
    });
  }

  /// 搜索产品
  TaskEither<Failure, List<ProductModel>> searchProducts(
    String deviceId,
    String keyword, {
    String? category,
  }) {
    final productsTask = category != null
        ? getProductsByCategory(deviceId, category)
        : getProductsByDeviceId(deviceId);

    return productsTask.map((products) {
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
    });
  }

  /// 根据价格范围获取产品
  TaskEither<Failure, List<ProductModel>> getProductsByPriceRange(
    String deviceId,
    double minPrice,
    double maxPrice,
  ) {
    return getProductsByDeviceId(deviceId).map((products) {
      return products.where((product) {
        final effectivePrice = product.price;
        return effectivePrice >= minPrice && effectivePrice <= maxPrice;
      }).toList();
    });
  }

  /// 更新产品库存
  TaskEither<Failure, bool> updateProductStock(
    String deviceId,
    String productId,
    int quantity,
  ) {
    return TaskEither.tryCatch(() async {
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
    }, _handleError);
  }

  /// 获取产品推荐列表
  TaskEither<Failure, List<ProductModel>> getRecommendedProducts(
    String deviceId, {
    int limit = 5,
  }) {
    return getProductsByDeviceId(deviceId).map((products) {
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
    });
  }

  /// 批量获取产品信息
  TaskEither<Failure, List<ProductModel>> getProductsByIds(
    List<String> productIds,
  ) {
    return TaskEither.tryCatch(() async {
      final response = await _client.getProductsBatch({'ids': productIds});
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }, _handleError);
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
