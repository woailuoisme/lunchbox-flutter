// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logging_interceptor.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Logging interceptor for Dio HTTP client.
///
/// This interceptor logs all HTTP requests, responses, and errors for debugging
/// and monitoring purposes. It provides detailed information about network calls
/// including headers, body, status codes, and timing.
///
/// **Validates: Requirements 23.1, 23.2**

@ProviderFor(loggingInterceptor)
final loggingInterceptorProvider = LoggingInterceptorProvider._();

/// Logging interceptor for Dio HTTP client.
///
/// This interceptor logs all HTTP requests, responses, and errors for debugging
/// and monitoring purposes. It provides detailed information about network calls
/// including headers, body, status codes, and timing.
///
/// **Validates: Requirements 23.1, 23.2**

final class LoggingInterceptorProvider
    extends
        $FunctionalProvider<
          LoggingInterceptor,
          LoggingInterceptor,
          LoggingInterceptor
        >
    with $Provider<LoggingInterceptor> {
  /// Logging interceptor for Dio HTTP client.
  ///
  /// This interceptor logs all HTTP requests, responses, and errors for debugging
  /// and monitoring purposes. It provides detailed information about network calls
  /// including headers, body, status codes, and timing.
  ///
  /// **Validates: Requirements 23.1, 23.2**
  LoggingInterceptorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loggingInterceptorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loggingInterceptorHash();

  @$internal
  @override
  $ProviderElement<LoggingInterceptor> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LoggingInterceptor create(Ref ref) {
    return loggingInterceptor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoggingInterceptor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoggingInterceptor>(value),
    );
  }
}

String _$loggingInterceptorHash() =>
    r'118c4b4eb66ba9f74769836c8c6987d5817c775a';
