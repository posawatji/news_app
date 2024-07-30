import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(obfuscate: true, path: '.env')
abstract class ENV {
  @EnviedField()
  static final String API_ENDPOINT = _ENV.API_ENDPOINT;
  @EnviedField()
  static final String X_RAPIDAPI_KEY = _ENV.X_RAPIDAPI_KEY;
  @EnviedField()
  static final String X_RAPIDAPI_HOST = _ENV.X_RAPIDAPI_HOST;
}
