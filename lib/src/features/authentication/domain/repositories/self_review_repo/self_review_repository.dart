import 'package:dartz/dartz.dart';

import '../../../../../../base/gateway/exception/app_exception.dart';
import '../../entities/self_review/self_level_entity.dart';

abstract class SelfReviewRepository {
  Future<Either<AppException, List<SelfLevelEntity>>> getLevelsList();
}
