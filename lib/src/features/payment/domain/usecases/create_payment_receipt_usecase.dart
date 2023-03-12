import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../repositories/payment_repository.dart';
import 'params/create_payment_receipt_params.dart';

class PaymentCreateReceiptUseCase
    with UseCase<CreatePaymentReceiptParams, Either<AppException, bool>> {
  const PaymentCreateReceiptUseCase({
    required this.paymentRepository,
  });

  final PaymentRepository paymentRepository;

  @override
  Future<Either<AppException, bool>> execute(
      CreatePaymentReceiptParams params) {
    // TODO: implement execute
    throw UnimplementedError();
  }
}
