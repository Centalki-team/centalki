import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../entities/bookmark_phrase_entity.dart';
import '../entities/bookmark_phrase_item_entity.dart';

abstract class BookmarkRepository {
  Future<Either<AppException, BookmarkPhraseEntity>> createBookmarkPhrase(
      Map<String, dynamic> params);
  Future<Either<AppException, bool>> deleteBookmarkPhrase(String params);
  Future<Either<AppException, List<BookmarkVocabsItemEntity>>>
      getUserBookmarkVocabs();
}
