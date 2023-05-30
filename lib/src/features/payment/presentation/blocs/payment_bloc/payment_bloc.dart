import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../base/helpers/iap.dart';
import '../../../../../../di/di_module.dart';
import '../../../../../../generated/l10n.dart';
import '../../../domain/repositories/payment_repository.dart';
import '../../../domain/usecases/verify_purchase_usecase.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentInitState()) {
    on<PaymentInitEvent>(_onInit);
    on<PaymentGetProductsEvent>(_onGetProducts);
    on<PaymentPurchaseEvent>(_onPurchase);
    on<PaymentCancelPurchaseEvent>(_onCancelPurchase);
    on<PaymentOccurErrorEvent>(_onOccurError);
    on<PaymentVerifyPurchaseEvent>(_onVerifyPurchase);
    on<PaymentCompletePurchaseEvent>(_onCompletePurchase);
  }

  late StreamSubscription<List<PurchaseDetails>> _subscription;
  final productsDetail = {
    'com.centalki.app.one_session': {
      'options': S.current.txtMostPopular,
      'color': AppColor.tertiary,
      'name': S.current.txtOneSession,
      'desc': [
        S.current.txtOneSessionLearningTime,
        S.current.txtQualityVideoCall
      ],
      'save': '',
    },
    'com.centalki.app.six_session': {
      'options': S.current.txtBestValue,
      'color': AppColor.secondary,
      'name': S.current.txtSixSessions,
      'desc': [
        S.current.txtSixSessionsLearningTime,
        S.current.txtQualityVideoCall
      ],
      'save': S.current.txtSave16Percent,
    },
  };
  final VerifyPurchaseUseCase verifyPurchaseUseCase = VerifyPurchaseUseCase(
    paymentRepository: getIt.get<PaymentRepository>(),
  );

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }

  void _onInit(PaymentInitEvent event, emit) {
    emit(const PaymentInitState());
    add(const PaymentGetProductsEvent());
    final purchaseUpdated = InAppPurchase.instance.purchaseStream;
    _subscription = purchaseUpdated.listen((purchaseDetailsList) async {
      for (var purchaseDetails in purchaseDetailsList) {
        if (purchaseDetails.status == PurchaseStatus.pending) {
        } else {
          if (purchaseDetails.status == PurchaseStatus.error) {
            add(
              PaymentOccurErrorEvent(
                AppException(
                  displayMessage:
                      'Purchase error: ${purchaseDetails.error?.message}',
                ),
              ),
            );
          } else if (purchaseDetails.status == PurchaseStatus.purchased ||
              purchaseDetails.status == PurchaseStatus.restored) {
            add(PaymentVerifyPurchaseEvent(purchaseDetails));
          } else if (purchaseDetails.status == PurchaseStatus.canceled) {
            add(const PaymentCancelPurchaseEvent());
          } else if (purchaseDetails.pendingCompletePurchase) {
            add(PaymentCompletePurchaseEvent(purchaseDetails));
          }
        }
      }
    }, onDone: () {
      _subscription.cancel();
    }, onError: (error) {
      // handle error here.
      add(
        PaymentOccurErrorEvent(
          AppException(
            displayMessage: 'Purchase error: $error',
          ),
        ),
      );
    });
  }

  void _onGetProducts(PaymentGetProductsEvent event, emit) async {
    emit(const PaymentLoadingState());

    final products = await getProducts();

    emit(
      PaymentLoadDoneState(
        products: products,
        productsDetail: productsDetail,
      ),
    );
  }

  void _onPurchase(PaymentPurchaseEvent event, emit) async {
    emit(const PaymentPurchasingState());
    try {
      await handlePurchase(event.product);
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    } finally {
      add(const PaymentCancelPurchaseEvent());
    }
  }

  void _onCancelPurchase(PaymentCancelPurchaseEvent event, emit) async {
    emit(const PaymentPurchasedCancelledState());
  }

  void _onOccurError(PaymentOccurErrorEvent event, emit) async {
    emit(PaymentPurchasedErrorState(event.exception));
  }

  void _onVerifyPurchase(PaymentVerifyPurchaseEvent event, emit) async {
    emit(const PaymentPurchasingState());
    final res = await verifyPurchaseUseCase.execute(event.purchaseDetails);
    res.fold(
      (l) => emit(
        PaymentPurchasedErrorState(l),
      ),
      (r) {
        if (r) {
          add(PaymentCompletePurchaseEvent(event.purchaseDetails));
          return;
        } else {
          add(
            const PaymentOccurErrorEvent(
              AppException(
                displayMessage: 'Purchase is not valid.',
              ),
            ),
          );
          return;
        }
      },
    );
  }

  void _onCompletePurchase(PaymentCompletePurchaseEvent event, emit) async {
    try {
      await InAppPurchase.instance.completePurchase(event.purchaseDetails);
      emit(const PaymentPurchasedDoneState());
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
  }
}
