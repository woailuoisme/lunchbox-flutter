import 'package:envied/envied.dart';

part 'env_dev.g.dart';

@Envied(path: '.env.dev')
abstract class DevEnv {
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _DevEnv.baseUrl;

  @EnviedField(varName: 'APP_NAME')
  static const String appName = _DevEnv.appName;
}
