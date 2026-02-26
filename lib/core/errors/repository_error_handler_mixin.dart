import 'package:dio/dio.dart';
import 'package:lunchbox/core/errors/failure.dart';

/// Mixin for handling repository errors consistently across the application.
///
/// This mixin provides a standardized way to convert exceptions (especially [DioException])
/// into [Failure] objects, ensuring consistent error handling and avoiding duplicate
/// UI feedback (like toasts) when errors are already handled by interceptors.
mixin RepositoryErrorHandlerMixin {
  /// Handles errors caught in repository methods.
  ///
  /// Converts [DioException] and other exceptions into [Failure] objects.
  /// For [DioException], returns an empty message because the [ErrorHandlingInterceptor]
  /// already displays a toast message, preventing duplicate notifications.
  Failure handleError(Object error, StackTrace stackTrace) {
    if (error is Failure) {
      return error;
    }

    // DioException messages are already handled by ErrorHandlingInterceptor (toast shown)
    // We return an empty message here to prevent duplicate toasts in UI layer
    if (error is DioException) {
      return Failure.server(
        message: '',
        statusCode: error.response?.statusCode ?? 500,
      );
    }

    return Failure.server(message: error.toString(), statusCode: 500);
  }
}
