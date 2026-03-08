import 'package:lunchbox/core/services/storage_service.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/core/constants/app_constants.dart';
import 'package:lunchbox/features/onboarding/providers/onboarding_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_provider.g.dart';

@riverpod
class OnboardingNotifier extends _$OnboardingNotifier {
  @override
  FutureOr<OnboardingState> build() {
    return const OnboardingState();
  }

  /// 完成引导
  Future<void> completeOnboarding() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      // 在异步操作前同步读取 storageService，避免 ref 在异步点后被 dispose 导致无法访问
      final storageService = ref.read(storageServiceProvider);

      // 标记已完成首次启动
      await storageService.write(AppConstants.keyIsFirstLaunch, false);
      LoggerUtils.i('OnboardingNotifier: Onboarding completed');

      return state.value!;
    });
  }
}
