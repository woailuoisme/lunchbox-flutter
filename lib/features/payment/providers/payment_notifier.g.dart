// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaymentNotifier)
final paymentProvider = PaymentNotifierFamily._();

final class PaymentNotifierProvider
    extends $NotifierProvider<PaymentNotifier, PaymentState> {
  PaymentNotifierProvider._({
    required PaymentNotifierFamily super.from,
    required OrderModel super.argument,
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

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PaymentState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PaymentState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PaymentNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$paymentNotifierHash() => r'36e9fdee01b05d69505bf347e6dc244491c81dbf';

final class PaymentNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PaymentNotifier,
          PaymentState,
          PaymentState,
          PaymentState,
          OrderModel
        > {
  PaymentNotifierFamily._()
    : super(
        retry: null,
        name: r'paymentProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PaymentNotifierProvider call(OrderModel order) =>
      PaymentNotifierProvider._(argument: order, from: this);

  @override
  String toString() => r'paymentProvider';
}

abstract class _$PaymentNotifier extends $Notifier<PaymentState> {
  late final _$args = ref.$arg as OrderModel;
  OrderModel get order => _$args;

  PaymentState build(OrderModel order);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PaymentState, PaymentState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PaymentState, PaymentState>,
              PaymentState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
