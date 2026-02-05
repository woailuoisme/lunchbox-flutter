import 'package:flutter_test/flutter_test.dart';
import 'package:lunchbox/core/services/storage_service.dart';
import 'package:lunchbox/features/cart/entities/cart_item_model.dart';
import 'package:lunchbox/features/order/entities/order_model.dart';
import 'package:lunchbox/features/order/repositories/order_repository.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';
import 'package:lunchbox/shared/models/api_response_model.dart';
import 'package:lunchbox/shared/services/api_provider.dart';
import 'package:lunchbox/shared/services/mock_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([ApiProvider, MockProvider, StorageService])
import 'order_repository_test.mocks.dart';

void main() {
  late OrderRepository repository;
  late MockApiProvider mockApiProvider;
  late MockMockProvider mockMockProvider;
  late MockStorageService mockStorageService;

  setUp(() {
    mockApiProvider = MockApiProvider();
    mockMockProvider = MockMockProvider();
    mockStorageService = MockStorageService();
    repository = OrderRepository(
      mockStorageService,
      mockApiProvider,
      mockMockProvider,
    );
  });

  final tProduct = ProductModel(
    id: 'p1',
    name: 'Burger',
    price: 20,
    imageUrl: 'url',
    description: 'Tasty',
    category: 'c1',
    stock: 10,
    updateTime: DateTime(2023),
  );

  final tCartItem = CartItemModel(
    id: 'ci1',
    productId: 'p1',
    quantity: 2,
    product: tProduct,
    addedTime: DateTime(2023),
  );

  final tOrder = OrderModel(
    id: 'o1',
    userId: 'u1',
    deviceId: 'd1',
    items: [],
    totalAmount: 40,
    paymentMethod: PaymentMethod.wechatPay,
    createdAt: DateTime(2023),
  );

  group('createOrder', () {
    test('should return order when api call is successful', () async {
      // arrange
      final apiResponse = ApiResponseModel<OrderModel>.success(tOrder);
      when(
        mockApiProvider.post<OrderModel>(any, any, any),
      ).thenAnswer((_) async => apiResponse);

      // act
      final result = await repository.createOrder(
        deviceId: 'd1',
        cartItems: [tCartItem],
        paymentMethod: 'wechat',
      );

      // assert
      expect(result, tOrder);
      verify(mockApiProvider.post<OrderModel>('/api/orders', any, any));
    });
  });

  group('getUserOrders', () {
    test('should return list of orders when api call is successful', () async {
      // arrange
      final apiResponse = ApiResponseModel<List<OrderModel>>.success([tOrder]);
      when(
        mockApiProvider.get<List<OrderModel>>(
          any,
          any,
          queryParameters: anyNamed('queryParameters'),
        ),
      ).thenAnswer((_) async => apiResponse);

      // act
      final result = await repository.getUserOrders();

      // assert
      expect(result, [tOrder]);
      verify(
        mockApiProvider.get<List<OrderModel>>(
          '/api/orders/my',
          any,
          queryParameters: anyNamed('queryParameters'),
        ),
      );
    });
  });
}
