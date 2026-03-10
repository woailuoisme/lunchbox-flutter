// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_gift_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(welcomeGiftRepository)
final welcomeGiftRepositoryProvider = WelcomeGiftRepositoryProvider._();

final class WelcomeGiftRepositoryProvider
    extends
        $FunctionalProvider<
          WelcomeGiftRepository,
          WelcomeGiftRepository,
          WelcomeGiftRepository
        >
    with $Provider<WelcomeGiftRepository> {
  WelcomeGiftRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'welcomeGiftRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$welcomeGiftRepositoryHash();

  @$internal
  @override
  $ProviderElement<WelcomeGiftRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WelcomeGiftRepository create(Ref ref) {
    return welcomeGiftRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WelcomeGiftRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WelcomeGiftRepository>(value),
    );
  }
}

String _$welcomeGiftRepositoryHash() =>
    r'135d864775e2de1d77bfc44f8c36db1aa5d73d0d';
