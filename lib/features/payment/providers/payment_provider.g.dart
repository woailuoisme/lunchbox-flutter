// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaymentNotifier)
final paymentProvider = PaymentNotifierFamily._();

final class PaymentNotifierProvider
    extends $AsyncNotifierProvider<PaymentNotifier, PaymentState> {
  PaymentNotifierProvider._({
    required PaymentNotifierFamily super.from,
    required double super.argument,
  }) : super(
         retry: null,
         name: r'paymentProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$paymentNotifierHash();

  @override
  String toString() {
    return r'paymentProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PaymentNotifier create() => PaymentNotifier();

  @override
  bool operator ==(Object other) {
    return other is PaymentNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$paymentNotifierHash() => r'79155b8a4a1b7800a5291be9f08ef76007e2ed61';

final class PaymentNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PaymentNotifier,
          AsyncValue<PaymentState>,
          PaymentState,
          FutureOr<PaymentState>,
          double
        > {
  PaymentNotifierFamily._()
    : super(
        retry: null,
        name: r'paymentProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PaymentNotifierProvider call(double amount) =>
      PaymentNotifierProvider._(argument: amount, from: this);

  @override
  String toString() => r'paymentProvider';
}

abstract class _$PaymentNotifier extends $AsyncNotifier<PaymentState> {
  late final _$args = ref.$arg as double;
  double get amount => _$args;

  FutureOr<PaymentState> build(double amount);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<PaymentState>, PaymentState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PaymentState>, PaymentState>,
              AsyncValue<PaymentState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
