import 'package:dartz/dartz.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../base/usecase/usecase.base.dart';
import '../repositories/bookmark_topic_repository.dart';
import 'params/create_bookmark_topic_params.dart';

class CreateBookmarkTopicUseCase
    with UseCase<CreateBookmarkTopicParams, Either<AppException, bool>> {
  const CreateBookmarkTopicUseCase({
    required this.bookmarkTopicRepository,
  });

  final BookmarkTopicRepository bookmarkTopicRepository;

  @override
  Future<Either<AppException, bool>> execute(
          CreateBookmarkTopicParams params) =>
      bookmarkTopicRepository.createBookmarkTopic(params.toJson());
}
