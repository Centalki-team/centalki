import '../../../../../../../base/gateway/api_gateway.base.dart';
import '../../../../../../../config/app_config.dart';
import 'resources/event_tracking_resource.dart';

class EventTrackingRemoteDatasource {
  EventTrackingRemoteDatasource();

  final ApiGateway apiGateway =
      ApiGateway(AppConfig.value.baseUrl, apiType: ApiType.public);

  Future<bool> createEventTracking(String sessionId, String name) async {
    final response = await apiGateway.execute(
      resource: EventTrackingResource(sessionId: sessionId),
      method: HTTPMethod.post,
      data: {"name": name},
    );
    return response.statusCode == 200 || response.statusCode == 201;
  }
}
