import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../entities/topic_item_entity.dart';
import '../repositories/topic_repository.dart';
import 'params/get_topics_params.dart';

class GetTopicsUseCase
    with UseCase<GetTopicsParams, Either<AppException, TopicsListEntity>> {
  const GetTopicsUseCase({
    required this.topicRepository,
  });

  final TopicRepository topicRepository;

  @override
  Future<Either<AppException, TopicsListEntity>> execute(
          GetTopicsParams params) =>
      topicRepository.getTopics(params.toJson());
}
