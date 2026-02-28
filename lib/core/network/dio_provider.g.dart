// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides a configured Dio instance for HTTP requests.
///
/// This provider creates a Dio client with:
/// - Base URL and timeout configurations
/// - Connectivity interceptor to check for network before requests
/// - Authentication interceptor for token management
/// - PrettyDioLogger for debugging (controlled by AppConstants.dioDebug)
/// - Error handling interceptor for user-friendly error messages
///
/// The provider is kept alive to maintain a single Dio instance throughout
/// the app lifecycle for better performance and connection pooling.
///
/// **Validates: Requirements 23.1, 23.2**

@ProviderFor(dio)
final dioProvider = DioProvider._();

/// Provides a configured Dio instance for HTTP requests.
///
/// This provider creates a Dio client with:
/// - Base URL and timeout configurations
/// - Connectivity interceptor to check for network before requests
/// - Authentication interceptor for token management
/// - PrettyDioLogger for debugging (controlled by AppConstants.dioDebug)
/// - Error handling interceptor for user-friendly error messages
///
/// The provider is kept alive to maintain a single Dio instance throughout
/// the app lifecycle for better performance and connection pooling.
///
/// **Validates: Requirements 23.1, 23.2**

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  /// Provides a configured Dio instance for HTTP requests.
  ///
  /// This provider creates a Dio client with:
  /// - Base URL and timeout configurations
  /// - Connectivity interceptor to check for network before requests
  /// - Authentication interceptor for token management
  /// - PrettyDioLogger for debugging (controlled by AppConstants.dioDebug)
  /// - Error handling interceptor for user-friendly error messages
  ///
  /// The provider is kept alive to maintain a single Dio instance throughout
  /// the app lifecycle for better performance and connection pooling.
  ///
  /// **Validates: Requirements 23.1, 23.2**
  DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'281fbcc121716c905098950da7070f681b512717';
