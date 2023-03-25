import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/manager/loading_manager.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/text.dart';
import '../../../../../base/widgets/buttons/button.dart';
import '../../../../../base/widgets/toast/app_toast.dart';
import '../../domain/entities/payment_method_entity.dart';
import '../blocs/payment_bloc/payment_bloc.dart';
import '../widgets/add_photo_button.dart';
import '../widgets/payment_selection_group.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  final methods = const <PaymentMethodEntity>[
    PaymentMethodEntity(
      methodName: 'MoMo',
      methodId: 'MomoMethod',
      methodType: PaymentMethodEnum.momo,
    ),
    PaymentMethodEntity(
      methodName: 'Banking',
      methodId: 'BankingMethod',
      methodType: PaymentMethodEnum.credit,
    ),
    PaymentMethodEntity(
      methodName: 'Paypal',
      methodId: 'PaypalMethod',
      methodType: PaymentMethodEnum.paypal,
    ),
  ];
  late ValueNotifier<PaymentMethodEntity> selectedPaymentMethod;
  late ValueNotifier<XFile?> paymentBill;

  @override
  void initState() {
    super.initState();
    selectedPaymentMethod = ValueNotifier<PaymentMethodEntity>(methods[0]);
    paymentBill = ValueNotifier<XFile?>(null);
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormat =
        NumberFormat.currency(locale: 'vi_VN', symbol: 'VND');
    return BlocListener<PaymentBloc, PaymentState>(
      listener: (context, state) {
        if (state is PaymentLoadingState) {
          LoadingManager.setLoading(context, loading: state.showLoading);
        } else if (state is PaymentErrorState) {
          AppToast(
            mode: AppToastMode.error,
            duration: const Duration(seconds: 3),
            bottomOffset: 8.0,
            message: Text(
              state.displayMessage ?? state.exception.displayMessage,
              style: const TextStyle(
                fontSize: bodyLargeSize,
                fontWeight: bodyLargeWeight,
                color: AppColor.white,
              ),
            ),
          ).show(context);
        } else if (state is PaymentCreateReceiptErrorState) {
          Navigator.of(context).pop(false);
        } else if (state is PaymentCreateReceiptDoneState) {
          Navigator.of(context).pop(true);
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.white,
        bottomNavigationBar: Material(
          elevation: 10.0,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
          child: ValueListenableBuilder(
            valueListenable: paymentBill,
            builder: (_, value, __) {
              if (value != null) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14.0,
                    horizontal: 16.0,
                  ),
                  child: Material(
                    child: SafeArea(
                      top: false,
                      child: AppFilledButton(
                        text: TextDoc.txtUpload,
                        minimumSize: const Size.fromHeight(48),
                        onPressed: () => context
                            .read<PaymentBloc>()
                            .add(PaymentCreateReceiptEvent(
                              img: value,
                            )),
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar.medium(
              title: const Text(
                TextDoc.txtBuyMoreSessions,
                style: TextStyle(
                  fontSize: headlineSmallSize,
                  fontWeight: headlineSmallWeight,
                  color: AppColor.defaultFont,
                  height: 32 / 34,
                ),
              ),
              centerTitle: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (_, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: padding16,
                    vertical: padding24,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          TextDoc.txtChoosePaymentMethod,
                          style: TextStyle(
                            fontSize: titleSmallSize,
                            fontWeight: titleSmallWeight,
                            color: AppColor.defaultFont,
                            height: 20 / 22,
                          ),
                        ),
                        const SizedBox(
                          height: spacing12,
                        ),
                        SizedBox(
                          height: 106.0,
                          child: PaymentSelectionGroup(
                            initValue: selectedPaymentMethod.value,
                            methodsList: methods,
                            onChanged: (value) =>
                                selectedPaymentMethod.value = value,
                          ),
                        ),
                        const SizedBox(
                          height: spacing16,
                        ),
                        const Text(
                          TextDoc.txtPaymentInformation,
                          style: TextStyle(
                            fontSize: titleMediumSize,
                            fontWeight: titleMediumWeight,
                            color: Colors.black,
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(
                          height: spacing8,
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: ValueListenableBuilder(
                            valueListenable: selectedPaymentMethod,
                            builder: (_, value, __) => QrImage(
                              data: value.methodId,
                              size: 160.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: spacing8,
                        ),
                        const Text(
                          TextDoc.txtInstructions,
                          style: TextStyle(
                            fontSize: titleMediumSize,
                            fontWeight: titleMediumWeight,
                            color: Colors.black,
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(
                          height: spacing8,
                        ),
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '${TextDoc.txtPricePerSessionAnnounce} ',
                                style: TextStyle(
                                  fontSize: bodySmallSize,
                                  fontWeight: bodySmallWeight,
                                  color: AppColor.defaultFont,
                                  height: 16 / 20,
                                ),
                              ),
                              TextSpan(
                                text: '100,000 VNĐ.',
                                style: TextStyle(
                                  fontSize: labelMediumSize,
                                  fontWeight: labelMediumWeight,
                                  color: AppColor.defaultFont,
                                  height: 16 / 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: spacing8,
                        ),
                        const Text(
                          TextDoc.txtPaymentInstructionDetail,
                          style: TextStyle(
                            fontSize: bodySmallSize,
                            fontWeight: bodySmallWeight,
                            color: AppColor.defaultFont,
                            height: 16 / 20,
                          ),
                        ),
                        const SizedBox(
                          height: spacing16,
                        ),
                        const Text(
                          TextDoc.txtPaymentBillUpload,
                          style: TextStyle(
                            fontSize: titleMediumSize,
                            fontWeight: titleMediumWeight,
                            color: Colors.black,
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(
                          height: spacing8,
                        ),
                        AddPhotoButton(
                          onTap: (image) {
                            paymentBill.value = image;
                          },
                        ),
                        const SizedBox(
                          height: spacing16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
