import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/storage_service.dart';
import '../../../core/values/app_constants.dart';
import '../../../shared/models/api_response_model.dart';
import '../../../shared/services/api_provider.dart';
import '../../../shared/services/base_repository.dart';
import '../../../shared/services/mock_provider.dart';
import '../../cart/entities/cart_item_model.dart';
import '../entities/order_model.dart';

part 'order_repository.g.dart';

@Riverpod(keepAlive: true)
OrderRepository orderRepository(Ref ref) {
  final storageService = ref.watch(storageServiceProvider);
  final apiProvider = ref.watch(apiProviderProvider);
  final mockProvider = ref.watch(mockProviderProvider);
  return OrderRepository(storageService, apiProvider, mockProvider);
}

/// 订单仓库类
/// 负责处理订单相关的数据访问和业务逻辑
class OrderRepository extends BaseRepository {
  OrderRepository(
    this._storageService,
    ApiProvider apiProvider,
    MockProvider mockProvider,
  ) : super(apiProvider, mockProvider);
  final StorageService _storageService;

  /// 创建订单
  Future<OrderModel> createOrder({
    required String deviceId,
    required List<CartItemModel> cartItems,
    required String paymentMethod,
    String? remark,
  }) async {
    return handleResponse(() async {
      final orderData = <String, dynamic>{
        'deviceId': deviceId,
        'items': cartItems
            .map(
              (item) => <String, dynamic>{
                'productId': item.productId,
                'quantity': item.quantity,
                'price': item.product.price,
              },
            )
            .toList(),
        'paymentMethod': paymentMethod,
        'remark': remark,
        'totalAmount': cartItems.fold<double>(
          0,
          (total, item) => total + item.totalPrice,
        ),
      };

      if (useMockData) {
        final userId =
            _storageService.read<String>(AppConstants.keyUserId) ?? 'user_1';
        final method = paymentMethod == 'wechat'
            ? PaymentMethod.wechatPay
            : PaymentMethod.alipay;

        return mockService.createOrder(
          userId,
          deviceId,
          (orderData['items']! as List).cast<Map<String, dynamic>>(),
          method,
        );
      } else {
        return apiService.post(
          '/api/orders',
          orderData,
          (json) => OrderModel.fromJson(
            (json! as Map<String, dynamic>)['data'] as Map<String, dynamic>,
          ),
        );
      }
    }, '创建订单');
  }

  /// 获取用户的订单列表
  Future<List<OrderModel>> getUserOrders({
    int page = 1,
    int pageSize = 10,
    String? status,
  }) async {
    return handleListResponse(() async {
      final params = {'page': page, 'pageSize': pageSize, 'status': ?status};

      if (useMockData) {
        return mockService.getUserOrders(params);
      } else {
        return apiService.get(
          '/api/orders',
          (json) => List<OrderModel>.from(
            ((json! as Map<String, dynamic>)['data'] as List).map(
              (item) => OrderModel.fromJson(item as Map<String, dynamic>),
            ),
          ),
          queryParameters: params,
        );
      }
    }, '获取用户订单');
  }

  /// 根据订单ID获取订单详情
  Future<OrderModel> getOrderById(String orderId) async {
    return handleResponse(() async {
      if (useMockData) {
        return mockService.getOrderById(orderId);
      } else {
        return apiService.get(
          '/api/orders/$orderId',
          (json) => OrderModel.fromJson(
            (json! as Map<String, dynamic>)['data'] as Map<String, dynamic>,
          ),
        );
      }
    }, '获取订单详情');
  }

  /// 取消订单
  Future<bool> cancelOrder(String orderId) async {
    return handleResponse(() async {
      if (useMockData) {
        // 在Mock数据中模拟取消订单
        return ApiResponseModel.success(true);
      } else {
        return apiService.put(
          '/api/orders/$orderId/cancel',
          <String, dynamic>{},
          (json) => json['data'] as bool,
        );
      }
    }, '取消订单');
  }

  /// 支付订单
  Future<Map<String, dynamic>> payOrder(
    String orderId,
    String paymentMethod,
  ) async {
    return handleResponse(() async {
      final paymentData = {'paymentMethod': paymentMethod};

      if (useMockData) {
        // 返回模拟的支付信息
        final paymentInfo = {
          'paymentUrl': 'https://mock.payment.url/pay/$orderId',
          'paymentId': 'mock_payment_${DateTime.now().millisecondsSinceEpoch}',
          'status': 'pending',
        };
        return ApiResponseModel.success(paymentInfo);
      } else {
        return apiService.post(
          '/api/orders/$orderId/pay',
          paymentData,
          (json) =>
              (json! as Map<String, dynamic>)['data'] as Map<String, dynamic>,
        );
      }
    }, '支付订单');
  }

  /// 查询订单支付状态
  Future<String> checkPaymentStatus(String orderId, String paymentId) async {
    return handleResponse(() async {
      if (useMockData) {
        // 模拟支付状态查询
        // 随机返回支付结果，实际项目中应该根据真实的支付状态
        final random = Random();
        final statuses = ['pending', 'success', 'failed'];
        final mockStatus = statuses[random.nextInt(3)];
        return ApiResponseModel.success(mockStatus);
      } else {
        return apiService.get(
          '/api/orders/$orderId/payment/status',
          (json) => (json! as Map<String, dynamic>)['data']['status'] as String,
          queryParameters: {'paymentId': paymentId},
        );
      }
    }, '查询支付状态');
  }

  /// 获取设备的订单统计
  Future<Map<String, dynamic>> getDeviceOrderStatistics(String deviceId) async {
    return handleResponse(() async {
      if (useMockData) {
        // 返回模拟的统计数据
        final stats = {
          'todayOrders': Random().nextInt(100) + 50,
          'todaySales': (Random().nextInt(5000) + 2000).toDouble(),
          'thisWeekOrders': Random().nextInt(500) + 300,
          'thisWeekSales': (Random().nextInt(20000) + 10000).toDouble(),
          'topProducts': List.generate(
            5,
            (index) => {
              'productId': 'product_$index',
              'productName': '热门商品 $index',
              'sales': Random().nextInt(100) + 20,
              'revenue': (Random().nextInt(1000) + 200).toDouble(),
            },
          ),
        };
        return ApiResponseModel.success(stats);
      } else {
        return apiService.get(
          '/api/devices/$deviceId/orders/statistics',
          (json) =>
              (json! as Map<String, dynamic>)['data'] as Map<String, dynamic>,
        );
      }
    }, '获取设备订单统计');
  }

  /// 重新下单（基于历史订单）
  Future<OrderModel> reorder(String orderId) async {
    final originalOrder = await getOrderById(orderId);

    // 构建购物车项
    final cartItems = originalOrder.items
        .map(
          (item) => CartItemModel(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            productId: item.productId,
            product: item.product,
            quantity: item.quantity,
            deviceId: originalOrder.deviceId,
            addedTime: DateTime.now(),
          ),
        )
        .toList();

    // 创建新订单
    return createOrder(
      deviceId: originalOrder.deviceId,
      cartItems: cartItems,
      paymentMethod: originalOrder.paymentMethod == PaymentMethod.wechatPay
          ? 'wechat'
          : 'alipay',
      remark: originalOrder.remark,
    );
  }
}
