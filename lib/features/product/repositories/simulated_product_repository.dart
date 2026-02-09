import 'package:fpdart/fpdart.dart';
import 'package:lunchbox/core/errors/errors.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';
import 'package:lunchbox/features/product/repositories/product_repository.dart';

/// 模拟产品仓库类
/// 用于测试和演示，返回硬编码的测试数据
class SimulatedProductRepository extends ProductRepository {
  SimulatedProductRepository(super.client);

  @override
  TaskEither<Failure, List<ProductModel>> getProductsByDeviceId(
    String deviceId,
  ) {
    // 根据设备ID返回对应的产品列表
    // 保持与 SimulatedDeviceRepository 中的数据一致
    final deviceProductIds = _deviceProductMap[deviceId];
    if (deviceProductIds == null) {
      // 如果设备不存在或没有特定配置，返回所有产品或空列表
      // 这里为了演示方便，默认返回所有产品
      return TaskEither.right(_mockProducts);
    }

    final products = _mockProducts
        .where((p) => deviceProductIds.contains(p.id))
        .toList();

    return TaskEither.right(products);
  }

  // 设备ID到产品ID列表的映射
  static final Map<String, List<String>> _deviceProductMap = {
    '1': ['p1', 'p2', 'p3', 'p4', 'p5'],
    '5': ['p1', 'p2', 'p3'],
    '2': ['p4', 'p5'],
    '10': ['p1', 'p3', 'p5'],
    '20': ['p2', 'p4'],
  };

  @override
  TaskEither<Failure, ProductModel> getProductById(String productId) {
    final product = _mockProducts.firstWhere(
      (p) => p.id == productId,
      orElse: () =>
          throw Failure.server(message: 'Product not found', statusCode: 404),
    );
    return TaskEither.right(product);
  }

  @override
  TaskEither<Failure, List<ProductModel>> getAvailableProducts(
    String deviceId,
  ) {
    return TaskEither.right(_mockProducts.where((p) => p.hasStock).toList());
  }

  @override
  TaskEither<Failure, List<ProductModel>> getDiscountProducts(String deviceId) {
    return TaskEither.right(_mockProducts.where((p) => p.hasDiscount).toList());
  }

  @override
  TaskEither<Failure, List<ProductModel>> getProductsByCategory(
    String deviceId,
    String category,
  ) {
    return TaskEither.right(
      _mockProducts.where((p) => p.category == category).toList(),
    );
  }

  @override
  TaskEither<Failure, List<String>> getProductCategories(String deviceId) {
    final categories = _mockProducts.map((p) => p.category).toSet().toList()
      ..sort();
    return TaskEither.right(categories);
  }

  @override
  TaskEither<Failure, List<ProductModel>> searchProducts(
    String deviceId,
    String keyword, {
    String? category,
  }) {
    var products = _mockProducts;
    if (category != null) {
      products = products.where((p) => p.category == category).toList();
    }

    final lowercaseKeyword = keyword.toLowerCase();
    final result = products
        .where((p) => p.name.toLowerCase().contains(lowercaseKeyword))
        .toList();

    return TaskEither.right(result);
  }

  // 模拟数据
  static final List<ProductModel> _mockProducts = [
    ProductModel(
      id: 'p1',
      name: '经典红烧牛肉面',
      description: '选用优质牛肉，文火慢炖，汤汁浓郁，面条劲道。',
      price: 18.0,
      imageUrl: 'https://example.com/beef_noodle.jpg',
      updateTime: DateTime.now(),
      stock: 10,
      category: '面食',
      isHot: true,
      monthlySales: 120,
      specifications: '大碗/微辣',
    ),
    ProductModel(
      id: 'p2',
      name: '宫保鸡丁盖饭',
      description: '传统川菜，鸡肉嫩滑，花生香脆，酸甜适口。',
      price: 22.0,
      originalPrice: 25.0,
      imageUrl: 'https://example.com/kung_pao_chicken.jpg',
      updateTime: DateTime.now(),
      stock: 5,
      category: '米饭',
      isPromotion: true,
      monthlySales: 85,
    ),
    ProductModel(
      id: 'p3',
      name: '鲜榨橙汁',
      description: '新鲜脐橙鲜榨，不加一滴水，补充维生素C。',
      price: 12.0,
      imageUrl: 'https://example.com/orange_juice.jpg',
      updateTime: DateTime.now(),
      stock: 20,
      category: '饮料',
      monthlySales: 200,
    ),
    ProductModel(
      id: 'p4',
      name: '日式照烧鸡腿饭',
      description: '鸡腿肉质鲜嫩，照烧汁浓郁入味，搭配时蔬。',
      price: 24.0,
      imageUrl: 'https://example.com/teriyaki_chicken.jpg',
      updateTime: DateTime.now(),
      stock: 0,
      // 已售罄
      category: '米饭',
      monthlySales: 150,
    ),
    ProductModel(
      id: 'p5',
      name: '麻辣香锅',
      description: '多种食材混搭，麻辣鲜香，下饭神器。',
      price: 28.0,
      originalPrice: 32.0,
      imageUrl: 'https://example.com/spicy_pot.jpg',
      updateTime: DateTime.now(),
      stock: 8,
      category: '特色菜',
      isHot: true,
      isPromotion: true,
      monthlySales: 90,
    ),
  ];
}
