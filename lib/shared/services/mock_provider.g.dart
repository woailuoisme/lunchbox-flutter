// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mock_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mockProvider)
final mockProviderProvider = MockProviderProvider._();

final class MockProviderProvider
    extends $FunctionalProvider<MockProvider, MockProvider, MockProvider>
    with $Provider<MockProvider> {
  MockProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mockProviderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mockProviderHash();

  @$internal
  @override
  $ProviderElement<MockProvider> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MockProvider create(Ref ref) {
    return mockProvider(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MockProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MockProvider>(value),
    );
  }
}

String _$mockProviderHash() => r'1bd166e0679d4abf72c04ff2194bcf75ad79ab7a';
