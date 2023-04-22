import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../di/di_module.dart';
import '../../domain/entities/topic_feedback_options_entity.dart';
import '../../domain/entities/topic_feedback_response_entity.dart';
import '../../domain/repositories/topic_review_pages_repository.dart';
import '../datasources/topic_review_page_content/remote_data/topic_review_page_content_remote_datasrc.dart';

class TopicReviewPagesRepositoryImpl extends TopicReviewPagesRepository {
  TopicReviewPagesRepositoryImpl();

  final _topicReviewPageContentsRemoteDatasrc =
      getIt.get<TopicReviewPageContentsRemoteDatasrc>();

  @override
  Future<Either<AppException, TopicFeedbackOptionsEntity>>
      getTopicReviewPageContents() async {
    try {
      final res =
          await _topicReviewPageContentsRemoteDatasrc.getTopicFeedbackOptions();
      return Right(res);
    } on AppException catch (s) {
      return Left(s);
    } catch (e) {
      return Left(AppException(
        error: e,
      ));
    }
  }

  @override
  Future<Either<AppException, TopicFeedbackResponseEntity>> sendTopicFeedback(
      Map<String, dynamic> params) async {
    try {
      final res =
          await _topicReviewPageContentsRemoteDatasrc.sendTopicFeedback(params);
      return Right(res);
    } on AppException catch (s) {
      return Left(s);
    } catch (e) {
      return Left(AppException(
        error: e,
      ));
    }
  }
}
