import 'package:lunchbox/core/errors/failure.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';
import 'package:lunchbox/features/product/repositories/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

/// 产品排序方式
@riverpod
class ProductSort extends _$ProductSort {
  @override
  String build() => 'default';

  // ignore: use_setters_to_change_properties
  void update(String sort) => state = sort;
}

/// 仅显示有货过滤
@riverpod
class ProductFilterAvailable extends _$ProductFilterAvailable {
  @override
  bool build() => true;

  void toggle() => state = !state;
}

/// 产品搜索关键词
@riverpod
class ProductSearchQuery extends _$ProductSearchQuery {
  @override
  String build() => '';

  // ignore: use_setters_to_change_properties
  void update(String query) => state = query;
}

/// 当前选中的产品分类
@riverpod
class ProductCategory extends _$ProductCategory {
  @override
  String build() => 'all';

  // ignore: use_setters_to_change_properties
  void update(String category) => state = category;
}

/// 获取指定设备的产品分类列表
@riverpod
Future<List<String>> productCategories(Ref ref, String deviceId) async {
  ref.keepAlive();
  final repository = ref.watch(productRepositoryProvider);
  try {
    final List<String> categories = await repository.getProductCategories(
      deviceId,
    );
    return <String>['all', ...categories];
  } catch (_) {
    return <String>['all'];
  }
}

/// 获取指定设备的产品列表（原始列表）
@riverpod
class RawProducts extends _$RawProducts {
  @override
  Future<List<ProductModel>> build(String deviceId) async {
    final repository = ref.watch(productRepositoryProvider);
    final category = ref.watch(productCategoryProvider);

    try {
      final List<ProductModel> products = await (category != 'all'
          ? repository.getProductsByCategory(deviceId, category)
          : repository.getProductsByDeviceId(deviceId));
      return products;
    } catch (e) {
      if (e is Failure) {
        final String message = e.when(
          network: (msg, _) => msg,
          server: (msg, _) => msg,
          cache: (msg) => msg,
          notFound: (res) => 'Resource not found: $res',
          unauthorized: () => 'Unauthorized access',
          validation: (msg, _) => msg,
        );
        throw Exception(message);
      }
      rethrow;
    }
  }
}

/// 过滤和排序后的产品列表
@riverpod
Future<List<ProductModel>> filteredProducts(Ref ref, String deviceId) async {
  final products = await ref.watch(rawProductsProvider(deviceId).future);
  final sort = ref.watch(productSortProvider);
  final availableOnly = ref.watch(productFilterAvailableProvider);
  final query = ref.watch(productSearchQueryProvider);

  var filtered = List<ProductModel>.from(products);

  // 过滤：有货
  if (availableOnly) {
    filtered = filtered.where((p) => p.hasStock).toList();
  }

  // 过滤：搜索关键词
  if (query.isNotEmpty) {
    final lowercaseQuery = query.toLowerCase();
    filtered = filtered
        .where((p) => p.name.toLowerCase().contains(lowercaseQuery))
        .toList();
  }

  // 排序
  if (sort == 'price_asc') {
    filtered.sort((a, b) => a.price.compareTo(b.price));
  } else if (sort == 'price_desc') {
    filtered.sort((a, b) => b.price.compareTo(a.price));
  } else if (sort == 'name') {
    filtered.sort((a, b) => a.name.compareTo(b.name));
  }

  return filtered;
}

/// 根据ID获取产品详情
@riverpod
Future<ProductModel> productDetail(Ref ref, String productId) async {
  ref.keepAlive();
  final repository = ref.watch(productRepositoryProvider);
  try {
    final ProductModel product = await repository.getProductById(productId);
    return product;
  } catch (e) {
    if (e is Failure) {
      final String message = e.when(
        network: (msg, _) => msg,
        server: (msg, _) => msg,
        cache: (msg) => msg,
        notFound: (res) => 'Resource not found: $res',
        unauthorized: () => 'Unauthorized access',
        validation: (msg, _) => msg,
      );
      throw Exception(message);
    }
    rethrow;
  }
}
