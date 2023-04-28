import '../../../../../../../base/gateway/api_gateway.base.dart';
import '../../../../../../../config/app_config.dart';
import 'models/noti_list_item_model.dart';
import 'models/noti_list_response_model.dart';
import 'resources/noti_resource.dart';

class NotiRemoteDatasource {
  NotiRemoteDatasource();

  final _apiGatewayPublic = ApiGateway(
    AppConfig.value.baseUrl,
    apiType: ApiType.public,
  );

  final _apiGatewayUser = ApiGateway(
    AppConfig.value.baseUrl,
    apiType: ApiType.user,
  );

  Future<NotiListResponseModel> getNotiList(Map<String, dynamic> params) async {
    final response = await _apiGatewayUser.execute(
      resource: const NotificationListResource(),
      method: HTTPMethod.get,
      params: params,
    );
    return NotiListResponseModel.fromJson(response.data);
  }

  Future<NotiListItemModel> markSingleNotiAsRead(String params) async {
    final response = await _apiGatewayPublic.execute(
      resource: NotificationMarkReadSingleResource(params),
      method: HTTPMethod.put,
    );
    return NotiListItemModel.fromJson(response.data);
  }
}
