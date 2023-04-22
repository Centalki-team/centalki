import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../entities/topic_feedback_options_entity.dart';
import '../entities/topic_feedback_response_entity.dart';

abstract class TopicReviewPagesRepository {
  Future<Either<AppException, TopicFeedbackOptionsEntity>>
      getTopicReviewPageContents();
  Future<Either<AppException, TopicFeedbackResponseEntity>> sendTopicFeedback(
      Map<String, dynamic> params);
}
