import '../../../../../../base/gateway/api_gateway.base.dart';
import '../../../../../../config/app_config.dart';
import 'resources/payment_resource.dart';

class PaymentRemoteDatasourceAuthRequired {
  PaymentRemoteDatasourceAuthRequired();

  final apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    apiType: ApiType.user,
  );

  Future<bool> createPaymentReceipt(Map<String, dynamic> params) async {
    final response = await apiGateway.execute(
      resource: const PaymentCreateReceiptResource(),
      method: HTTPMethod.post,
      data: params,
    );
    return response.statusCode == 200 || response.statusCode == 201;
  }
}
