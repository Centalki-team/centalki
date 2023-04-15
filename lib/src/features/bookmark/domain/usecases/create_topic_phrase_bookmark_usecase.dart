import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../entities/bookmark_phrase_entity.dart';
import '../repositories/bookmark_repository.dart';
import 'params/create_topic_phrase_bookmark_params.dart';

class CreateTopicPhraseBookmarkUseCase
    with
        UseCase<CreateTopicPhraseBookmarkParams,
            Either<AppException, BookmarkPhraseEntity>> {
  const CreateTopicPhraseBookmarkUseCase({
    required this.bookmarkRepository,
  });

  final BookmarkRepository bookmarkRepository;

  @override
  Future<Either<AppException, BookmarkPhraseEntity>> execute(
          CreateTopicPhraseBookmarkParams params) =>
      bookmarkRepository.createBookmarkPhrase(params.toJson());
}
