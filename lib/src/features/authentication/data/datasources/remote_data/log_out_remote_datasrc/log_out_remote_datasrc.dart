import '../../../../../../../base/gateway/api_gateway.base.dart';
import '../../../../../../../config/app_config.dart';
import '../../../../../../shared/extensions.dart';
import 'resources/log_out_resource.dart';

class LogOutRemoteDatasource {
  LogOutRemoteDatasource();

  final ApiGateway _apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    apiType: ApiType.user,
  );

  Future<bool> logOut(Map<String, dynamic> params) async {
    final response = await _apiGateway.execute(
      resource: const LogOutResource(),
      method: HTTPMethod.post,
      data: params,
    );
    return response.isOk;
  }
}
