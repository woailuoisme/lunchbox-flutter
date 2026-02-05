import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:lunchbox/core/services/storage_service.dart';
import 'package:lunchbox/features/cart/entities/cart_item_model.dart';
import 'package:lunchbox/features/cart/repositories/cart_repository.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';
import 'package:lunchbox/shared/services/api_provider.dart';
import 'package:lunchbox/shared/services/mock_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([StorageService, ApiProvider, MockProvider])
import 'cart_repository_test.mocks.dart';

void main() {
  late CartRepository repository;
  late MockStorageService mockStorage;
  late MockApiProvider mockApiProvider;
  late MockMockProvider mockMockProvider;

  setUp(() {
    mockStorage = MockStorageService();
    mockApiProvider = MockApiProvider();
    mockMockProvider = MockMockProvider();
    repository = CartRepository(mockStorage, mockApiProvider, mockMockProvider);
  });

  final tProduct = ProductModel(
    id: 'p1',
    name: 'Product 1',
    description: 'Desc',
    price: 10,
    imageUrl: 'url',
    updateTime: DateTime.now(),
    stock: 10,
  );

  final tCartItem = CartItemModel(
    id: '1234567890',
    productId: 'p1',
    product: tProduct,
    deviceId: 'd1',
    addedTime: DateTime.now(),
  );

  group('CartRepository', () {
    test('getCartItems should return empty list when storage is empty', () {
      when(mockStorage.read<String>(any)).thenReturn(null);

      final result = repository.getCartItems();

      expect(result, isEmpty);
      verify(mockStorage.read<String>(CartRepository.cartStorageKey));
    });

    test(
      'getCartItems should return list of cart items when storage has data',
      () {
        final jsonList = [tCartItem.toJson()];
        final jsonString = jsonEncode(jsonList);

        when(mockStorage.read<String>(any)).thenReturn(jsonString);

        final result = repository.getCartItems();

        expect(result.length, 1);
        expect(result.first.productId, tCartItem.productId);
      },
    );

    test('addToCart should add new item when product not in cart', () {
      when(mockStorage.read<String>(any)).thenReturn(null);
      when(
        mockStorage.read<String>(CartRepository.currentDeviceKey),
      ).thenReturn('d1');

      repository.addToCart(tProduct);

      verify(mockStorage.write(CartRepository.cartStorageKey, any));
    });

    test('addToCart should update quantity when product already in cart', () {
      final jsonList = [tCartItem.toJson()];
      final jsonString = jsonEncode(jsonList);

      when(
        mockStorage.read<String>(CartRepository.cartStorageKey),
      ).thenReturn(jsonString);

      repository.addToCart(tProduct);

      // Should be called with list containing item with quantity 2
      final captured = verify(
        mockStorage.write(CartRepository.cartStorageKey, captureAny),
      ).captured;
      final savedJson = captured.first as String;
      final savedList = jsonDecode(savedJson) as List;
      expect(savedList.length, 1);
      expect(savedList.first['quantity'], 2);
    });

    test('removeFromCart should remove item from cart', () {
      final jsonList = [tCartItem.toJson()];
      final jsonString = jsonEncode(jsonList);

      when(
        mockStorage.read<String>(CartRepository.cartStorageKey),
      ).thenReturn(jsonString);

      repository.removeFromCart(tCartItem.id);

      final captured = verify(
        mockStorage.write(CartRepository.cartStorageKey, captureAny),
      ).captured;
      final savedJson = captured.first as String;
      final savedList = jsonDecode(savedJson) as List;
      expect(savedList, isEmpty);
    });

    test('updateCartItemQuantity should update quantity', () {
      final jsonList = [tCartItem.toJson()];
      final jsonString = jsonEncode(jsonList);

      when(
        mockStorage.read<String>(CartRepository.cartStorageKey),
      ).thenReturn(jsonString);

      repository.updateCartItemQuantity(tCartItem.id, 5);

      final captured = verify(
        mockStorage.write(CartRepository.cartStorageKey, captureAny),
      ).captured;
      final savedJson = captured.first as String;
      final savedList = jsonDecode(savedJson) as List;
      expect(savedList.first['quantity'], 5);
    });

    test('clearCart should remove storage key', () {
      repository.clearCart();
      verify(mockStorage.remove(CartRepository.cartStorageKey));
    });
  });
}
