import 'package:flutter_test/flutter_test.dart';
import 'package:lunchbox/features/cart/entities/cart_item_model.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';

void main() {
  group('CartItemModel', () {
    final tProduct = ProductModel(
      id: 'p1',
      name: 'Product 1',
      description: 'Desc',
      price: 10,
      imageUrl: 'url',
      updateTime: DateTime.parse('2023-01-01T12:00:00.000'),
      stock: 10,
    );

    final tCartItem = CartItemModel(
      id: 'ci1',
      productId: 'p1',
      product: tProduct,
      addedTime: DateTime.parse('2023-01-01T12:00:00.000'),
      quantity: 2,
      deviceId: 'd1',
    );

    test('should be a subclass of CartItemModel entity', () async {
      expect(tCartItem, isA<CartItemModel>());
    });

    test('fromJson should return a valid model', () async {
      final Map<String, dynamic> jsonMap = {
        'id': 'ci1',
        'product_id': 'p1',
        'product': tProduct.toJson(),
        'added_time': '2023-01-01T12:00:00.000',
        'quantity': 2,
        'is_selected': true,
        'device_id': 'd1',
      };

      final result = CartItemModel.fromJson(jsonMap);
      expect(result, tCartItem);
    });

    test('toJson should return a JSON map containing proper data', () async {
      final result = tCartItem.toJson();
      final expectedMap = {
        'id': 'ci1',
        'product_id': 'p1',
        'product': tProduct.toJson(),
        'added_time': '2023-01-01T12:00:00.000',
        'quantity': 2,
        'is_selected': true,
        'device_id': 'd1',
      };
      expect(result, expectedMap);
    });

    test('subtotal should calculate correctly', () async {
      expect(tCartItem.subtotal, 20.0);
    });

    test('totalPrice should return subtotal when selected', () async {
      expect(tCartItem.totalPrice, 20.0);
    });

    test('totalPrice should return 0 when not selected', () async {
      final unselectedItem = tCartItem.copyWith(isSelected: false);
      expect(unselectedItem.totalPrice, 0.0);
    });
  });
}
