import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/manager/loading_manager.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/text.dart';
import '../../../../../base/define/theme.dart';
import '../../../../../base/widgets/dialog/error_dialog_content.dart';
import '../../../../../base/widgets/dialog/success_dialog_content.dart';
import '../../../../../generated/l10n.dart';
import '../blocs/payment_bloc/payment_bloc.dart';
import '../widgets/iap_card.dart';

class PaymentViewIAP extends StatefulWidget {
  const PaymentViewIAP({super.key});

  @override
  State<PaymentViewIAP> createState() => _PaymentViewIAPState();
}

class _PaymentViewIAPState extends State<PaymentViewIAP> {
  List<ProductDetails> products = [];
  Map<String, dynamic> productsDetail = {};

  @override
  Widget build(BuildContext context) => BlocListener<PaymentBloc, PaymentState>(
        listener: (context, state) {
          if (state is PaymentLoadingState || state is PaymentPurchasingState) {
            LoadingManager.setLoading(context, loading: true);
          } else {
            LoadingManager.setLoading(context, loading: false);
            if (state is PaymentLoadErrorState) {
              showDialog(
                context: context,
                builder: (_) => ErrorDialogContent(
                  title: TextDoc.txtUnknownError,
                  content: state.exception.displayMessage,
                ),
              );
            } else if (state is PaymentPurchasedErrorState) {
              showDialog(
                context: context,
                builder: (_) => ErrorDialogContent(
                  title: TextDoc.txtUnknownError,
                  content: state.exception.displayMessage,
                ),
              );
            } else if (state is PaymentLoadDoneState) {
              products = state.products.toList();
              productsDetail = Map.of(state.productsDetail);
            } else if (state is PaymentPurchasedDoneState) {
              showDialog(
                context: context,
                builder: (_) =>
                    const SuccessDialogContent(title: TextDoc.txtBuySuccess),
              );
            }
          }
        },
        child: Scaffold(
          backgroundColor: colorsByTheme(context).backgroundTheme,
          appBar: AppBar(
            title: Text(
              S.current.txtBuyMoreSessions,
              style: TextStyle(
                fontSize: headlineSmallSize,
                fontWeight: headlineSmallWeight,
                color: colorsByTheme(context).defaultFont,
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
                horizontal: spacing24, vertical: padding16),
            child: BlocBuilder<PaymentBloc, PaymentState>(
              builder: (context, state) {
                if (state is PaymentLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: spacing20),
                  itemBuilder: (context, index) => IAPCard(
                    product: products[index],
                    productsDetail: productsDetail,
                    onPress: () {
                      context
                          .read<PaymentBloc>()
                          .add(PaymentPurchaseEvent(product: products[index]));
                    },
                  ),
                );
              },
            ),
          ),
        ),
      );
}
