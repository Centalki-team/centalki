import '../../../../../../../base/gateway/api_gateway.base.dart';
import '../../../../../../../config/app_config.dart';
import 'resources/report_meeting_resource.dart';

class ReportMeetingRemoteDatasource {
  ReportMeetingRemoteDatasource();

  final ApiGateway apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    apiType: ApiType.user,
  );

  Future<bool> reportMeeting({
    required String reportedId,
    required String sessionId,
    required List<String> summary,
    required String detail,
  }) async {
    final response = await apiGateway.execute(
      resource: const ReportMeetingResource(),
      method: HTTPMethod.post,
      data: {
        'reportedId': reportedId,
        'sessionId': sessionId,
        'summary': summary,
        'detail': detail,
      },
    );
    return response.statusCode == 200 || response.statusCode == 201;
  }
}
