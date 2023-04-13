import 'package:dartz/dartz.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../base/usecase/usecase.base.dart';
import '../entities/bookmark_topic_entity.dart';
import '../repositories/bookmark_topic_repository.dart';

class GetBookmarkTopicsUseCase
    with UseCase<void, Either<AppException, List<BookmarkTopicEntity>>> {
  const GetBookmarkTopicsUseCase({
    required this.bookmarkTopicRepository,
  });

  final BookmarkTopicRepository bookmarkTopicRepository;

  @override
  Future<Either<AppException, List<BookmarkTopicEntity>>> execute(
          void params) =>
      bookmarkTopicRepository.getBookmarkTopics();
}
