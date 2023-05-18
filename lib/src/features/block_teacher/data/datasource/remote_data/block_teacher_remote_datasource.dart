import '../../../../../../base/gateway/api_gateway.base.dart';
import '../../../../../../config/app_config.dart';
import '../../../../../shared/extensions.dart';
import 'resources/block_teacher_resource.dart';

class BlockTeacherRemoteDatasource {
  BlockTeacherRemoteDatasource();

  final ApiGateway apiGateway =
      ApiGateway(AppConfig.value.baseUrl, apiType: ApiType.user);

  Future<bool> blockTeacher(String blockedId) async {
    final result = await apiGateway.execute(
      resource: const BlockTeacherResource(),
      method: HTTPMethod.post,
      data: {"blockedId": blockedId},
    );
    return result.isOk;
  }
}
