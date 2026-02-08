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

String _$lotteryNotifierHash() => r'b422ccde00e7ca38e3716955ffd0a10ed69b0ff5';

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
