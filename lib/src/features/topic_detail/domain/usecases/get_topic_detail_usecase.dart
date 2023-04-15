import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../entities/topic_detail_entity.dart';
import '../repositories/topic_detail_repository.dart';

class GetTopicDetailUseCase
    with UseCase<String, Either<AppException, TopicDetailEntity>> {
  const GetTopicDetailUseCase({
    required this.topicDetailRepository,
  });

  final TopicDetailRepository topicDetailRepository;

  @override
  Future<Either<AppException, TopicDetailEntity>> execute(String params) =>
      topicDetailRepository.getTopicDetail(params);
}
