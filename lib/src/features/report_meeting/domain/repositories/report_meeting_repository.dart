import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';

abstract class ReportMeetingRepository {
  Future<Either<AppException, bool>> reportMeeting({
    required String reportedId,
    required String sessionId,
    required List<String> summary,
    required String detail,
  });
}