import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../../../topics/domain/entities/topic_item_entity.dart';
import '../repositories/search_topics_repository.dart';
import 'params/search_topics_params.dart';

class SearchTopicsUseCase
    with UseCase<SearchTopicsParams, Either<AppException, TopicsListEntity>> {
  const SearchTopicsUseCase({
    required this.searchTopicsRepository,
  });

  final SearchTopicsRepository searchTopicsRepository;

  @override
  Future<Either<AppException, TopicsListEntity>> execute(
          SearchTopicsParams params) =>
      searchTopicsRepository.searchTopics(params.toJson());
}
