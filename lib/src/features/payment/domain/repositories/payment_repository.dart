import 'package:dartz/dartz.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../entities/payment_method_entity.dart';
import '../entities/payment_presigned_url.dart';

abstract class PaymentRepository {
  Future<Either<AppException, PaymentPresignedUrlEntity>> getPresignedUrl(
      Map<String, dynamic> params);
  Future<Either<AppException, bool>> createReceipt(Map<String, dynamic> params);
  Future<Either<AppException, PaymentMethodInfoEntity>> getPaymentMethods();
  Future<Either<AppException, bool>> verifyPurchase(PurchaseDetails purchaseDetails);
}
