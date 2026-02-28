// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lottery_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(lotteryRepository)
final lotteryRepositoryProvider = LotteryRepositoryProvider._();

final class LotteryRepositoryProvider
    extends
        $FunctionalProvider<
          LotteryRepository,
          LotteryRepository,
          LotteryRepository
        >
    with $Provider<LotteryRepository> {
  LotteryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lotteryRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lotteryRepositoryHash();

  @$internal
  @override
  $ProviderElement<LotteryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LotteryRepository create(Ref ref) {
    return lotteryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LotteryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LotteryRepository>(value),
    );
  }
}

String _$lotteryRepositoryHash() => r'd85400dfb1f2adb127db88acd99c55138437cd77';
