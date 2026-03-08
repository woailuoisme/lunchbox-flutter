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
    extends $AsyncNotifierProvider<LotteryNotifier, LotteryState> {
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
}

String _$lotteryNotifierHash() => r'e704ad2a416b686145a8c05b915562267361ce7c';

abstract class _$LotteryNotifier extends $AsyncNotifier<LotteryState> {
  FutureOr<LotteryState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<LotteryState>, LotteryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LotteryState>, LotteryState>,
              AsyncValue<LotteryState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
