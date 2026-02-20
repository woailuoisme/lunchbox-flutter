import 'package:lunchbox/core/env/dev_env.dart';
import 'package:lunchbox/core/env/prod_env.dart';

abstract class AppEnv {
  String get baseUrl;

  String get stripePublishableKey;
}

class AppEnvConfig {
  static final AppEnv current = _isProd ? ProdEnv() : DevEnv();
  static const bool _isProd = bool.fromEnvironment(
    'IS_PROD',
    defaultValue: false,
  );
}
