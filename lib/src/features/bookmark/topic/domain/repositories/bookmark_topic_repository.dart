import 'package:dartz/dartz.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../entities/bookmark_topic_entity.dart';

abstract class BookmarkTopicRepository {
  Future<Either<AppException, bool>> createBookmarkTopic(
      Map<String, dynamic> params);
  Future<Either<AppException, List<BookmarkTopicEntity>>> getBookmarkTopics();
  Future<Either<AppException, bool>> deleteBookmarkTopic(String params);
}
