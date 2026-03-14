import 'package:lunchbox/core/services/storage_service.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/core/constants/app_constants.dart';
import 'package:lunchbox/features/onboarding/providers/onboarding_state.dart';
import 'package:lunchbox/features/splash/providers/splash_provider.dart';
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
    final currentState = state.value ?? const OnboardingState();
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final storageService = ref.read(storageServiceProvider);

      // 标记已完成首次启动
      await storageService.write(AppConstants.keyIsFirstLaunch, false);
      LoggerUtils.i('OnboardingNotifier: Onboarding completed');

      // 同步更新 SplashNotifier 的导航路径，防止 GoRouter 重建时再次导航入引导页
      ref.read(splashProvider.notifier).notifyOnboardingComplete();

      return currentState;
    });
  }
}
