import 'package:in_app_purchase/in_app_purchase.dart';

Future<bool> handlePurchase(ProductDetails productDetails) async {
  await InAppPurchase.instance.restorePurchases();
  final purchaseParam = PurchaseParam(productDetails: productDetails);
  return await InAppPurchase.instance
      .buyConsumable(purchaseParam: purchaseParam);
}

Future<List<ProductDetails>> getProducts() async {
  final available = await InAppPurchase.instance.isAvailable();
  if (available) {
    print('Payment platform is ready and available.');
  } else {
    print('Payment platform is NOT ready and available.');
  }
  const kIds = <String>{
    'com.centalki.app.one_session',
    'com.centalki.app.six_session'
  };
  final response = await InAppPurchase.instance.queryProductDetails(kIds);
  var products = response.productDetails;
  print('products:$products');
  return products;
}
