import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../entities/session_feedback_content_entity.dart';
import '../repositories/session_feedback_repository.dart';

class GetSessionFeedbackContentUseCase
    with UseCase<void, Either<AppException, SessionFeedbackContentEntity>> {
  const GetSessionFeedbackContentUseCase({
    required this.sessionFeedbackRepository,
  });

  final SessionFeedbackRepository sessionFeedbackRepository;

  @override
  Future<Either<AppException, SessionFeedbackContentEntity>> execute(
          void params) =>
      sessionFeedbackRepository.getSessionFeedbackContent();
}
