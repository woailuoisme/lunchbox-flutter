// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(communityRepository)
final communityRepositoryProvider = CommunityRepositoryProvider._();

final class CommunityRepositoryProvider
    extends
        $FunctionalProvider<
          CommunityRepository,
          CommunityRepository,
          CommunityRepository
        >
    with $Provider<CommunityRepository> {
  CommunityRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'communityRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$communityRepositoryHash();

  @$internal
  @override
  $ProviderElement<CommunityRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CommunityRepository create(Ref ref) {
    return communityRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommunityRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommunityRepository>(value),
    );
  }
}

String _$communityRepositoryHash() =>
    r'c508af46b2678478e281cf06fdebe79e374db8c1';
