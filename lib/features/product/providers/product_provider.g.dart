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
    r'51097d6cb1147fcf8637ec222408b156c40140c2';

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

/// 当前选中的产品分类

@ProviderFor(ProductCategory)
final productCategoryProvider = ProductCategoryProvider._();

/// 当前选中的产品分类
final class ProductCategoryProvider
    extends $NotifierProvider<ProductCategory, String> {
  /// 当前选中的产品分类
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
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$productCategoryHash() => r'0180c3a43f21860b248d1e6b77156a95bccca8aa';

/// 当前选中的产品分类

abstract class _$ProductCategory extends $Notifier<String> {
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

/// 获取指定设备的产品分类列表

@ProviderFor(productCategories)
final productCategoriesProvider = ProductCategoriesFamily._();

/// 获取指定设备的产品分类列表

final class ProductCategoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<String>>,
          List<String>,
          FutureOr<List<String>>
        >
    with $FutureModifier<List<String>>, $FutureProvider<List<String>> {
  /// 获取指定设备的产品分类列表
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
  $FutureProviderElement<List<String>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<String>> create(Ref ref) {
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

String _$productCategoriesHash() => r'7b8a005848245dfa60fb44c93bac496d26207dc2';

/// 获取指定设备的产品分类列表

final class ProductCategoriesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<String>>, String> {
  ProductCategoriesFamily._()
    : super(
        retry: null,
        name: r'productCategoriesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 获取指定设备的产品分类列表

  ProductCategoriesProvider call(String deviceId) =>
      ProductCategoriesProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'productCategoriesProvider';
}

/// 获取指定设备的产品列表（原始列表）

@ProviderFor(RawProducts)
final rawProductsProvider = RawProductsFamily._();

/// 获取指定设备的产品列表（原始列表）
final class RawProductsProvider
    extends $AsyncNotifierProvider<RawProducts, List<ProductModel>> {
  /// 获取指定设备的产品列表（原始列表）
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

String _$rawProductsHash() => r'5d891403dd1180243057ee33bcc2935ae00cf4fd';

/// 获取指定设备的产品列表（原始列表）

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

  RawProductsProvider call(String deviceId) =>
      RawProductsProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'rawProductsProvider';
}

/// 获取指定设备的产品列表（原始列表）

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
          AsyncValue<ProductModel>,
          ProductModel,
          FutureOr<ProductModel>
        >
    with $FutureModifier<ProductModel>, $FutureProvider<ProductModel> {
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
  $FutureProviderElement<ProductModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ProductModel> create(Ref ref) {
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

String _$productDetailHash() => r'0f665e63ac27dc3396b3e54f395e62ea51977f41';

/// 根据ID获取产品详情

final class ProductDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ProductModel>, String> {
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
