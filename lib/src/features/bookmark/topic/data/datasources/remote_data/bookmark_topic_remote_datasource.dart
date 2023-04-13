import '../../../../../../../base/gateway/api_gateway.base.dart';
import '../../../../../../../config/app_config.dart';
import 'model/bookmark_topic_model.dart';
import 'resources/bookmark_topic_resource.dart';

class BookmarkTopicRemoteDatasource {
  BookmarkTopicRemoteDatasource();

  final ApiGateway apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    apiType: ApiType.user,
  );

  Future<bool> createBookmarkTopic(Map<String, dynamic> params) async {
    final response = await apiGateway.execute(
      resource: const BookmarkTopicResource(),
      method: HTTPMethod.post,
      data: params,
    );
    return response.statusCode == 200 || response.statusCode == 201;
  }

  Future<List<BookmarkTopicModel>> getBookmarkTopics() async {
    final response = await apiGateway.execute(
      resource: const BookmarkTopicResource(),
      method: HTTPMethod.get,
    );
    return (response.data as List<dynamic>)
        .map((e) => BookmarkTopicModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<bool> deleteBookmarkTopic(Map<String, dynamic> params) async {
    final response = await apiGateway.execute(
      resource: const BookmarkTopicResource(),
      method: HTTPMethod.delete,
      params: params,
    );
    return response.statusCode == 200;
  }
}
