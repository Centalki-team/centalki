import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../di/di_module.dart';
import '../../domain/repositories/feedback_repository.dart';
import '../datasources/remote_data/feedback_remote_datasource.dart';

class FeedbackRepositoryImpl extends FeedbackRepository {
  FeedbackRepositoryImpl();

  final FeedbackRemoteDatasource feedbackRemoteDatasource =
      getIt.get<FeedbackRemoteDatasource>();

  @override
  Future<Either<AppException, bool>> createFeedback(
      Map<String, dynamic> feedback) async {
    try {
      final result = await feedbackRemoteDatasource.createFeedback(feedback);
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    } on Exception catch (s) {
      return Left(AppException(
        error: s,
        displayMessage: "Gửi feedback không thành công",
      ));
    }
  }
}
