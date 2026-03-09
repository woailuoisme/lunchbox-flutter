import 'package:envied/envied.dart';
import 'package:lunchbox/core/env/app_env.dart';

part 'dev_env.g.dart';

@Envied(path: '.env.dev')
class DevEnv implements AppEnv {
  @EnviedField(varName: 'BASE_URL')
  static const String _baseUrl = _DevEnv._baseUrl;

  @EnviedField(varName: 'STRIPE_PUBLISHABLE_KEY')
  static const String _stripePublishableKey = _DevEnv._stripePublishableKey;

  @EnviedField(varName: 'SENTRY_DSN')
  static const String _sentryDsn = _DevEnv._sentryDsn;

  @EnviedField(varName: 'DEBUG')
  static const bool _debug = _DevEnv._debug;

  @EnviedField(varName: 'GOOGLE_SERVER_CLIENT_ID')
  static const String _googleServerClientId = _DevEnv._googleServerClientId;

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
