// ignore_for_file: do_not_use_environment

/// 应用常量配置
class AppConstants {
  // API 配置
  static const bool dioDebug = true;
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://api.elunchbox.com',
  );
  static const String appName = String.fromEnvironment(
    'APP_NAME',
    defaultValue: 'Lunchbox',
  );
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // 存储键
  static const String keyAuthToken = 'auth_token';
  static const String keyUserId = 'user_id';
  static const String keyUserPermissions = 'user_permissions';
  static const String keySelectedCity = 'selected_city';
  static const String keyCart = 'cart';
  static const String keyIsFirstLaunch = 'is_first_launch';

  // 缓存配置
  static const Duration cacheExpiration = Duration(hours: 24);
  static const int maxCacheSize = 100 * 1024 * 1024; // 100MB

  // 分页配置
  static const int pageSize = 20;

  // 支付配置
  static const Duration paymentTimeout = Duration(minutes: 15);
  static const String stripePublishableKey = String.fromEnvironment(
    'STRIPE_PUBLISHABLE_KEY',
    defaultValue: 'pk_test_51Mz...',
  );

  // 位置配置
  static const double defaultLatitude = 39.9042; // 北京
  static const double defaultLongitude = 116.4074;
  static const double locationAccuracy = 100; // 米

  // UI 配置
  static const double defaultPadding = 16;
  static const double defaultRadius = 8;
  static const Duration animationDuration = Duration(milliseconds: 300);
}
