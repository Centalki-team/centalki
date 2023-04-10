import '../../../../../../../base/gateway/api_gateway.base.dart';
import '../../../../../../../config/app_config.dart';
import '../../../../../../shared/extensions.dart';
import 'resources/sign_up_resource.dart';

class SignUpRemoteDatasource {
  SignUpRemoteDatasource();

  final ApiGateway _apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    apiType: ApiType.user,
  );

  Future<bool> setUpInitialLevel(Map<String, dynamic> params) async {
    final response = await _apiGateway.execute(
      resource: const SignUpInitLevelResource(),
      method: HTTPMethod.put,
      data: params,
    );
    return response.isOk;
  }
}
