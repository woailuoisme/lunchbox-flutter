import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/models/api_response_model.dart';
import '../../../shared/services/api_provider.dart';
import '../../../shared/services/base_repository.dart';
import '../../../shared/services/mock_provider.dart';
import '../entities/product_model.dart';

part 'product_repository.g.dart';

@Riverpod(keepAlive: true)
ProductRepository productRepository(Ref ref) {
  final apiProvider = ref.watch(apiProviderProvider);
  final mockProvider = ref.watch(mockProviderProvider);
  return ProductRepository(apiProvider, mockProvider);
}

/// 产品仓库类
/// 负责处理自动售货机产品相关的数据访问和业务逻辑
class ProductRepository extends BaseRepository {
  ProductRepository(super.apiService, super.mockService, {super.useMockData});

  /// 获取设备的所有产品列表
  Future<List<ProductModel>> getProductsByDeviceId(String deviceId) async {
    return handleListResponse(() async {
      if (useMockData) {
        return mockService.getProductsByDeviceId(deviceId);
      } else {
        return apiService.get(
          '/api/devices/$deviceId/products',
          (json) => List<ProductModel>.from(
            (json! as List).map(
              (item) => ProductModel.fromJson(item as Map<String, dynamic>),
            ),
          ),
        );
      }
    }, '获取设备产品');
  }

  /// 根据产品ID获取产品详情
  Future<ProductModel> getProductById(String productId) async {
    return handleResponse(() async {
      if (useMockData) {
        return mockService.getProductById(productId);
      } else {
        return apiService.get(
          '/api/products/$productId',
          (json) => ProductModel.fromJson(json! as Map<String, dynamic>),
        );
      }
    }, '获取产品详情');
  }

  /// 获取设备中有库存的产品
  Future<List<ProductModel>> getAvailableProducts(String deviceId) async {
    final allProducts = await getProductsByDeviceId(deviceId);
    return allProducts.where((product) => product.hasStock).toList();
  }

  /// 获取设备中的特价产品
  Future<List<ProductModel>> getDiscountProducts(String deviceId) async {
    final allProducts = await getProductsByDeviceId(deviceId);
    return allProducts.where((product) => product.hasDiscount).toList();
  }

  /// 根据类别获取产品
  Future<List<ProductModel>> getProductsByCategory(
    String deviceId,
    String category,
  ) async {
    final allProducts = await getProductsByDeviceId(deviceId);
    return allProducts
        .where((product) => product.category == category)
        .toList();
  }

  /// 获取设备的所有产品类别
  Future<List<String>> getProductCategories(String deviceId) async {
    final allProducts = await getProductsByDeviceId(deviceId);
    final categories = <String>{};

    for (final product in allProducts) {
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
    List<ProductModel> products;

    if (category != null) {
      products = await getProductsByCategory(deviceId, category);
    } else {
      products = await getProductsByDeviceId(deviceId);
    }

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
    final allProducts = await getProductsByDeviceId(deviceId);

    return allProducts.where((product) {
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
    return handleResponse(() async {
      if (useMockData) {
        // 在Mock数据中模拟更新库存
        return ApiResponseModel.success(true);
      } else {
        return apiService.post(
          '/api/devices/$deviceId/products/$productId/stock',
          {'quantity': quantity},
          (json) => json! as bool,
        );
      }
    }, '更新产品库存');
  }

  /// 获取产品推荐列表
  Future<List<ProductModel>> getRecommendedProducts(
    String deviceId, {
    int limit = 5,
  }) async {
    final allProducts = await getProductsByDeviceId(deviceId);

    // 简单的推荐逻辑：优先推荐有库存、有折扣的产品
    final sortedProducts = [...allProducts]
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
    return handleListResponse(() async {
      if (useMockData) {
        final List<ProductModel> products = [];
        for (final id in productIds) {
          try {
            final product = await mockService.getProductById(id);
            products.add(product.data!);
          } catch (e) {
            // 如果产品不存在，继续获取下一个
            continue;
          }
        }
        return ApiResponseModel.success(products);
      } else {
        return apiService.post(
          '/api/products/batch',
          {'ids': productIds},
          (json) => List<ProductModel>.from(
            (json! as List).map(
              (item) => ProductModel.fromJson(item as Map<String, dynamic>),
            ),
          ),
        );
      }
    }, '批量获取产品');
  }
}
