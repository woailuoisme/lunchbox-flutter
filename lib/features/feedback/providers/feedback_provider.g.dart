// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FeedbackNotifier)
final feedbackProvider = FeedbackNotifierProvider._();

final class FeedbackNotifierProvider
    extends $AsyncNotifierProvider<FeedbackNotifier, void> {
  FeedbackNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'feedbackProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$feedbackNotifierHash();

  @$internal
  @override
  FeedbackNotifier create() => FeedbackNotifier();
}

String _$feedbackNotifierHash() => r'33104faf4aa2c83042be432114cea8f4a52a11cf';

abstract class _$FeedbackNotifier extends $AsyncNotifier<void> {
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
