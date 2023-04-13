import 'package:dartz/dartz.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../../di/di_module.dart';
import '../../domain/entities/bookmark_topic_entity.dart';
import '../../domain/repositories/bookmark_topic_repository.dart';
import '../datasources/remote_data/bookmark_topic_remote_datasource.dart';

class BookmarkTopicRepositoryImpl extends BookmarkTopicRepository {
  BookmarkTopicRepositoryImpl();

  final BookmarkTopicRemoteDatasource bookmarkTopicRemoteDatasource =
      getIt.get<BookmarkTopicRemoteDatasource>();

  @override
  Future<Either<AppException, bool>> createBookmarkTopic(
      Map<String, dynamic> params) async {
    try {
      final result =
          await bookmarkTopicRemoteDatasource.createBookmarkTopic(params);
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    } catch (s) {
      return Left(
        AppException(
          error: s,
          displayMessage: 'Thêm topic yêu thích không thành công',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, List<BookmarkTopicEntity>>>
      getBookmarkTopics() async {
    try {
      final result = await bookmarkTopicRemoteDatasource.getBookmarkTopics();
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    } catch (s) {
      return Left(
        AppException(
          error: s,
          displayMessage: 'Lỗi lấy danh sách topic yêu thích',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, bool>> deleteBookmarkTopic(
      Map<String, dynamic> params) async {
    try {
      final result =
          await bookmarkTopicRemoteDatasource.deleteBookmarkTopic(params);
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    } catch (s) {
      return Left(
        AppException(
          error: s,
          displayMessage: 'Xóa topic yêu thích không thành công',
        ),
      );
    }
  }
}
