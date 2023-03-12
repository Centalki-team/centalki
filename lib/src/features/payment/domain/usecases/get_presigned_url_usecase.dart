import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../entities/payment_presigned_url.dart';
import '../repositories/payment_repository.dart';
import 'params/get_presigned_url_params.dart';

class PaymentGetPresignedUrlUseCase
    with
        UseCase<PaymentGetPresignedUrlParams,
            Either<AppException, PaymentPresignedUrlEntity>> {
  const PaymentGetPresignedUrlUseCase({
    required this.paymentRepository,
  });

  final PaymentRepository paymentRepository;

  @override
  Future<Either<AppException, PaymentPresignedUrlEntity>> execute(
          PaymentGetPresignedUrlParams params) =>
      paymentRepository.getPresignedUrl(
        params.toJson(),
      );
}
