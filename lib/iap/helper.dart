import 'package:in_app_purchase/in_app_purchase.dart';

import '../base/temp_dio/dio_client.dart';

void listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
  purchaseDetailsList.forEach((purchaseDetails) async {
    if (purchaseDetails.status == PurchaseStatus.pending) {
      // _showPendingUI();
    } else {
      if (purchaseDetails.status == PurchaseStatus.error) {
        // _handleError(purchaseDetails.error!);
      } else if (purchaseDetails.status == PurchaseStatus.purchased ||
          purchaseDetails.status == PurchaseStatus.restored) {
        bool valid = await DioClient.verifyPurchase(purchaseDetails);
        if (valid) {
          await InAppPurchase.instance.completePurchase(purchaseDetails);
        }
        // if (valid) {
        //   _deliverProduct(purchaseDetails);
        // } else {
        //   _handleInvalidPurchase(purchaseDetails);
        // }
      }
      if (purchaseDetails.pendingCompletePurchase) {
        await InAppPurchase.instance.completePurchase(purchaseDetails);
      }
    }
  });
}

Future<bool> handlePurchase(ProductDetails productDetails) async {
  final purchaseParam = PurchaseParam(productDetails: productDetails);
  return await InAppPurchase.instance
      .buyConsumable(purchaseParam: purchaseParam);
}

Future<List<ProductDetails>> getProducts() async {
  const kIds = <String>{
    'com.centalki.app.one_session',
    'com.centalki.app.six_session'
  };
  final response = await InAppPurchase.instance.queryProductDetails(kIds);
  var products = response.productDetails;
  return products;
}
