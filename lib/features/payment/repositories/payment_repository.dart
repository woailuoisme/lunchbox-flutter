import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/models/api_response_model.dart';
import '../../../shared/services/api_provider.dart';
import '../../../shared/services/base_repository.dart';
import '../../../shared/services/mock_provider.dart';

part 'payment_repository.g.dart';

@Riverpod(keepAlive: true)
PaymentRepository paymentRepository(Ref ref) {
  final apiProvider = ref.watch(apiProviderProvider);
  final mockProvider = ref.watch(mockProviderProvider);
  return PaymentRepository(apiProvider, mockProvider);
}

/// 支付仓库类
/// 负责处理支付相关的数据访问和业务逻辑
class PaymentRepository extends BaseRepository {
  PaymentRepository(super.apiService, super.mockService, {super.useMockData});

  /// 创建支付意向 (Payment Intent)
  Future<Map<String, dynamic>> createPaymentIntent(
    String orderId,
    double amount,
    String currency,
  ) async {
    return handleResponse(() async {
      final paymentData = {
        'orderId': orderId,
        'amount': (amount * 100).toInt(), // Stripe uses cents
        'currency': currency,
      };

      if (useMockData) {
        // 返回模拟的 Stripe Payment Intent 数据
        await Future<void>.delayed(const Duration(milliseconds: 500));
        return ApiResponseModel.success({
          'paymentIntent': 'pi_mock_${DateTime.now().millisecondsSinceEpoch}',
          'ephemeralKey': 'ek_mock_${DateTime.now().millisecondsSinceEpoch}',
          'customer': 'cus_mock_${DateTime.now().millisecondsSinceEpoch}',
          'publishableKey': 'pk_test_mock',
        });
      } else {
        return apiService.post(
          '/api/orders/$orderId/payment/intent',
          paymentData,
          (json) =>
              (json! as Map<String, dynamic>)['data'] as Map<String, dynamic>,
        );
      }
    }, '创建支付意向');
  }

  /// 查询支付状态
  Future<String> checkPaymentStatus(String orderId, String paymentId) async {
    return handleResponse(() async {
      if (useMockData) {
        // 模拟支付状态查询
        // 随机返回支付结果，实际项目中应该根据真实的支付状态
        // 这里为了演示，假设有一定概率支付成功
        await Future<void>.delayed(const Duration(milliseconds: 300));
        return ApiResponseModel.success('success');
      } else {
        return apiService.get(
          '/api/orders/$orderId/payment/status',
          (json) => (json! as Map<String, dynamic>)['data']['status'] as String,
          queryParameters: {'paymentId': paymentId},
        );
      }
    }, '查询支付状态');
  }

  /// 取消支付
  Future<bool> cancelPayment(String orderId) async {
    return handleResponse(() async {
      if (useMockData) {
        await Future<void>.delayed(const Duration(milliseconds: 300));
        return ApiResponseModel.success(true);
      } else {
        return apiService.post(
          '/api/orders/$orderId/payment/cancel',
          <String, dynamic>{},
          (json) => (json! as Map<String, dynamic>)['data'] as bool,
        );
      }
    }, '取消支付');
  }
}
