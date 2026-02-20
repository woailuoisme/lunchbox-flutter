import 'package:lunchbox/core/services/storage_service.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/core/constants/app_constants.dart';
import 'package:lunchbox/features/onboarding/providers/onboarding_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_notifier.g.dart';

@riverpod
class OnboardingNotifier extends _$OnboardingNotifier {
  @override
  OnboardingState build() {
    return const OnboardingState();
  }

  /// 完成引导
  Future<void> completeOnboarding() async {
    // 在异步操作前同步读取 storageService，避免 ref 在异步点后被 dispose 导致无法访问
    final storageService = ref.read(storageServiceProvider);

    try {
      // 标记已完成首次启动
      await storageService.write(AppConstants.keyIsFirstLaunch, false);
      LoggerUtils.i('OnboardingNotifier: Onboarding completed');
    } catch (e, stackTrace) {
      LoggerUtils.e(
        'OnboardingNotifier: Failed to complete onboarding',
        e,
        stackTrace,
      );
    }
  }
}
