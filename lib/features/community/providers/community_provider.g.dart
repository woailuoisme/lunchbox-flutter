// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CommunityNotifier)
final communityProvider = CommunityNotifierProvider._();

final class CommunityNotifierProvider
    extends $AsyncNotifierProvider<CommunityNotifier, CommunityModel?> {
  CommunityNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'communityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$communityNotifierHash();

  @$internal
  @override
  CommunityNotifier create() => CommunityNotifier();
}

String _$communityNotifierHash() => r'1bdf40996174d5a7b1da7eaf2b9f9890be8e6277';

abstract class _$CommunityNotifier extends $AsyncNotifier<CommunityModel?> {
  FutureOr<CommunityModel?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<CommunityModel?>, CommunityModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CommunityModel?>, CommunityModel?>,
              AsyncValue<CommunityModel?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
