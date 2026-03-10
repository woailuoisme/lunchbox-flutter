// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 积分商城与记录相关的 Repository
/// 封装所有积分 API 请求，错误由上层 Provider 处理

@ProviderFor(PointsRepository)
final pointsRepositoryProvider = PointsRepositoryProvider._();

/// 积分商城与记录相关的 Repository
/// 封装所有积分 API 请求，错误由上层 Provider 处理
final class PointsRepositoryProvider
    extends $AsyncNotifierProvider<PointsRepository, void> {
  /// 积分商城与记录相关的 Repository
  /// 封装所有积分 API 请求，错误由上层 Provider 处理
  PointsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pointsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pointsRepositoryHash();

  @$internal
  @override
  PointsRepository create() => PointsRepository();
}

String _$pointsRepositoryHash() => r'bc3c0479d18d5dae7c7518af714fdd8a0585a6fd';

/// 积分商城与记录相关的 Repository
/// 封装所有积分 API 请求，错误由上层 Provider 处理

abstract class _$PointsRepository extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
