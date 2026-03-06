import 'package:freezed_annotation/freezed_annotation.dart';

part 'setup_payment_state.freezed.dart';

@freezed
sealed class SetupPaymentState with _$SetupPaymentState {
  const factory SetupPaymentState({
    @Default(false) bool isLoading,
    @Default(false) bool isSheetReady,
    @Default(false) bool isSuccess,
    String? clientSecret,
    String? errorMessage,
  }) = _SetupPaymentState;
}
