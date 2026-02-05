import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';
import 'package:lunchbox/features/product/providers/product_providers.dart';
import 'package:lunchbox/features/product/repositories/product_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([ProductRepository])
import 'product_providers_test.mocks.dart';

void main() {
  late MockProductRepository mockRepository;

  final tProduct1 = ProductModel(
    id: 'p1',
    name: 'Apple',
    description: 'Fresh apple',
    price: 5,
    imageUrl: 'url',
    updateTime: DateTime.now(),
    stock: 10,
    category: 'fruit',
  );

  final tProduct2 = ProductModel(
    id: 'p2',
    name: 'Banana',
    description: 'Sweet banana',
    price: 3,
    imageUrl: 'url',
    updateTime: DateTime.now(),
    category: 'fruit',
  );

  final tProducts = [tProduct1, tProduct2];

  ProviderContainer createContainer() {
    final container = ProviderContainer(
      overrides: [productRepositoryProvider.overrideWithValue(mockRepository)],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUp(() {
    mockRepository = MockProductRepository();
  });

  group('Product Providers', () {
    test(
      'productCategories should return categories from repository',
      () async {
        when(
          mockRepository.getProductCategories(any),
        ).thenAnswer((_) async => ['fruit', 'drink']);

        final container = createContainer();
        final categories = await container.read(
          productCategoriesProvider('d1').future,
        );

        expect(categories, ['all', 'fruit', 'drink']);
      },
    );

    test('rawProducts should return products from repository', () async {
      when(
        mockRepository.getProductsByDeviceId(any),
      ).thenAnswer((_) async => tProducts);

      final container = createContainer();
      final products = await container.read(rawProductsProvider('d1').future);

      expect(products, tProducts);
    });

    test('filteredProducts should filter by availability', () async {
      when(
        mockRepository.getProductsByDeviceId(any),
      ).thenAnswer((_) async => tProducts);

      final container = createContainer();

      // Default filter is available only = true
      final products = await container.read(
        filteredProductsProvider('d1').future,
      );
      expect(products.length, 1);
      expect(products.first, tProduct1);

      // Disable filter
      container.read(productFilterAvailableProvider.notifier).toggle();
      final allProducts = await container.read(
        filteredProductsProvider('d1').future,
      );
      expect(allProducts.length, 2);
    });

    test('filteredProducts should filter by search query', () async {
      when(
        mockRepository.getProductsByDeviceId(any),
      ).thenAnswer((_) async => tProducts);

      final container = createContainer();

      // Disable availability filter to search all
      container.read(productFilterAvailableProvider.notifier).toggle();

      container.read(productSearchQueryProvider.notifier).update('Banana');

      final products = await container.read(
        filteredProductsProvider('d1').future,
      );
      expect(products.length, 1);
      expect(products.first, tProduct2);
    });

    test('filteredProducts should sort by price asc', () async {
      when(
        mockRepository.getProductsByDeviceId(any),
      ).thenAnswer((_) async => tProducts);

      final container = createContainer();

      container.read(productFilterAvailableProvider.notifier).toggle();
      container.read(productSortProvider.notifier).update('price_asc');

      final products = await container.read(
        filteredProductsProvider('d1').future,
      );
      expect(products[0], tProduct2); // 3.0
      expect(products[1], tProduct1); // 5.0
    });
  });
}
