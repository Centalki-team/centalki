import '../../../../../../../base/gateway/api_gateway.base.dart';
import '../../../../../../../config/app_config.dart';
import 'models/self_level_model.dart';
import 'resources/self_review_resources.dart';

class SelfReviewRemoteDatasource {
  SelfReviewRemoteDatasource();

  final ApiGateway _apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    apiType: ApiType.public,
  );

  Future<List<SelfLevelModel>> getLevelLists() async {
    final response = await _apiGateway.execute(
      resource: const SelfReviewLevelsResource(),
      method: HTTPMethod.get,
    );
    return (response.data as List<dynamic>)
        .map((e) => SelfLevelModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
