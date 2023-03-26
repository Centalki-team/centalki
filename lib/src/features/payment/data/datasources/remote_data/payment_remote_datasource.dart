import '../../../../../../base/gateway/api_gateway.base.dart';
import '../../../../../../config/app_config.dart';
import 'models/payment_info.dart';
import 'models/payment_presigned_url.dart';
import 'resources/payment_resource.dart';

class PaymentRemoteDatasource {
  PaymentRemoteDatasource();

  final apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    apiType: ApiType.public,
  );

  Future<PaymentPresignedUrlModel> getPresignedUrl(
      Map<String, dynamic> params) async {
    final response = await apiGateway.execute(
      resource: const PaymentGetPresignedUrlResource(),
      method: HTTPMethod.post,
      data: params,
    );
    return PaymentPresignedUrlModel.fromJson(response.data);
  }

  Future<PaymentMethodInfoModel> getPaymentMethods() async {
    final response = await apiGateway.execute(
      resource: const PaymentInfoResource(),
      method: HTTPMethod.get,
    );
    return PaymentMethodInfoModel.fromJson(response.data);
  }
}
