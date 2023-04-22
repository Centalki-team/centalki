import '../../../../../../../base/gateway/api_gateway.base.dart';
import '../../../../../../../config/app_config.dart';
import 'models/topic_feedback_options_model.dart';
import 'models/topic_feedback_response_model.dart';
import 'resources/topic_feedback_resources.dart';

class TopicReviewPageContentsRemoteDatasrc {
  TopicReviewPageContentsRemoteDatasrc();

  final _apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    apiType: ApiType.public,
  );

  final _apiGatewayUser = ApiGateway(
    AppConfig.value.baseUrl,
    apiType: ApiType.user,
  );

  Future<TopicFeedbackOptionsModel> getTopicFeedbackOptions() async {
    final response = await _apiGateway.execute(
      resource: const TopicFeedbackOptionsResource(),
      method: HTTPMethod.get,
    );
    return TopicFeedbackOptionsModel.fromJson(
        response.data['data'] as Map<String, dynamic>);
  }

  Future<TopicFeedbackResponseModel> sendTopicFeedback(
      Map<String, dynamic> params) async {
    final response = await _apiGatewayUser.execute(
      resource: const SendTopicFeedbackResource(),
      method: HTTPMethod.post,
      data: params,
    );
    return TopicFeedbackResponseModel.fromJson(response.data);
  }
}
