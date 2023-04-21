import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../repositories/session_feedback_repository.dart';
import 'params/create_session_feedback_params.dart';

class CreateSessionFeedbackUseCase
    with UseCase<CreateSessionFeedbackParams, Either<AppException, bool>> {
  const CreateSessionFeedbackUseCase({
    required this.sessionFeedbackRepository,
  });

  final SessionFeedbackRepository sessionFeedbackRepository;

  @override
  Future<Either<AppException, bool>> execute(
          CreateSessionFeedbackParams params) =>
      sessionFeedbackRepository.createStudentSessionFeedback(params.toJson());
}
