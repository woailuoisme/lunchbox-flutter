// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WalletRepository)
final walletRepositoryProvider = WalletRepositoryProvider._();

final class WalletRepositoryProvider
    extends $AsyncNotifierProvider<WalletRepository, void> {
  WalletRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'walletRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$walletRepositoryHash();

  @$internal
  @override
  WalletRepository create() => WalletRepository();
}

String _$walletRepositoryHash() => r'6c3ad549e408f3085ac530ca04023e88e2d62bc3';

abstract class _$WalletRepository extends $AsyncNotifier<void> {
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

@ProviderFor(walletBalance)
final walletBalanceProvider = WalletBalanceProvider._();

final class WalletBalanceProvider
    extends $FunctionalProvider<AsyncValue<double>, double, FutureOr<double>>
    with $FutureModifier<double>, $FutureProvider<double> {
  WalletBalanceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'walletBalanceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$walletBalanceHash();

  @$internal
  @override
  $FutureProviderElement<double> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<double> create(Ref ref) {
    return walletBalance(ref);
  }
}

String _$walletBalanceHash() => r'0978357126effdbc46d64523666eb28e621786f4';

@ProviderFor(walletTransactions)
final walletTransactionsProvider = WalletTransactionsProvider._();

final class WalletTransactionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<WalletTransactionModel>>,
          List<WalletTransactionModel>,
          FutureOr<List<WalletTransactionModel>>
        >
    with
        $FutureModifier<List<WalletTransactionModel>>,
        $FutureProvider<List<WalletTransactionModel>> {
  WalletTransactionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'walletTransactionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$walletTransactionsHash();

  @$internal
  @override
  $FutureProviderElement<List<WalletTransactionModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<WalletTransactionModel>> create(Ref ref) {
    return walletTransactions(ref);
  }
}

String _$walletTransactionsHash() =>
    r'ade9dddcff117159066fb1ef7b72a5eb46d66460';
