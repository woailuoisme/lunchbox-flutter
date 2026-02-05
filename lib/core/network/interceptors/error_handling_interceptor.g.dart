// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_handling_interceptor.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Error handling interceptor for Dio HTTP client.
///
/// This interceptor transforms DioExceptions into more user-friendly error
/// messages and handles common error scenarios like timeouts, connection
/// failures, and server errors.
///
/// **Validates: Requirements 23.1, 23.2**

@ProviderFor(errorHandlingInterceptor)
final errorHandlingInterceptorProvider = ErrorHandlingInterceptorProvider._();

/// Error handling interceptor for Dio HTTP client.
///
/// This interceptor transforms DioExceptions into more user-friendly error
/// messages and handles common error scenarios like timeouts, connection
/// failures, and server errors.
///
/// **Validates: Requirements 23.1, 23.2**

final class ErrorHandlingInterceptorProvider
    extends
        $FunctionalProvider<
          ErrorHandlingInterceptor,
          ErrorHandlingInterceptor,
          ErrorHandlingInterceptor
        >
    with $Provider<ErrorHandlingInterceptor> {
  /// Error handling interceptor for Dio HTTP client.
  ///
  /// This interceptor transforms DioExceptions into more user-friendly error
  /// messages and handles common error scenarios like timeouts, connection
  /// failures, and server errors.
  ///
  /// **Validates: Requirements 23.1, 23.2**
  ErrorHandlingInterceptorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'errorHandlingInterceptorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$errorHandlingInterceptorHash();

  @$internal
  @override
  $ProviderElement<ErrorHandlingInterceptor> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ErrorHandlingInterceptor create(Ref ref) {
    return errorHandlingInterceptor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ErrorHandlingInterceptor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ErrorHandlingInterceptor>(value),
    );
  }
}

String _$errorHandlingInterceptorHash() =>
    r'6373d0b89338ff73004e8b0469d17af81312be05';
