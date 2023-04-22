import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../entities/topic_feedback_options_entity.dart';
import '../repositories/topic_review_pages_repository.dart';

class GetTopicReviewPageContentsUseCase
    with UseCase<void, Either<AppException, TopicFeedbackOptionsEntity>> {
  const GetTopicReviewPageContentsUseCase({
    required this.topicReviewPagesRepository,
  });

  final TopicReviewPagesRepository topicReviewPagesRepository;

  @override
  Future<Either<AppException, TopicFeedbackOptionsEntity>> execute(
          void params) =>
      topicReviewPagesRepository.getTopicReviewPageContents();
}
