import '../../../../../../base/gateway/api_gateway.base.dart';
import '../../../../../../config/app_config.dart';
import 'resources/feedback_resource.dart';

class FeedbackRemoteDatasource {
  FeedbackRemoteDatasource();

  final ApiGateway apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    apiType: ApiType.user,
  );

  Future<bool> createFeedback(Map<String, dynamic> feedback) async {
    final response = await apiGateway.execute(
      resource: const FeedbackResource(),
      method: HTTPMethod.post,
      data: feedback,
    );
    return response.statusCode == 201;
  }
}
