import 'package:dartz/dartz.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../base/usecase/usecase.base.dart';
import '../repositories/bookmark_topic_repository.dart';

class DeleteBookmarkTopicUseCase
    with UseCase<String, Either<AppException, bool>> {
  const DeleteBookmarkTopicUseCase({
    required this.bookmarkTopicRepository,
  });

  final BookmarkTopicRepository bookmarkTopicRepository;

  @override
  Future<Either<AppException, bool>> execute(String params) =>
      bookmarkTopicRepository.deleteBookmarkTopic(params);
}
