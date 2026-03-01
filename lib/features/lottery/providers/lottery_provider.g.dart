// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lottery_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LotteryNotifier)
final lotteryProvider = LotteryNotifierProvider._();

final class LotteryNotifierProvider
    extends $NotifierProvider<LotteryNotifier, LotteryState> {
  LotteryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lotteryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lotteryNotifierHash();

  @$internal
  @override
  LotteryNotifier create() => LotteryNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LotteryState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LotteryState>(value),
    );
  }
}

String _$lotteryNotifierHash() => r'36f5df2a56521d36bfcaf418c41b1ede0b099d3d';

abstract class _$LotteryNotifier extends $Notifier<LotteryState> {
  LotteryState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<LotteryState, LotteryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LotteryState, LotteryState>,
              LotteryState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
