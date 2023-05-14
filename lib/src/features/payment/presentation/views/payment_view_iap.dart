import 'dart:async';

import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:intl/intl.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/manager/loading_manager.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/text.dart';
import '../../../../../base/helpers/iap.dart';
import '../../../../../base/temp_dio/dio_client.dart';
import '../../../../../base/widgets/dialog/error_dialog_content.dart';
import '../../../../../base/widgets/dialog/success_dialog_content.dart';
import '../widgets/iap_card.dart';

class PaymentViewIAP extends StatefulWidget {
  const PaymentViewIAP({super.key});

  @override
  State<PaymentViewIAP> createState() => _PaymentViewIAPState();
}

class _PaymentViewIAPState extends State<PaymentViewIAP> {
  late StreamSubscription<List<PurchaseDetails>> _subscription;

  _initPurchaseSubscription() async {
    final purchaseUpdated = InAppPurchase.instance.purchaseStream;
    _subscription =
        purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailsList) {
      purchaseDetailsList.forEach((purchaseDetails) async {
        LoadingManager.setLoading(context, loading: true);
        if (purchaseDetails.status == PurchaseStatus.pending) {
          // _showPendingUI();
        } else {
          if (purchaseDetails.status == PurchaseStatus.error) {
            showDialog(
              context: context,
              builder: (context) => const ErrorDialogContent(
                title: TextDoc.txtUnknownError,
              ),
            );
          } else if (purchaseDetails.status == PurchaseStatus.purchased ||
              purchaseDetails.status == PurchaseStatus.restored) {
            bool valid = await DioClient.verifyPurchase(purchaseDetails);
            if (valid) {
              await InAppPurchase.instance.completePurchase(purchaseDetails);
              showDialog(
                context: context,
                builder: (context) => const SuccessDialogContent(
                  title: TextDoc.txtBuySuccess,
                ),
              );
            } else {
              showDialog(
                context: context,
                builder: (context) => const ErrorDialogContent(
                  title: TextDoc.txtUnknownError,
                ),
              );
            }
          }
          if (purchaseDetails.pendingCompletePurchase) {
            await InAppPurchase.instance.completePurchase(purchaseDetails);
          }
        }
        // ignore: use_build_context_synchronously
        LoadingManager.setLoading(context, loading: false);
      });
    }, onDone: () {
      _subscription.cancel();
    }, onError: (error) {
      // handle error here.
    });
  }

  @override
  void initState() {
    _initPurchaseSubscription();
    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormat =
        NumberFormat.currency(locale: 'vi_VN', symbol: 'VND');
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        TextDoc.txtBuyMoreSessions,
        style: TextStyle(
          fontSize: headlineSmallSize,
          fontWeight: headlineSmallWeight,
          color: AppColor.defaultFont,
        ),
      )),
      body: FutureBuilder(
          future: getProducts(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: snapshot.data?.length ?? 0,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: spacing8),
                  itemBuilder: (context, index) {
                    final product = snapshot.data![index];
                    return IAPCard(
                      title: product.title,
                      priceFormat: currencyFormat.format(product.rawPrice),
                      description: product.description,
                      onPress: () async {
                        LoadingManager.setLoading(context, loading: true);
                        await handlePurchase(product);
                        // ignore: use_build_context_synchronously
                        LoadingManager.setLoading(context, loading: false);
                      },
                    );
                  });
            }
          }),
    );
  }
}
