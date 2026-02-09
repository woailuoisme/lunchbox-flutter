import 'package:envied/envied.dart';

part 'env_prod.g.dart';

@Envied(path: '.env.prod')
abstract class ProdEnv {
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _ProdEnv.baseUrl;

  @EnviedField(varName: 'APP_NAME')
  static const String appName = _ProdEnv.appName;
}
