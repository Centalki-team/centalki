import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../entities/topic_suggestion_content_entity.dart';
import '../repositories/topic_suggestion_repository.dart';

class GetTopicSuggestionContentsUseCase
    with
        UseCase<void,
            Either<AppException, List<TopicSuggestionContentEntity>>> {
  const GetTopicSuggestionContentsUseCase({
    required this.topicSuggestionRepository,
  });

  final TopicSuggestionRepository topicSuggestionRepository;

  @override
  Future<Either<AppException, List<TopicSuggestionContentEntity>>> execute(
          void params) =>
      topicSuggestionRepository.getTopicSuggestionContents();
}
