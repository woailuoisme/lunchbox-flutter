import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(0) int currentPage,
    @Default(3) int totalPages,
    @Default(false) bool isLastPage,
  }) = _OnboardingState;
}
