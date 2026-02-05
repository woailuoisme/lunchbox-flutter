import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/storage_service.dart';
import '../../../core/utils/logger_utils.dart';
import '../../../core/values/app_constants.dart';
import 'onboarding_state.dart';

part 'onboarding_notifier.g.dart';

@riverpod
class OnboardingNotifier extends _$OnboardingNotifier {
  @override
  OnboardingState build() {
    return const OnboardingState();
  }

  /// 跳转到下一页
  void nextPage() {
    if (state.currentPage < state.totalPages - 1) {
      final newPage = state.currentPage + 1;
      state = state.copyWith(
        currentPage: newPage,
        isLastPage: newPage == state.totalPages - 1,
      );
    } else {
      completeOnboarding();
    }
  }

  /// 跳转到上一页
  void previousPage() {
    if (state.currentPage > 0) {
      final newPage = state.currentPage - 1;
      state = state.copyWith(currentPage: newPage, isLastPage: false);
    }
  }

  /// 跳过引导
  void skipOnboarding() {
    completeOnboarding();
  }

  /// 完成引导
  Future<void> completeOnboarding() async {
    try {
      final storageService = ref.read(storageServiceProvider);
      // 标记已完成首次启动
      await storageService.write(AppConstants.keyIsFirstLaunch, false);
      LoggerUtils.i('OnboardingNotifier: Onboarding completed');

      // 导航逻辑建议由 UI 层监听状态或直接调用，但这里暂时保留直接导航的需求
      // 实际上在 Riverpod 中，我们通常会在 UI 中监听完成状态进行导航
    } catch (e, stackTrace) {
      LoggerUtils.e(
        'OnboardingNotifier: Failed to complete onboarding',
        e,
        stackTrace,
      );
    }
  }

  /// 页面改变回调
  void onPageChanged(int index) {
    state = state.copyWith(
      currentPage: index,
      isLastPage: index == state.totalPages - 1,
    );
  }
}
