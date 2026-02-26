import 'package:lunchbox/core/utils/logger_utils.dart';

/// 提供通用异步执行能力的 Mixin
///
/// 要求使用该 Mixin 的类必须具有 [state] 属性（如 Riverpod 的 Notifier）
/// 能够自动处理 [isLoading] 状态切换和统一的错误日志记录
mixin AsyncRunnerMixin<S> {
  /// 获取当前状态
  S get state;

  /// 设置新状态
  set state(S value);

  /// 通用的异步任务执行包装器
  ///
  /// [action] 要执行的异步操作
  /// [showLoading] 是否自动更新 state.isLoading
  /// [errorLabel] 发生错误时的日志前缀
  /// [loadingStateUpdater] 自定义如何更新 loading 状态，如果为 null 则尝试使用 dynamic 调用 copyWith
  Future<T?> runAsync<T>(
    Future<T> Function() action, {
    bool showLoading = true,
    String? errorLabel,
    S Function(S state, bool isLoading)? loadingStateUpdater,
  }) async {
    if (showLoading) {
      _setLoading(true, loadingStateUpdater);
    }

    try {
      final result = await action();
      return result;
    } catch (e, stack) {
      LoggerUtils.e(errorLabel ?? "操作失败", e, stack);
      rethrow;
    } finally {
      if (showLoading) {
        _setLoading(false, loadingStateUpdater);
      }
    }
  }

  void _setLoading(
    bool isLoading,
    S Function(S state, bool isLoading)? updater,
  ) {
    if (updater != null) {
      state = updater(state, isLoading);
    } else {
      try {
        // 尝试使用反射/动态调用 copyWith(isLoading: ...)
        // 这要求 State 类具有 isLoading 字段和 copyWith 方法
        state = (state as dynamic).copyWith(isLoading: isLoading) as S;
      } catch (e) {
        LoggerUtils.w(
          'AsyncRunnerMixin: State does not support copyWith(isLoading: $isLoading)',
        );
      }
    }
  }
}
