import '../../../../../../../base/gateway/api_gateway.base.dart';
import '../../../../../../../config/app_config.dart';
import 'model/topic_model.dart';
import 'resources/topics_resource.dart';

class TopicRemoteDatasource {
  TopicRemoteDatasource();

  final ApiGateway apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    apiType: ApiType.public,
  );

  Future<List<TopicItemBaseModel>> getTopics() async {
    final response = await apiGateway.execute(
      resource: const TopicResource(),
      method: HTTPMethod.get,
    );
    return (response.data['data'] as List)
        .map((e) => TopicItemBaseModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
}
