import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../entities/topic_item_entity.dart';
import '../repositories/topic_repository.dart';

class GetTopicsUseCase
    with UseCase<void, Either<AppException, List<TopicItemEntity>>> {
  const GetTopicsUseCase({
    required this.topicRepository,
  });

  final TopicRepository topicRepository;

  @override
  Future<Either<AppException, List<TopicItemEntity>>> execute(void params) =>
      topicRepository.getTopics();
}
