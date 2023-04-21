import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../di/di_module.dart';
import '../../domain/entities/session_feedback_content_entity.dart';
import '../../domain/repositories/session_feedback_repository.dart';
import '../datasources/remote_data/session_feedback_remote_datasource.dart';

class SessionFeedbackRepositoryImpl extends SessionFeedbackRepository {
  SessionFeedbackRepositoryImpl();

  final SessionFeedbackRemoteDatasource sessionFeedbackRemoteDatasource =
      getIt.get<SessionFeedbackRemoteDatasource>();

  @override
  Future<Either<AppException, SessionFeedbackContentEntity>>
      getSessionFeedbackContent() async {
    try {
      final result =
          await sessionFeedbackRemoteDatasource.getSessionFeedbackContent();
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    } catch (s) {
      return Left(
        AppException(
          error: s,
          displayMessage: 'Lỗi lấy session feedback content',
        ),
      );
    }
  }
}
