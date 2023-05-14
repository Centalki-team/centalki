import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../repositories/topic_suggestion_repository.dart';
import 'params/send_topic_suggestion_params.dart';

class SendTopicSuggestionUseCase
    with UseCase<SendTopicSuggestionParams, Either<AppException, bool>> {
  const SendTopicSuggestionUseCase({
    required this.topicSuggestionRepository,
  });

  final TopicSuggestionRepository topicSuggestionRepository;

  @override
  Future<Either<AppException, bool>> execute(
          SendTopicSuggestionParams params) =>
      topicSuggestionRepository.sendTopicSuggetion(params.toJson());
}
