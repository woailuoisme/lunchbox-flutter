// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toast_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Toast 服务

@ProviderFor(toastService)
final toastServiceProvider = ToastServiceProvider._();

/// Toast 服务

final class ToastServiceProvider
    extends $FunctionalProvider<ToastService, ToastService, ToastService>
    with $Provider<ToastService> {
  /// Toast 服务
  ToastServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toastServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toastServiceHash();

  @$internal
  @override
  $ProviderElement<ToastService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ToastService create(Ref ref) {
    return toastService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ToastService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ToastService>(value),
    );
  }
}

String _$toastServiceHash() => r'8fbf9acda103799b54b6e0cfa30a31f330ba06fa';
