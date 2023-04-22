import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../entities/topic_feedback_response_entity.dart';
import '../repositories/topic_review_pages_repository.dart';
import 'params/send_topic_feedback_params.dart';

class SendTopicFeedbackUseCase
    with
        UseCase<SendTopicFeedbackParams,
            Either<AppException, TopicFeedbackResponseEntity>> {
  const SendTopicFeedbackUseCase({
    required this.topicReviewPagesRepository,
  });

  final TopicReviewPagesRepository topicReviewPagesRepository;

  @override
  Future<Either<AppException, TopicFeedbackResponseEntity>> execute(
          SendTopicFeedbackParams params) =>
      topicReviewPagesRepository.sendTopicFeedback(params.toJson());
}
