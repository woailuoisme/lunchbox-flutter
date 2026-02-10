import 'package:envied/envied.dart';
import 'package:lunchbox/core/env/app_env.dart';

part 'dev_env.g.dart';

@Envied(path: '.env.dev')
class DevEnv implements AppEnv {
  @EnviedField(varName: 'BASE_URL')
  static const String _baseUrl = _DevEnv._baseUrl;

  @EnviedField(varName: 'STRIPE_PUBLISHABLE_KEY')
  static const String _stripePublishableKey = _DevEnv._stripePublishableKey;

  @override
  String get baseUrl => _baseUrl;

  @override
  String get stripePublishableKey => _stripePublishableKey;
}
