// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OrderNotifier)
final orderProvider = OrderNotifierProvider._();

final class OrderNotifierProvider
    extends $AsyncNotifierProvider<OrderNotifier, OrderState> {
  OrderNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderNotifierHash();

  @$internal
  @override
  OrderNotifier create() => OrderNotifier();
}

String _$orderNotifierHash() => r'04696bd0871981437f3676ea0ff67809a7624731';

abstract class _$OrderNotifier extends $AsyncNotifier<OrderState> {
  FutureOr<OrderState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<OrderState>, OrderState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<OrderState>, OrderState>,
              AsyncValue<OrderState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
