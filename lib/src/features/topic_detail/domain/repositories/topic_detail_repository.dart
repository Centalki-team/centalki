import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../entities/topic_detail_entity.dart';

abstract class TopicDetailRepository {
  Future<Either<AppException, TopicDetailEntity>> getTopicDetail(String topicId);
}
