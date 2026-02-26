// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialog_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 对话框服务
///
/// 提供统一的对话框功能，支持信息、成功、错误、警告和确认五种类型。
/// 基于 AwesomeDialog 实现。

@ProviderFor(dialogService)
final dialogServiceProvider = DialogServiceProvider._();

/// 对话框服务
///
/// 提供统一的对话框功能，支持信息、成功、错误、警告和确认五种类型。
/// 基于 AwesomeDialog 实现。

final class DialogServiceProvider
    extends $FunctionalProvider<DialogService, DialogService, DialogService>
    with $Provider<DialogService> {
  /// 对话框服务
  ///
  /// 提供统一的对话框功能，支持信息、成功、错误、警告和确认五种类型。
  /// 基于 AwesomeDialog 实现。
  DialogServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dialogServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dialogServiceHash();

  @$internal
  @override
  $ProviderElement<DialogService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DialogService create(Ref ref) {
    return dialogService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DialogService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DialogService>(value),
    );
  }
}

String _$dialogServiceHash() => r'253d143cf42bef9f3d5a219117ca1ff5d96b9909';
