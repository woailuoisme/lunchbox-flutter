import 'package:flutter_test/flutter_test.dart';
import 'package:lunchbox/features/product/entities/product_model.dart';
import 'package:lunchbox/features/product/repositories/product_repository.dart';
import 'package:lunchbox/shared/models/api_response_model.dart';
import 'package:lunchbox/shared/services/api_provider.dart';
import 'package:lunchbox/shared/services/mock_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([ApiProvider, MockProvider])
import 'product_repository_test.mocks.dart';

void main() {
  late ProductRepository repository;
  late MockApiProvider mockApiProvider;
  late MockMockProvider mockMockProvider;

  setUp(() {
    mockApiProvider = MockApiProvider();
    mockMockProvider = MockMockProvider();
    repository = ProductRepository(
      mockApiProvider,
      mockMockProvider,
      useMockData: false,
    );
  });

  final tProductModel = ProductModel(
    id: 'p1',
    name: 'Product 1',
    description: 'Desc',
    price: 10,
    imageUrl: 'url',
    updateTime: DateTime.parse('2023-01-01T12:00:00.000'),
    stock: 10,
  );

  final tProductList = [tProductModel];

  group('getProductsByDeviceId', () {
    const tDeviceId = 'd1';

    test(
      'should return list of products when api call is successful',
      () async {
        // arrange
        final apiResponse = ApiResponseModel<List<ProductModel>>.success(
          tProductList,
        );

        when(
          mockApiProvider.get<List<ProductModel>>(any, any),
        ).thenAnswer((_) async => apiResponse);

        // act
        final result = await repository.getProductsByDeviceId(tDeviceId);

        // assert
        expect(result, tProductList);
        verify(
          mockApiProvider.get<List<ProductModel>>(
            '/api/devices/$tDeviceId/products',
            any,
          ),
        );
        verifyNoMoreInteractions(mockApiProvider);
      },
    );

    test('should throw exception when api call fails', () async {
      // arrange
      final apiResponse = ApiResponseModel<List<ProductModel>>.failure(
        'Server error',
      );

      when(
        mockApiProvider.get<List<ProductModel>>(any, any),
      ).thenAnswer((_) async => apiResponse);

      // act
      final call = repository.getProductsByDeviceId;

      // assert
      expect(() => call(tDeviceId), throwsException);
      verify(
        mockApiProvider.get<List<ProductModel>>(
          '/api/devices/$tDeviceId/products',
          any,
        ),
      );
    });
  });

  group('getProductById', () {
    const tProductId = 'p1';

    test('should return product when api call is successful', () async {
      // arrange
      final apiResponse = ApiResponseModel<ProductModel>.success(tProductModel);

      when(
        mockApiProvider.get<ProductModel>(any, any),
      ).thenAnswer((_) async => apiResponse);

      // act
      final result = await repository.getProductById(tProductId);

      // assert
      expect(result, tProductModel);
      verify(
        mockApiProvider.get<ProductModel>('/api/products/$tProductId', any),
      );
    });
  });

  group('updateProductStock', () {
    const tDeviceId = 'd1';
    const tProductId = 'p1';
    const tQuantity = 5;

    test('should return true when api call is successful', () async {
      // arrange
      final apiResponse = ApiResponseModel<bool>.success(true);

      when(
        mockApiProvider.post<bool>(any, any, any),
      ).thenAnswer((_) async => apiResponse);

      // act
      final result = await repository.updateProductStock(
        tDeviceId,
        tProductId,
        tQuantity,
      );

      // assert
      expect(result, true);
      verify(
        mockApiProvider.post<bool>(
          '/api/devices/$tDeviceId/products/$tProductId/stock',
          {'quantity': tQuantity},
          any,
        ),
      );
    });
  });
}
