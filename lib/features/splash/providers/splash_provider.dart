import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/core/mixins/async_runner_mixin.dart';
import 'package:lunchbox/core/services/storage_service.dart';
import 'package:lunchbox/core/utils/logger_utils.dart';
import 'package:lunchbox/core/constants/app_constants.dart';
import 'package:lunchbox/features/auth/repositories/auth_repository.dart';
import 'package:lunchbox/features/profile/repositories/profile_repository.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:lunchbox/routes/app_routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_provider.freezed.dart';
part 'splash_provider.g.dart';

@freezed
sealed class SplashState with _$SplashState {
  const factory SplashState({
    @Default(true) bool isLoading,
    String? errorMessage,
    @Default(0.0) double initializationProgress,
    String? navigationPath,
    @Default(false) bool hasInitialized,
  }) = _SplashState;
}

@Riverpod(keepAlive: true)
class SplashNotifier extends _$SplashNotifier
    with AsyncRunnerMixin<SplashState> {
  @override
  SplashState build() {
    Future.microtask(_initializeApp);
    return const SplashState();
  }

  /// 初始化应用程序
  ///
  /// 负责检查服务状态、加载本地配置、验证认证状态以及预加载必要的数据。
  Future<void> _initializeApp() async {
    await runAsync(() async {
      final authRepository = ref.read(authRepositoryProvider);
      final storageService = ref.read(storageServiceProvider);

      LoggerUtils.i('SplashNotifier: Starting app initialization');

      // 阶段 1：并行执行独立的基础初始化任务
      await _updateProgress(0.4);
      await Future.wait([
        _loadLocalConfig(storageService),
        // 此处可以添加更多独立任务，如初始化第三方 SDK 等
      ]);

      // 阶段 2：检查认证状态并预加载数据
      await _updateProgress(0.7);
      final isLoggedIn = authRepository.isLoggedIn();
      if (isLoggedIn) {
        await _preloadUserData(authRepository);
      }

      // 阶段 3：完成初始化
      await _updateProgress(1.0);
      await Future<void>.delayed(const Duration(milliseconds: 300));

      state = state.copyWith(hasInitialized: true);
      _determineNavigationPath(isLoggedIn, storageService);

      LoggerUtils.i('SplashNotifier: Initialization successful');
    }, errorLabel: t.splash.failed);
  }

  /// 更新初始化进度
  Future<void> _updateProgress(double progress) async {
    state = state.copyWith(initializationProgress: progress);
    LoggerUtils.d('SplashNotifier: Progress ${(progress * 100).toInt()}%');
  }

  /// 加载本地持久化配置
  Future<void> _loadLocalConfig(StorageService storageService) async {
    try {
      final selectedCity = storageService.read<String>(
        AppConstants.keySelectedCity,
      );
      if (selectedCity != null) {
        LoggerUtils.d('SplashNotifier: Local city loaded: $selectedCity');
      }
    } catch (e, stackTrace) {
      LoggerUtils.e('SplashNotifier: Config loading error', e, stackTrace);
    }
  }

  /// 预加载登录用户的数据
  Future<void> _preloadUserData(AuthRepository authRepository) async {
    try {
      LoggerUtils.i('SplashNotifier: Preloading user data');
      final profileRepo = ref.read(profileRepositoryProvider.notifier);
      await profileRepo.getUserInfo();
    } catch (e, stackTrace) {
      LoggerUtils.e(
        'SplashNotifier: User data preloading failed',
        e,
        stackTrace,
      );
    }
  }

  /// 根据当前状态决定跳转路径
  void _determineNavigationPath(
    bool isLoggedIn,
    StorageService storageService,
  ) {
    final isFirstLaunch =
        storageService.read<bool>(AppConstants.keyIsFirstLaunch) ?? true;

    if (isFirstLaunch) {
      state = state.copyWith(navigationPath: AppRoutes.onboarding);
    } else {
      state = state.copyWith(
        navigationPath: isLoggedIn ? AppRoutes.home : AppRoutes.login,
      );
    }

    LoggerUtils.i('SplashNotifier: Target path -> ${state.navigationPath}');
  }

  /// 重试初始化流程
  Future<void> retryInitialization() => _initializeApp();

  /// 跳过错误并进入登录页
  void skipError() {
    state = state.copyWith(navigationPath: AppRoutes.login);
  }
}
