import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lunchbox/features/device/entities/cart_item_model.dart';
import 'package:lunchbox/features/device/providers/cart_notifier.dart';
import 'package:lunchbox/features/device/repositories/cart_repository.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([CartRepository])
import 'cart_notifier_test.mocks.dart';

void main() {
  late MockCartRepository mockRepository;

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
    id: '1',
    productId: 'p1',
    product: tProduct,
    deviceId: 'd1',
    addedTime: DateTime.now(),
  );

  ProviderContainer createContainer() {
    final container = ProviderContainer(
      overrides: [cartRepositoryProvider.overrideWithValue(mockRepository)],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUp(() {
    mockRepository = MockCartRepository();
  });

  group('CartNotifier', () {
    test('initial state should be empty', () {
      when(mockRepository.getCartItems()).thenReturn([]);

      final container = createContainer();
      final state = container.read(cartProvider);

      expect(state.cartItems, isEmpty);
      expect(state.isLoading, false);
    });

    test('loadCart should update state with items', () async {
      when(mockRepository.getCartItems()).thenReturn([tCartItem]);

      final container = createContainer();

      // Trigger loadCart manually or wait for microtask
      await container.read(cartProvider.notifier).loadCart();

      final state = container.read(cartProvider);
      expect(state.cartItems.length, 1);
      expect(state.cartItems.first, tCartItem);
    });

    test('addToCart should call repository and reload', () async {
      when(mockRepository.getCartItems()).thenReturn([tCartItem]);

      final container = createContainer();
      final notifier = container.read(cartProvider.notifier);

      await notifier.addToCart(tProduct);

      verify(mockRepository.addToCart(tProduct));
      verify(mockRepository.getCartItems()); // Called by loadCart
    });

    test('increaseQuantity should update quantity', () async {
      when(mockRepository.getCartItems()).thenReturn([tCartItem]);

      final container = createContainer();
      final notifier = container.read(cartProvider.notifier);

      await notifier.increaseQuantity(tCartItem);

      verify(mockRepository.updateCartItemQuantity(tCartItem.id, 2));
    });

    test('decreaseQuantity should remove item if quantity is 1', () async {
      when(mockRepository.getCartItems()).thenReturn([]);

      final container = createContainer();
      final notifier = container.read(cartProvider.notifier);

      await notifier.decreaseQuantity(tCartItem); // quantity is 1

      verify(mockRepository.removeFromCart(tCartItem.id));
    });

    test('clearCart should clear repository', () async {
      when(mockRepository.getCartItems()).thenReturn([]);

      final container = createContainer();
      final notifier = container.read(cartProvider.notifier);

      await notifier.clearCart();

      verify(mockRepository.clearCart());
    });
  });
}
