import 'package:dio/dio.dart';

import '../base/gateway/api_gateway.base.dart';

class TempAuthRequiredGateway extends ApiGateway {
  TempAuthRequiredGateway(String endpoint, List<Interceptor> interceptors)
      : super(
          endpoint,
          interceptors: interceptors,
          apiType: ApiType.user,
        );

  // factory TempGateway.fromConfig(
  //   Config config,
  //   CreateInterceptors interceptors,
  // ) {
  //   final _interceptors = interceptors.call();
  //   return TempGateway(config.urlGateway, _interceptors);
  // }
}

class TempPublicGateway extends ApiGateway {
  TempPublicGateway(String endpoint, List<Interceptor> interceptors)
      : super(
          endpoint,
          interceptors: interceptors,
          apiType: ApiType.public,
        );
}
