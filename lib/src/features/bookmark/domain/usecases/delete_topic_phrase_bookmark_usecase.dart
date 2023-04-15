import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../repositories/bookmark_repository.dart';

class DeleteTopicPhraseBookmarkUseCase
    with UseCase<String, Either<AppException, bool>> {
  const DeleteTopicPhraseBookmarkUseCase({
    required this.bookmarkRepository,
  });

  final BookmarkRepository bookmarkRepository;

  @override
  Future<Either<AppException, bool>> execute(String params) =>
      bookmarkRepository.deleteBookmarkPhrase(params);
}
