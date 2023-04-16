import '../../../../../../../base/gateway/api_gateway.base.dart';
import '../../../../../../../config/app_config.dart';
import '../../../../../topics/data/datasources/topics_datasource/remote_data/model/topic_model.dart';
import 'resources/search_topics_resource.dart';

class SearchTopicsRemoteDatasource {
  SearchTopicsRemoteDatasource();

  final _apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    apiType: ApiType.user,
  );

  Future<TopicsListBaseModel> searchTopics(Map<String, dynamic> params) async {
    final response = await _apiGateway.execute(
      resource: const SearchTopicsResource(),
      method: HTTPMethod.get,
      params: params,
    );
    return TopicsListBaseModel.fromJson(response.data);
  }
}
