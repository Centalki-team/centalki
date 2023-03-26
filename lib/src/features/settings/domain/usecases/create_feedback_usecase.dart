import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../repositories/feedback_repository.dart';
import 'create_feedback_params.dart';

class CreateFeedbackUseCase
    with UseCase<CreateFeedbackParams, Either<AppException, bool>> {
  const CreateFeedbackUseCase({
    required this.feedbackRepository,
  });

  final FeedbackRepository feedbackRepository;

  @override
  Future<Either<AppException, bool>> execute(CreateFeedbackParams params) =>
      feedbackRepository.createFeedback(params.feedback);
}
