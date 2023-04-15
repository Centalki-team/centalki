import '../../../../../../../base/gateway/api_gateway.base.dart';
import '../../../../../../../config/app_config.dart';
import 'model/topic_detail_model.dart';
import 'resource/topic_detail_resource.dart';

class TopicDetailRemoteDatasource {
  TopicDetailRemoteDatasource();

  final _apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    apiType: ApiType.user,
  );

  Future<TopicDetailModel> getTopicDetail(String topicId) async {
    final response = await _apiGateway.execute(
      resource: TopicDetailResource(topicId),
      method: HTTPMethod.get,
    );
    return TopicDetailModel.fromJson(response.data['data']);
  }
}
