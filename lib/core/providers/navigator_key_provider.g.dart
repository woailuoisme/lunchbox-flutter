// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigator_key_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 全局 Navigator Key Provider
///
/// 提供应用级别的 GlobalKey NavigatorState，用于在没有 BuildContext 的情况下
/// 访问导航和显示对话框、Toast 等功能。

@ProviderFor(navigatorKey)
final navigatorKeyProvider = NavigatorKeyProvider._();

/// 全局 Navigator Key Provider
///
/// 提供应用级别的 GlobalKey NavigatorState，用于在没有 BuildContext 的情况下
/// 访问导航和显示对话框、Toast 等功能。

final class NavigatorKeyProvider
    extends
        $FunctionalProvider<
          GlobalKey<NavigatorState>,
          GlobalKey<NavigatorState>,
          GlobalKey<NavigatorState>
        >
    with $Provider<GlobalKey<NavigatorState>> {
  /// 全局 Navigator Key Provider
  ///
  /// 提供应用级别的 GlobalKey NavigatorState，用于在没有 BuildContext 的情况下
  /// 访问导航和显示对话框、Toast 等功能。
  NavigatorKeyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'navigatorKeyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$navigatorKeyHash();

  @$internal
  @override
  $ProviderElement<GlobalKey<NavigatorState>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GlobalKey<NavigatorState> create(Ref ref) {
    return navigatorKey(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GlobalKey<NavigatorState> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GlobalKey<NavigatorState>>(value),
    );
  }
}

String _$navigatorKeyHash() => r'6e9d7249fe86101ea2092a8617d10993370d5975';
