// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_interceptor.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Authentication interceptor for Dio HTTP client.
///
/// This interceptor automatically adds authentication tokens to outgoing requests
/// and handles token refresh when receiving 401 Unauthorized responses.
///
/// **Validates: Requirements 23.1, 23.2**

@ProviderFor(authInterceptor)
final authInterceptorProvider = AuthInterceptorProvider._();

/// Authentication interceptor for Dio HTTP client.
///
/// This interceptor automatically adds authentication tokens to outgoing requests
/// and handles token refresh when receiving 401 Unauthorized responses.
///
/// **Validates: Requirements 23.1, 23.2**

final class AuthInterceptorProvider
    extends
        $FunctionalProvider<AuthInterceptor, AuthInterceptor, AuthInterceptor>
    with $Provider<AuthInterceptor> {
  /// Authentication interceptor for Dio HTTP client.
  ///
  /// This interceptor automatically adds authentication tokens to outgoing requests
  /// and handles token refresh when receiving 401 Unauthorized responses.
  ///
  /// **Validates: Requirements 23.1, 23.2**
  AuthInterceptorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authInterceptorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authInterceptorHash();

  @$internal
  @override
  $ProviderElement<AuthInterceptor> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthInterceptor create(Ref ref) {
    return authInterceptor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthInterceptor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthInterceptor>(value),
    );
  }
}

String _$authInterceptorHash() => r'ed229bc74053c6c1b45fa5105fbaee462e35ce2b';
