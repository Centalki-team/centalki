import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../entities/topic_item_entity.dart';

abstract class TopicRepository {
  Future<Either<AppException, List<TopicItemEntity>>> getTopics();
}
