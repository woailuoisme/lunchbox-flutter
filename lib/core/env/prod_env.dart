import 'package:envied/envied.dart';
import 'package:lunchbox/core/env/app_env.dart';

part 'prod_env.g.dart';

@Envied(path: '.env.prod')
class ProdEnv implements AppEnv {
  @EnviedField(varName: 'BASE_URL')
  static const String _baseUrl = _ProdEnv._baseUrl;

  @EnviedField(varName: 'STRIPE_PUBLISHABLE_KEY')
  static const String _stripePublishableKey = _ProdEnv._stripePublishableKey;

  @override
  String get baseUrl => _baseUrl;

  @override
  String get stripePublishableKey => _stripePublishableKey;
}
