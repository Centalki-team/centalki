import '../../../../../../base/gateway/api_gateway.base.dart';
import '../../../../../../config/app_config.dart';
import '../../../../../shared/extensions.dart';
import 'resources/topic_suggestion_resource.dart';

class TopicSuggestionRemoteDatasrc {
  TopicSuggestionRemoteDatasrc();

  final _apiGatewayUser = ApiGateway(
    AppConfig.value.baseUrl,
    apiType: ApiType.user,
  );

  Future<bool> sendTopicSuggestion(Map<String, dynamic> params) async {
    final response = await _apiGatewayUser.execute(
      resource: const TopicSuggestionResource(),
      method: HTTPMethod.post,
      data: params,
    );
    return response.isOk;
  }
}
