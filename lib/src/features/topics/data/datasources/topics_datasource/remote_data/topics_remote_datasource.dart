import 'package:dio/dio.dart';

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

  Future<TopicsListBaseModel> getTopics() async {
    final response = await apiGateway.execute(
      resource: const TopicResource(),
      method: HTTPMethod.get,
    );
    return TopicsListBaseModel.fromJson(response.data);
  }
}
