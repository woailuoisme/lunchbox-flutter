// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(apiProvider)
final apiProviderProvider = ApiProviderProvider._();

final class ApiProviderProvider
    extends $FunctionalProvider<ApiProvider, ApiProvider, ApiProvider>
    with $Provider<ApiProvider> {
  ApiProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiProviderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiProviderHash();

  @$internal
  @override
  $ProviderElement<ApiProvider> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ApiProvider create(Ref ref) {
    return apiProvider(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiProvider>(value),
    );
  }
}

String _$apiProviderHash() => r'e8ddfbeca56a0a53f546089baf06b6efb68ffa78';
