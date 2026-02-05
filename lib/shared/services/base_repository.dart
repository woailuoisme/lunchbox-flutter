import '../../core/utils/logger_utils.dart';
import '../models/api_response_model.dart';
import 'api_provider.dart';
import 'mock_provider.dart';

/// 基础仓库类
/// 提供通用的数据访问和业务逻辑处理功能
abstract class BaseRepository {
  /// 构造函数
  BaseRepository(
    this.apiService,
    this.mockService, {
    this.useMockData = true, // 默认使用 Mock 数据，生产环境改为 false
  });
  final ApiProvider apiService;
  final MockProvider mockService;

  /// 是否使用Mock数据
  final bool useMockData;

  /// 处理API响应
  Future<T> handleResponse<T>(
    Future<ApiResponseModel<T>> Function() request,
    String operationName,
  ) async {
    try {
      LoggerUtils.d('开始操作: $operationName');
      final response = await request();

      if (response.isSuccess && response.data != null) {
        LoggerUtils.d('操作成功: $operationName');
        return response.data!;
      } else {
        LoggerUtils.e('操作失败: $operationName, 错误: ${response.message}');
        throw Exception(response.message);
      }
    } catch (e) {
      LoggerUtils.e('操作异常: $operationName, 异常: $e');
      rethrow;
    }
  }

  /// 处理列表类型的API响应
  Future<List<T>> handleListResponse<T>(
    Future<ApiResponseModel<List<T>>> Function() request,
    String operationName,
  ) async {
    try {
      LoggerUtils.d('开始列表操作: $operationName');
      final response = await request();

      if (response.isSuccess && response.data != null) {
        LoggerUtils.d('列表操作成功: $operationName, 数量: ${response.data!.length}');
        return response.data!;
      } else {
        LoggerUtils.e('列表操作失败: $operationName, 错误: ${response.message}');
        throw Exception(response.message);
      }
    } catch (e) {
      LoggerUtils.e('列表操作异常: $operationName, 异常: $e');
      rethrow;
    }
  }

  /// 检查网络连接
  Future<bool> checkNetwork() async {
    // 在实际项目中，这里应该实现真实的网络连接检查
    // 这里简化处理，返回true
    return true;
  }

  /// 重试机制
  Future<T> retry<T>(Future<T> Function() action, {int maxRetries = 3}) async {
    int attempts = 0;

    while (true) {
      try {
        return await action();
      } catch (e) {
        attempts++;
        if (attempts >= maxRetries) {
          rethrow;
        }

        // 等待一段时间后重试
        final delay = Duration(milliseconds: 1000 * attempts);
        LoggerUtils.d('操作失败，$delay 后重试...');
        await Future<void>.delayed(delay);
      }
    }
  }
}
