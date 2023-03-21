enum ENV {
  dev,
  ci,
  uat,
  staging,
  production,
}

class AppConfig {
  AppConfig._(
    //this.env,
    this.baseUrl, {
    this.timeout = 30000,
    //required this.isPrefix,
  });

  static late final AppConfig value;
  static bool _created = false;
  //final ENV env;
  String baseUrl;
  //final String isPrefix;
  final int timeout;

  static AppConfig createConfig() {
    if (AppConfig._created) return AppConfig.value;
    AppConfig config;
    //switch env => config by env
    config = AppConfig._(
      'https://api.centalki.com/v1',
    );
    AppConfig.value = config;
    AppConfig._created = true;
    return config;
  }
}
