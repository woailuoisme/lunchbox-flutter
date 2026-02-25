// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Auth)
final authProvider = AuthProvider._();

final class AuthProvider extends $NotifierProvider<Auth, bool> {
  AuthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authHash();

  @$internal
  @override
  Auth create() => Auth();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$authHash() => r'460935ac7ed3e0362128bb0841f1490710e89626';

abstract class _$Auth extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
