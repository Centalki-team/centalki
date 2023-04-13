import 'package:dartz/dartz.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../base/usecase/usecase.base.dart';
import '../repositories/bookmark_topic_repository.dart';
import 'params/delete_bookmark_topic_params.dart';

class DeleteBookmarkTopicUseCase
    with UseCase<DeleteBookmarkTopicParams, Either<AppException, bool>> {
  const DeleteBookmarkTopicUseCase({
    required this.bookmarkTopicRepository,
  });

  final BookmarkTopicRepository bookmarkTopicRepository;

  @override
  Future<Either<AppException, bool>> execute(
          DeleteBookmarkTopicParams params) =>
      bookmarkTopicRepository.deleteBookmarkTopic(params.toJson());
}
