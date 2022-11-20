abstract class Config {
  const Config({
    required this.urlGateway,
    required this.apiKey,
  });

  factory Config.load() => const _DevConfig();

  final String urlGateway;
  final String apiKey;
}

class _DevConfig extends Config {
  const _DevConfig() : super(urlGateway: '', apiKey: '');
}
