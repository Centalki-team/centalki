import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../entities/topic_suggestion_content_entity.dart';

abstract class TopicSuggestionRepository {
  Future<Either<AppException, List<TopicSuggestionContentEntity>>>
      getTopicSuggestionContents();
  Future<Either<AppException, bool>> sendTopicSuggetion(
      Map<String, dynamic> params);
}
