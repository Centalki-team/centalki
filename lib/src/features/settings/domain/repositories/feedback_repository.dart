import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';

abstract class FeedbackRepository {
  Future<Either<AppException, bool>> createFeedback(
      Map<String, dynamic> feedback);
}
