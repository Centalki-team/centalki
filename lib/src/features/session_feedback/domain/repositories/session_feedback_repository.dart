import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../entities/session_feedback_content_entity.dart';

abstract class SessionFeedbackRepository {
  Future<Either<AppException, SessionFeedbackContentEntity>>
      getSessionFeedbackContent();
}
