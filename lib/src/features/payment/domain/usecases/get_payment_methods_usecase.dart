import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../entities/payment_method_entity.dart';
import '../repositories/payment_repository.dart';

class GetPaymentMethodsUseCase
    with UseCase<void, Either<AppException, PaymentMethodInfoEntity>> {
  const GetPaymentMethodsUseCase({
    required this.paymentRepository,
  });

  final PaymentRepository paymentRepository;

  @override
  Future<Either<AppException, PaymentMethodInfoEntity>> execute(void params) =>
      paymentRepository.getPaymentMethods();
}
