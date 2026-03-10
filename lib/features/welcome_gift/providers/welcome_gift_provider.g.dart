// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_gift_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WelcomeGiftNotifier)
final welcomeGiftProvider = WelcomeGiftNotifierProvider._();

final class WelcomeGiftNotifierProvider
    extends $AsyncNotifierProvider<WelcomeGiftNotifier, WelcomeGiftState> {
  WelcomeGiftNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'welcomeGiftProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$welcomeGiftNotifierHash();

  @$internal
  @override
  WelcomeGiftNotifier create() => WelcomeGiftNotifier();
}

String _$welcomeGiftNotifierHash() =>
    r'23eebf4de06476d1f5a70416ed6df3bcafdf2ccb';

abstract class _$WelcomeGiftNotifier extends $AsyncNotifier<WelcomeGiftState> {
  FutureOr<WelcomeGiftState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<WelcomeGiftState>, WelcomeGiftState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<WelcomeGiftState>, WelcomeGiftState>,
              AsyncValue<WelcomeGiftState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
