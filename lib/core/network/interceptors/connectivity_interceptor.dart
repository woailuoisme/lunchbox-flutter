import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:lunchbox/core/services/toast_service.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_interceptor.g.dart';

/// Interceptor that checks for network connectivity before making a request.
///
/// If there is no internet connection, it throws a [DioException] with a
/// user-friendly error message and shows a toast.
@Riverpod(keepAlive: true)
ConnectivityInterceptor connectivityInterceptor(Ref ref) {
  return ConnectivityInterceptor(ref);
}

class ConnectivityInterceptor extends Interceptor {
  ConnectivityInterceptor(this._ref);

  final Ref _ref;
  final Connectivity _connectivity = Connectivity();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final connectivityResult = await _connectivity.checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      final errorMessage = t.network.errors.connectionError;

      // Show toast message
      _ref.read(toastServiceProvider).showError(errorMessage);

      return handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          message: errorMessage,
        ),
      );
    }

    return handler.next(options);
  }
}
