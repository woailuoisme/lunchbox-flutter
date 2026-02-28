import 'package:lunchbox/core/errors/failure.dart';
import 'package:lunchbox/features/product/datasources/product_rest_client.dart';
import 'package:lunchbox/features/product/entities/product_detail_model.dart';
import 'package:lunchbox/features/product/entities/category_product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository.g.dart';

@Riverpod(keepAlive: true)
ProductRepository productRepository(Ref ref) {
  final restClient = ref.watch(productRestClientProvider);
  return ProductRepository(restClient);
}

/// 产品仓库类
/// 负责处理自动售货机产品相关的数据访问和业务逻辑
class ProductRepository {
  ProductRepository(this._client);

  final ProductRestClient _client;

  /// 获取设备的所有产品分类（包含产品）
  Future<List<CategoryProductModel>> getDeviceProducts(String deviceId) async {
    final response = await _client.getDeviceProducts(deviceId: deviceId);
    return response.data ?? [];
  }

  /// 根据产品ID获取产品详情
  Future<ProductDetailModel> getProductById(String productId) async {
    final response = await _client.getProductDetail(productId);
    if (response.data != null) {
      return response.data!;
    }
    throw Failure.server(message: response.message, statusCode: response.code);
  }
}
