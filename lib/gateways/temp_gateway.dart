import 'package:dio/dio.dart';

import '../base/gateway/api_gateway.base.dart';
import '../base/gateway/interceptors/interceptors.dart';
import '../config/configurations.dart';

class TempGateway extends ApiGateway {
  TempGateway(String endpoint, List<Interceptor> interceptors)
      : super(
          endpoint,
          interceptors: interceptors,
        );

  factory TempGateway.fromConfig(
    Config config,
    CreateInterceptors interceptors,
  ) {
    final _interceptors = interceptors.call();
    return TempGateway(config.urlGateway, _interceptors);
  }
}
