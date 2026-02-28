// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 产品排序方式

@ProviderFor(ProductSort)
final productSortProvider = ProductSortProvider._();

/// 产品排序方式
final class ProductSortProvider extends $NotifierProvider<ProductSort, String> {
  /// 产品排序方式
  ProductSortProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productSortProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productSortHash();

  @$internal
  @override
  ProductSort create() => ProductSort();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$productSortHash() => r'6b1fa51548cccea89e5b66710c4a958e6e93be83';

/// 产品排序方式

abstract class _$ProductSort extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// 仅显示有货过滤

@ProviderFor(ProductFilterAvailable)
final productFilterAvailableProvider = ProductFilterAvailableProvider._();

/// 仅显示有货过滤
final class ProductFilterAvailableProvider
    extends $NotifierProvider<ProductFilterAvailable, bool> {
  /// 仅显示有货过滤
  ProductFilterAvailableProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productFilterAvailableProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productFilterAvailableHash();

  @$internal
  @override
  ProductFilterAvailable create() => ProductFilterAvailable();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$productFilterAvailableHash() =>
    r'fc47796c5a8ac40458c606cab219a682ca35eebd';

/// 仅显示有货过滤

abstract class _$ProductFilterAvailable extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// 产品搜索关键词

@ProviderFor(ProductSearchQuery)
final productSearchQueryProvider = ProductSearchQueryProvider._();

/// 产品搜索关键词
final class ProductSearchQueryProvider
    extends $NotifierProvider<ProductSearchQuery, String> {
  /// 产品搜索关键词
  ProductSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productSearchQueryHash();

  @$internal
  @override
  ProductSearchQuery create() => ProductSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$productSearchQueryHash() =>
    r'93d9af36560d846f0053a881a4a8c05edb0f0f7d';

/// 产品搜索关键词

abstract class _$ProductSearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// 当前选中的产品分类ID

@ProviderFor(ProductCategory)
final productCategoryProvider = ProductCategoryProvider._();

/// 当前选中的产品分类ID
final class ProductCategoryProvider
    extends $NotifierProvider<ProductCategory, int> {
  /// 当前选中的产品分类ID
  ProductCategoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productCategoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productCategoryHash();

  @$internal
  @override
  ProductCategory create() => ProductCategory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$productCategoryHash() => r'c4946ab7caf3e69c19c52c395e1d24516b1ce04a';

/// 当前选中的产品分类ID

abstract class _$ProductCategory extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// 获取指定设备的所有产品分类（包含产品）
/// 这是数据源的单一入口，其他Provider基于此派生

@ProviderFor(deviceCategoryProducts)
final deviceCategoryProductsProvider = DeviceCategoryProductsFamily._();

/// 获取指定设备的所有产品分类（包含产品）
/// 这是数据源的单一入口，其他Provider基于此派生

final class DeviceCategoryProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CategoryProductModel>>,
          List<CategoryProductModel>,
          FutureOr<List<CategoryProductModel>>
        >
    with
        $FutureModifier<List<CategoryProductModel>>,
        $FutureProvider<List<CategoryProductModel>> {
  /// 获取指定设备的所有产品分类（包含产品）
  /// 这是数据源的单一入口，其他Provider基于此派生
  DeviceCategoryProductsProvider._({
    required DeviceCategoryProductsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'deviceCategoryProductsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deviceCategoryProductsHash();

  @override
  String toString() {
    return r'deviceCategoryProductsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<CategoryProductModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CategoryProductModel>> create(Ref ref) {
    final argument = this.argument as String;
    return deviceCategoryProducts(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DeviceCategoryProductsProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deviceCategoryProductsHash() =>
    r'b294cfa992470e5bfc4a5b1fdb6ce46c355bdf34';

/// 获取指定设备的所有产品分类（包含产品）
/// 这是数据源的单一入口，其他Provider基于此派生

final class DeviceCategoryProductsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<CategoryProductModel>>,
          String
        > {
  DeviceCategoryProductsFamily._()
    : super(
        retry: null,
        name: r'deviceCategoryProductsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 获取指定设备的所有产品分类（包含产品）
  /// 这是数据源的单一入口，其他Provider基于此派生

  DeviceCategoryProductsProvider call(String deviceId) =>
      DeviceCategoryProductsProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'deviceCategoryProductsProvider';
}

/// 获取指定设备的产品分类列表
/// 包含一个虚拟的"全部"分类

@ProviderFor(productCategories)
final productCategoriesProvider = ProductCategoriesFamily._();

/// 获取指定设备的产品分类列表
/// 包含一个虚拟的"全部"分类

final class ProductCategoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CategoryProductModel>>,
          List<CategoryProductModel>,
          FutureOr<List<CategoryProductModel>>
        >
    with
        $FutureModifier<List<CategoryProductModel>>,
        $FutureProvider<List<CategoryProductModel>> {
  /// 获取指定设备的产品分类列表
  /// 包含一个虚拟的"全部"分类
  ProductCategoriesProvider._({
    required ProductCategoriesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'productCategoriesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productCategoriesHash();

  @override
  String toString() {
    return r'productCategoriesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<CategoryProductModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CategoryProductModel>> create(Ref ref) {
    final argument = this.argument as String;
    return productCategories(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductCategoriesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productCategoriesHash() => r'45eb1c11f04729b7549856a1c3759e57688cce22';

/// 获取指定设备的产品分类列表
/// 包含一个虚拟的"全部"分类

final class ProductCategoriesFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<CategoryProductModel>>,
          String
        > {
  ProductCategoriesFamily._()
    : super(
        retry: null,
        name: r'productCategoriesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 获取指定设备的产品分类列表
  /// 包含一个虚拟的"全部"分类

  ProductCategoriesProvider call(String deviceId) =>
      ProductCategoriesProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'productCategoriesProvider';
}

/// 获取指定设备的产品列表（原始列表）
/// 根据当前选中的分类筛选

@ProviderFor(RawProducts)
final rawProductsProvider = RawProductsFamily._();

/// 获取指定设备的产品列表（原始列表）
/// 根据当前选中的分类筛选
final class RawProductsProvider
    extends $AsyncNotifierProvider<RawProducts, List<ProductModel>> {
  /// 获取指定设备的产品列表（原始列表）
  /// 根据当前选中的分类筛选
  RawProductsProvider._({
    required RawProductsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'rawProductsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$rawProductsHash();

  @override
  String toString() {
    return r'rawProductsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RawProducts create() => RawProducts();

  @override
  bool operator ==(Object other) {
    return other is RawProductsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$rawProductsHash() => r'5008df2b48415cddec19b82f0f04af726b6c2c08';

/// 获取指定设备的产品列表（原始列表）
/// 根据当前选中的分类筛选

final class RawProductsFamily extends $Family
    with
        $ClassFamilyOverride<
          RawProducts,
          AsyncValue<List<ProductModel>>,
          List<ProductModel>,
          FutureOr<List<ProductModel>>,
          String
        > {
  RawProductsFamily._()
    : super(
        retry: null,
        name: r'rawProductsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 获取指定设备的产品列表（原始列表）
  /// 根据当前选中的分类筛选

  RawProductsProvider call(String deviceId) =>
      RawProductsProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'rawProductsProvider';
}

/// 获取指定设备的产品列表（原始列表）
/// 根据当前选中的分类筛选

abstract class _$RawProducts extends $AsyncNotifier<List<ProductModel>> {
  late final _$args = ref.$arg as String;
  String get deviceId => _$args;

  FutureOr<List<ProductModel>> build(String deviceId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<ProductModel>>, List<ProductModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ProductModel>>, List<ProductModel>>,
              AsyncValue<List<ProductModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

/// 过滤和排序后的产品列表

@ProviderFor(filteredProducts)
final filteredProductsProvider = FilteredProductsFamily._();

/// 过滤和排序后的产品列表

final class FilteredProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProductModel>>,
          List<ProductModel>,
          FutureOr<List<ProductModel>>
        >
    with
        $FutureModifier<List<ProductModel>>,
        $FutureProvider<List<ProductModel>> {
  /// 过滤和排序后的产品列表
  FilteredProductsProvider._({
    required FilteredProductsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'filteredProductsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$filteredProductsHash();

  @override
  String toString() {
    return r'filteredProductsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<ProductModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ProductModel>> create(Ref ref) {
    final argument = this.argument as String;
    return filteredProducts(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredProductsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$filteredProductsHash() => r'068cf433f3c88af078447f652133b1ea5217d3c1';

/// 过滤和排序后的产品列表

final class FilteredProductsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<ProductModel>>, String> {
  FilteredProductsFamily._()
    : super(
        retry: null,
        name: r'filteredProductsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 过滤和排序后的产品列表

  FilteredProductsProvider call(String deviceId) =>
      FilteredProductsProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'filteredProductsProvider';
}

/// 根据ID获取产品详情

@ProviderFor(productDetail)
final productDetailProvider = ProductDetailFamily._();

/// 根据ID获取产品详情

final class ProductDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProductDetailModel>,
          ProductDetailModel,
          FutureOr<ProductDetailModel>
        >
    with
        $FutureModifier<ProductDetailModel>,
        $FutureProvider<ProductDetailModel> {
  /// 根据ID获取产品详情
  ProductDetailProvider._({
    required ProductDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'productDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productDetailHash();

  @override
  String toString() {
    return r'productDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ProductDetailModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ProductDetailModel> create(Ref ref) {
    final argument = this.argument as String;
    return productDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productDetailHash() => r'b0b423b329fca1f9d4ecc3e57c129df55f5115eb';

/// 根据ID获取产品详情

final class ProductDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ProductDetailModel>, String> {
  ProductDetailFamily._()
    : super(
        retry: null,
        name: r'productDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 根据ID获取产品详情

  ProductDetailProvider call(String productId) =>
      ProductDetailProvider._(argument: productId, from: this);

  @override
  String toString() => r'productDetailProvider';
}
