import 'package:envied/envied.dart';
import 'package:lunchbox/core/env/app_env.dart';

part 'prod_env.g.dart';

@Envied(path: '.env.prod')
class ProdEnv implements AppEnv {
  @EnviedField(varName: 'BASE_URL')
  static const String _baseUrl = _ProdEnv._baseUrl;

  @EnviedField(varName: 'STRIPE_PUBLISHABLE_KEY')
  static const String _stripePublishableKey = _ProdEnv._stripePublishableKey;

  @EnviedField(varName: 'SENTRY_DSN')
  static const String _sentryDsn = _ProdEnv._sentryDsn;

  @EnviedField(varName: 'DEBUG')
  static const bool _debug = _ProdEnv._debug;

  @EnviedField(varName: 'GOOGLE_SERVER_CLIENT_ID')
  static const String _googleServerClientId = _ProdEnv._googleServerClientId;

  @override
  String get baseUrl => _baseUrl;

  @override
  String get stripePublishableKey => _stripePublishableKey;

  @override
  String get sentryDsn => _sentryDsn;

  @override
  bool get debug => _debug;

  @override
  String get googleServerClientId => _googleServerClientId;
}
