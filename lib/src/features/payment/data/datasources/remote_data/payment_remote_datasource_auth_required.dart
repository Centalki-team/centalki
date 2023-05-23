import 'dart:io';

import 'package:in_app_purchase/in_app_purchase.dart';

import '../../../../../../base/gateway/api_gateway.base.dart';
import '../../../../../../config/app_config.dart';
import '../../../../../shared/extensions.dart';
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

  Future<bool> verifyPurchase(PurchaseDetails purchaseDetails) async {
    final endpoint = Platform.isIOS
        ? const PaymentVerifyApplePurchaseResource()
        : const PaymentVerifyGooglePurchaseResource();
    final response = await apiGateway.execute(
      resource: endpoint,
      method: HTTPMethod.post,
      data: {
        'source': purchaseDetails.verificationData.source,
        'productId': purchaseDetails.productID,
        'verificationData':
            purchaseDetails.verificationData.serverVerificationData,
      },
    );
    return response.statusCode == 201;
  }
}
