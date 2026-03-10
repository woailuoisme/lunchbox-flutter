// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PartnerNotifier)
final partnerProvider = PartnerNotifierProvider._();

final class PartnerNotifierProvider
    extends $AsyncNotifierProvider<PartnerNotifier, void> {
  PartnerNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'partnerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$partnerNotifierHash();

  @$internal
  @override
  PartnerNotifier create() => PartnerNotifier();
}

String _$partnerNotifierHash() => r'a9e40ac8b7aa4fa94e3e88624213d003e15936f1';

abstract class _$PartnerNotifier extends $AsyncNotifier<void> {
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
