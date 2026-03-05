import 'package:lunchbox/features/product/entities/product_detail_model.dart';
import 'package:lunchbox/features/product/entities/category_product_model.dart';
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
  bool build() => false; // Default to false to show all products initially

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

/// 当前选中的产品分类ID
@riverpod
class ProductCategory extends _$ProductCategory {
  @override
  int build() => -1; // -1 represents 'all'

  // ignore: use_setters_to_change_properties
  void update(int categoryId) => state = categoryId;
}

/// 获取指定设备的所有产品分类（包含产品）
/// 这是数据源的单一入口，其他Provider基于此派生
@riverpod
Future<List<CategoryProductModel>> deviceCategoryProducts(
  Ref ref,
  String deviceId,
) async {
  ref.keepAlive();
  final repository = ref.watch(productRepositoryProvider);
  return repository.getDeviceProducts(deviceId);
}

/// 获取指定设备的产品分类列表
/// 包含一个虚拟的"全部"分类
@riverpod
Future<List<CategoryProductModel>> productCategories(
  Ref ref,
  String deviceId,
) async {
  ref.keepAlive();
  try {
    final categories = await ref.watch(
      deviceCategoryProductsProvider(deviceId).future,
    );
    // Add a virtual 'All' category at the beginning
    return [
      const CategoryProductModel(
        id: -1,
        name: 'all', // This will be handled in UI for localization
        thumb: '',
        order: -1,
        products: [],
      ),
      ...categories,
    ];
  } catch (_) {
    return [
      const CategoryProductModel(
        id: -1,
        name: 'all',
        thumb: '',
        order: -1,
        products: [],
      ),
    ];
  }
}

/// 获取指定设备的产品列表（原始列表）
/// 根据当前选中的分类筛选
@riverpod
class RawProducts extends _$RawProducts {
  @override
  Future<List<ProductModel>> build(String deviceId) async {
    final categoryId = ref.watch(productCategoryProvider);

    final categories = await ref.watch(
      deviceCategoryProductsProvider(deviceId).future,
    );

    if (categoryId == -1) {
      return categories.expand((c) => c.products).toList();
    }

    return categories
        .firstWhere(
          (c) => c.id == categoryId,
          orElse: () => const CategoryProductModel(
            id: 0,
            name: '',
            thumb: '',
            order: 0,
            products: [],
          ),
        )
        .products;
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
Future<ProductDetailModel?> productDetail(Ref ref, String productId) async {
  ref.keepAlive();
  final repository = ref.watch(productRepositoryProvider);
  return repository.getProductById(productId);
}
