import 'package:dartz/dartz.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../repositories/payment_repository.dart';

class VerifyPurchaseUseCase
    with UseCase<PurchaseDetails, Either<AppException, bool>> {
  const VerifyPurchaseUseCase({
    required this.paymentRepository,
  });

  final PaymentRepository paymentRepository;

  @override
  Future<Either<AppException, bool>> execute(PurchaseDetails params) =>
      paymentRepository.verifyPurchase(params);
}
