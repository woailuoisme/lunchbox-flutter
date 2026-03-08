// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 首页数据管理器
/// 职责：聚合首页所需的所有并发加载数据，并利用 AsyncValue 处理加载/错误状态

@ProviderFor(HomeNotifier)
final homeProvider = HomeNotifierProvider._();

/// 首页数据管理器
/// 职责：聚合首页所需的所有并发加载数据，并利用 AsyncValue 处理加载/错误状态
final class HomeNotifierProvider
    extends $AsyncNotifierProvider<HomeNotifier, HomeState> {
  /// 首页数据管理器
  /// 职责：聚合首页所需的所有并发加载数据，并利用 AsyncValue 处理加载/错误状态
  HomeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeNotifierHash();

  @$internal
  @override
  HomeNotifier create() => HomeNotifier();
}

String _$homeNotifierHash() => r'6ae3aaa7076e9a1432d44a16f73eaacb47c87291';

/// 首页数据管理器
/// 职责：聚合首页所需的所有并发加载数据，并利用 AsyncValue 处理加载/错误状态

abstract class _$HomeNotifier extends $AsyncNotifier<HomeState> {
  FutureOr<HomeState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<HomeState>, HomeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<HomeState>, HomeState>,
              AsyncValue<HomeState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
