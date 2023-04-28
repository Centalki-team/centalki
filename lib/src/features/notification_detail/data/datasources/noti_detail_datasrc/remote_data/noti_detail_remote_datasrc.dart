import '../../../../../../../base/gateway/api_gateway.base.dart';
import '../../../../../../../config/app_config.dart';

class NotiDetailRemoteDatasrc {
  NotiDetailRemoteDatasrc();

  final _apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    apiType: ApiType.public,
  );
}
