// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 积分商城 Provider
/// 管理商品列表加载、兑换流程与状态反馈

@ProviderFor(PointsMallNotifier)
final pointsMallProvider = PointsMallNotifierProvider._();

/// 积分商城 Provider
/// 管理商品列表加载、兑换流程与状态反馈
final class PointsMallNotifierProvider
    extends $AsyncNotifierProvider<PointsMallNotifier, PointsMallState> {
  /// 积分商城 Provider
  /// 管理商品列表加载、兑换流程与状态反馈
  PointsMallNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pointsMallProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pointsMallNotifierHash();

  @$internal
  @override
  PointsMallNotifier create() => PointsMallNotifier();
}

String _$pointsMallNotifierHash() =>
    r'd560ca84d75f0143fbe08837dd55901b3cdff00c';

/// 积分商城 Provider
/// 管理商品列表加载、兑换流程与状态反馈

abstract class _$PointsMallNotifier extends $AsyncNotifier<PointsMallState> {
  FutureOr<PointsMallState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<PointsMallState>, PointsMallState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PointsMallState>, PointsMallState>,
              AsyncValue<PointsMallState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// 积分兑换记录 Provider（分页，autoDispose）
/// page 为页码，type 为类型（all / gain / use）

@ProviderFor(pointsRecords)
final pointsRecordsProvider = PointsRecordsFamily._();

/// 积分兑换记录 Provider（分页，autoDispose）
/// page 为页码，type 为类型（all / gain / use）

final class PointsRecordsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PointsRecordResponse>>,
          List<PointsRecordResponse>,
          FutureOr<List<PointsRecordResponse>>
        >
    with
        $FutureModifier<List<PointsRecordResponse>>,
        $FutureProvider<List<PointsRecordResponse>> {
  /// 积分兑换记录 Provider（分页，autoDispose）
  /// page 为页码，type 为类型（all / gain / use）
  PointsRecordsProvider._({
    required PointsRecordsFamily super.from,
    required ({int page, String type}) super.argument,
  }) : super(
         retry: null,
         name: r'pointsRecordsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pointsRecordsHash();

  @override
  String toString() {
    return r'pointsRecordsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<PointsRecordResponse>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PointsRecordResponse>> create(Ref ref) {
    final argument = this.argument as ({int page, String type});
    return pointsRecords(ref, page: argument.page, type: argument.type);
  }

  @override
  bool operator ==(Object other) {
    return other is PointsRecordsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pointsRecordsHash() => r'a6d3d25756ddc2b812badc4b94a3cfe4da81cbc6';

/// 积分兑换记录 Provider（分页，autoDispose）
/// page 为页码，type 为类型（all / gain / use）

final class PointsRecordsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<PointsRecordResponse>>,
          ({int page, String type})
        > {
  PointsRecordsFamily._()
    : super(
        retry: null,
        name: r'pointsRecordsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 积分兑换记录 Provider（分页，autoDispose）
  /// page 为页码，type 为类型（all / gain / use）

  PointsRecordsProvider call({required int page, required String type}) =>
      PointsRecordsProvider._(argument: (page: page, type: type), from: this);

  @override
  String toString() => r'pointsRecordsProvider';
}

/// 用户积分余额 Provider（autoDispose，离页后释放）
/// 从 profileProvider 获取真实用户信息中的积分字段

@ProviderFor(pointsBalance)
final pointsBalanceProvider = PointsBalanceProvider._();

/// 用户积分余额 Provider（autoDispose，离页后释放）
/// 从 profileProvider 获取真实用户信息中的积分字段

final class PointsBalanceProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  /// 用户积分余额 Provider（autoDispose，离页后释放）
  /// 从 profileProvider 获取真实用户信息中的积分字段
  PointsBalanceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pointsBalanceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pointsBalanceHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return pointsBalance(ref);
  }
}

String _$pointsBalanceHash() => r'c8bec630e0f02ad49976a5d14b433d8063e58235';
