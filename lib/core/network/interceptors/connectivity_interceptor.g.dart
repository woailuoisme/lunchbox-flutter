// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_interceptor.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Interceptor that checks for network connectivity before making a request.
///
/// If there is no internet connection, it throws a [DioException] with a
/// user-friendly error message and shows a toast.

@ProviderFor(connectivityInterceptor)
final connectivityInterceptorProvider = ConnectivityInterceptorProvider._();

/// Interceptor that checks for network connectivity before making a request.
///
/// If there is no internet connection, it throws a [DioException] with a
/// user-friendly error message and shows a toast.

final class ConnectivityInterceptorProvider
    extends
        $FunctionalProvider<
          ConnectivityInterceptor,
          ConnectivityInterceptor,
          ConnectivityInterceptor
        >
    with $Provider<ConnectivityInterceptor> {
  /// Interceptor that checks for network connectivity before making a request.
  ///
  /// If there is no internet connection, it throws a [DioException] with a
  /// user-friendly error message and shows a toast.
  ConnectivityInterceptorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectivityInterceptorProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectivityInterceptorHash();

  @$internal
  @override
  $ProviderElement<ConnectivityInterceptor> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ConnectivityInterceptor create(Ref ref) {
    return connectivityInterceptor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConnectivityInterceptor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConnectivityInterceptor>(value),
    );
  }
}

String _$connectivityInterceptorHash() =>
    r'396a2c2ee04196dba86d8fc212e8e7ac87284f1f';
