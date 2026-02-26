// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(personalInfoRepository)
final personalInfoRepositoryProvider = PersonalInfoRepositoryProvider._();

final class PersonalInfoRepositoryProvider
    extends
        $FunctionalProvider<
          PersonalInfoRepository,
          PersonalInfoRepository,
          PersonalInfoRepository
        >
    with $Provider<PersonalInfoRepository> {
  PersonalInfoRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'personalInfoRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$personalInfoRepositoryHash();

  @$internal
  @override
  $ProviderElement<PersonalInfoRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PersonalInfoRepository create(Ref ref) {
    return personalInfoRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PersonalInfoRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PersonalInfoRepository>(value),
    );
  }
}

String _$personalInfoRepositoryHash() =>
    r'7d21ecf8699009aa5e1f25964daa4e04e354c9b7';
