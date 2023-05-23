import 'package:dartz/dartz.dart';
import 'package:in_app_purchase_platform_interface/src/types/purchase_details.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../di/di_module.dart';
import '../../domain/entities/payment_method_entity.dart';
import '../../domain/entities/payment_presigned_url.dart';
import '../../domain/repositories/payment_repository.dart';
import '../datasources/remote_data/payment_remote_datasource.dart';
import '../datasources/remote_data/payment_remote_datasource_auth_required.dart';

class PaymentRepositoryImpl extends PaymentRepository {
  PaymentRepositoryImpl();

  final PaymentRemoteDatasource paymentRemoteDatasource =
      getIt.get<PaymentRemoteDatasource>();
  final PaymentRemoteDatasourceAuthRequired
      paymentRemoteDatasourceAuthRequired =
      getIt.get<PaymentRemoteDatasourceAuthRequired>();

  @override
  Future<Either<AppException, PaymentPresignedUrlEntity>> getPresignedUrl(
      Map<String, dynamic> params) async {
    try {
      final result = await paymentRemoteDatasource.getPresignedUrl(params);
      return Right(result);
    } on AppException catch (s) {
      return Left(s);
    } catch (err) {
      return Left(
        AppException(
          error: err,
        ),
      );
    }
  }

  @override
  Future<Either<AppException, bool>> createReceipt(
      Map<String, dynamic> params) async {
    try {
      final result = await paymentRemoteDatasourceAuthRequired
          .createPaymentReceipt(params);
      if (!result) {
        return const Left(AppException());
      }
      return Right(result);
    } on AppException catch (s) {
      return Left(s);
    } catch (err) {
      return Left(
        AppException(
          error: err,
        ),
      );
    }
  }

  @override
  Future<Either<AppException, PaymentMethodInfoEntity>>
      getPaymentMethods() async {
    try {
      final result = await paymentRemoteDatasource.getPaymentMethods();
      return Right(result);
    } on AppException catch (s) {
      return Left(s);
    } catch (err) {
      return Left(
        AppException(
          error: err,
        ),
      );
    }
  }

  @override
  Future<Either<AppException, bool>> verifyPurchase(
      PurchaseDetails purchaseDetails) async {
    try {
      final result = await paymentRemoteDatasourceAuthRequired
          .verifyPurchase(purchaseDetails);
      return Right(result);
    } on AppException catch (s) {
      return Left(s);
    } catch (err) {
      return const Left(
        AppException(
          displayMessage: 'Something went wrong. Please try again later.',
        ),
      );
    }
  }
}
