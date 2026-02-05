import 'package:flutter_test/flutter_test.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';

void main() {
  group('ProductModel', () {
    final tProductModel = ProductModel(
      id: 'p1',
      name: 'Product 1',
      description: 'Description 1',
      price: 10,
      imageUrl: 'http://example.com/image.png',
      updateTime: DateTime.parse('2023-01-01T12:00:00.000'),
      stock: 10,
    );

    test('should be a subclass of ProductModel entity', () async {
      // assert
      expect(tProductModel, isA<ProductModel>());
    });

    test('fromJson should return a valid model', () async {
      // arrange
      final Map<String, dynamic> jsonMap = {
        'id': 'p1',
        'name': 'Product 1',
        'description': 'Description 1',
        'price': 10.0,
        'image_url': 'http://example.com/image.png',
        'update_time': '2023-01-01T12:00:00.000',
        'stock': 10,
        'category': 'food',
        'is_available': true,
        'is_hot': false,
        'is_promotion': false,
      };

      // act
      final result = ProductModel.fromJson(jsonMap);

      // assert
      expect(result, tProductModel);
    });

    test('toJson should return a JSON map containing proper data', () async {
      // act
      final result = tProductModel.toJson();

      // assert
      final expectedMap = {
        'id': 'p1',
        'name': 'Product 1',
        'description': 'Description 1',
        'price': 10.0,
        'image_url': 'http://example.com/image.png',
        'update_time': '2023-01-01T12:00:00.000',
        'stock': 10,
        'category': 'food',
        'is_available': true,
        'is_hot': false,
        'is_promotion': false,
        // Null fields are excluded by include_if_null: false in build.yaml
      };
      expect(result, expectedMap);
    });

    test('hasStock should return true when stock > 0', () async {
      expect(tProductModel.hasStock, true);
    });

    test('hasStock should return false when stock <= 0', () async {
      final outOfStockProduct = tProductModel.copyWith(stock: 0);
      expect(outOfStockProduct.hasStock, false);
    });

    test('discountPercentage should return correct percentage', () async {
      final discountedProduct = tProductModel.copyWith(
        price: 80,
        originalPrice: 100,
      );
      expect(discountedProduct.discountPercentage, 20);
    });
  });
}
