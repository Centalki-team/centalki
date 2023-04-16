import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../topics/domain/entities/topic_item_entity.dart';

abstract class SearchTopicsRepository {
  Future<Either<AppException, TopicsListEntity>> searchTopics(
      Map<String, dynamic> params);
}
