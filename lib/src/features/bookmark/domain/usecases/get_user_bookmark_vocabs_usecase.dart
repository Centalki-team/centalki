import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../entities/bookmark_phrase_item_entity.dart';
import '../repositories/bookmark_repository.dart';

class GetUserBookmarkVocabsUseCase
    with UseCase<void, Either<AppException, List<BookmarkVocabsItemEntity>>> {
  const GetUserBookmarkVocabsUseCase({
    required this.bookmarkRepository,
  });

  final BookmarkRepository bookmarkRepository;

  @override
  Future<Either<AppException, List<BookmarkVocabsItemEntity>>> execute(
          void params) =>
      bookmarkRepository.getUserBookmarkVocabs();
}
