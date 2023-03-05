import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';

abstract class EventTrackingRepository {
  Future<Either<AppException, bool>> createEventTracking(
      String sessionId, String name);
}
