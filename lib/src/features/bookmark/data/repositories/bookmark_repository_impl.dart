import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../di/di_module.dart';
import '../../domain/entities/bookmark_phrase_entity.dart';
import '../../domain/repositories/bookmark_repository.dart';
import '../datasources/bookmark_datasrc/remote_data/bookmark_remote_datasrc.dart';

class BookmarkRepositoryImpl extends BookmarkRepository {
  BookmarkRepositoryImpl();

  final _bookmarkRemoteDatasrc = getIt.get<BookmarkRemoteDatasource>();

  @override
  Future<Either<AppException, BookmarkPhraseEntity>> createBookmarkPhrase(
      Map<String, dynamic> params) async {
    try {
      final res = await _bookmarkRemoteDatasrc.createPhraseBookmark(params);
      return Right(res);
    } on AppException catch (s) {
      return Left(s);
    } catch (e) {
      return Left(AppException(
        error: e,
      ));
    }
  }
  
  @override
  Future<Either<AppException, bool>> deleteBookmarkPhrase(String params) async {
    try {
      final res = await _bookmarkRemoteDatasrc.deletePhraseBookmark(params);
      return Right(res);
    } on AppException catch (s) {
      return Left(s);
    } catch (e) {
      return Left(AppException(
        error: e,
      ));
    }
  }
}
