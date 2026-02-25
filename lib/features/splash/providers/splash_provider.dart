import 'package:lunchbox/core/services/storage_service.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/core/constants/app_constants.dart';
import 'package:lunchbox/features/auth/repositories/auth_repository.dart';
import 'package:lunchbox/features/profile/repositories/profile_repository.dart';
import 'package:lunchbox/routes/app_routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_provider.g.dart';

class SplashState {
  const SplashState({
    this.isInitializing = true,
    this.initializationError,
    this.initializationProgress = 0.0,
    this.navigationPath,
  });
  final bool isInitializing;
  final String? initializationError;
  final double initializationProgress;
  final String? navigationPath;

  SplashState copyWith({
    bool? isInitializing,
    String? initializationError,
    double? initializationProgress,
    String? navigationPath,
  }) {
    return SplashState(
      isInitializing: isInitializing ?? this.isInitializing,
      initializationError: initializationError,
      initializationProgress:
          initializationProgress ?? this.initializationProgress,
      navigationPath: navigationPath,
    );
  }
}

@riverpod
class SplashNotifier extends _$SplashNotifier {
  @override
  SplashState build() {
    // Fire and forget initialization
    Future.microtask(_initializeApp);
    return const SplashState();
  }

  Future<void> _initializeApp() async {
    final authRepository = ref.read(authRepositoryProvider);
    final storageService = ref.read(storageServiceProvider);

    try {
      LoggerUtils.i('SplashNotifier: Starting app initialization');
      state = state.copyWith(isInitializing: true);

      // Step 1: Check service status
      await _updateProgress(0.2);
      await Future<void>.delayed(const Duration(milliseconds: 300));

      // Step 2: Load local config
      await _updateProgress(0.4);
      await _loadLocalConfig(storageService);
      await Future<void>.delayed(const Duration(milliseconds: 300));

      // Step 3: Check auth status
      await _updateProgress(0.6);
      final isLoggedIn = authRepository.isLoggedIn();
      await Future<void>.delayed(const Duration(milliseconds: 300));

      // Step 4: Preload data
      await _updateProgress(0.8);
      if (isLoggedIn) {
        await _preloadUserData(authRepository);
      }
      await Future<void>.delayed(const Duration(milliseconds: 300));

      // Step 5: Complete
      await _updateProgress(1);
      await Future<void>.delayed(const Duration(milliseconds: 500));

      _determineNavigationPath(isLoggedIn, storageService);

      LoggerUtils.i(
        'SplashNotifier: App initialization completed successfully',
      );
    } catch (e, stackTrace) {
      LoggerUtils.e('SplashNotifier: Initialization failed', e, stackTrace);
      state = SplashState(
        isInitializing: false,
        initializationError: '初始化失败: ${e.toString()}',
        initializationProgress: state.initializationProgress,
      );
    }
  }

  Future<void> _updateProgress(double progress) async {
    state = state.copyWith(initializationProgress: progress);
    LoggerUtils.d('SplashNotifier: Progress ${(progress * 100).toInt()}%');
  }

  Future<void> _loadLocalConfig(StorageService storageService) async {
    try {
      final selectedCity = storageService.read<String>(
        AppConstants.keySelectedCity,
      );
      if (selectedCity != null) {
        LoggerUtils.d('SplashNotifier: Found selected city: $selectedCity');
      }
    } catch (e, stackTrace) {
      LoggerUtils.e(
        'SplashNotifier: Failed to load local config',
        e,
        stackTrace,
      );
    }
  }

  Future<void> _preloadUserData(AuthRepository authRepository) async {
    try {
      // 临时使用 ProfileRepository Mock 数据
      // final result = await authRepository.getCurrentUser().run();
      LoggerUtils.i(
        'SplashNotifier: Preloading mock user data (Network Ignored)',
      );
      final profileRepo = ref.read(profileRepositoryProvider.notifier);
      final user = await profileRepo.getUserInfo();

      LoggerUtils.d('SplashNotifier: User data preloaded: ${user.username}');

      /*
      result.fold(
        (failure) {
          LoggerUtils.e('SplashNotifier: Failed to preload user data', failure);
        },
        (user) {
          if (user != null) {
            LoggerUtils.d(
              'SplashNotifier: User data preloaded: ${user.username}',
            );
          }
        },
      );
      */
    } catch (e, stackTrace) {
      LoggerUtils.e(
        'SplashNotifier: Failed to preload user data',
        e,
        stackTrace,
      );
    }
  }

  void _determineNavigationPath(
    bool isLoggedIn,
    StorageService storageService,
  ) {
    final isFirstLaunch =
        storageService.read<bool>(AppConstants.keyIsFirstLaunch) ?? true;

    if (isFirstLaunch) {
      LoggerUtils.i(
        'SplashNotifier: First launch detected, navigating to onboarding',
      );
      state = state.copyWith(navigationPath: AppRoutes.onboarding);
    } else if (isLoggedIn) {
      LoggerUtils.i('SplashNotifier: User logged in, navigating to home');
      state = state.copyWith(navigationPath: AppRoutes.home);
    } else {
      LoggerUtils.i('SplashNotifier: User not logged in, navigating to login');
      state = state.copyWith(navigationPath: AppRoutes.login);
    }
  }

  Future<void> retryInitialization() async {
    await _initializeApp();
  }

  void skipError() {
    LoggerUtils.w('SplashNotifier: Skipping error, navigating to login');
    state = state.copyWith(navigationPath: AppRoutes.login);
  }
}
