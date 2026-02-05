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

  /// 完成引导
  Future<void> completeOnboarding() async {
    try {
      final storageService = ref.read(storageServiceProvider);
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
