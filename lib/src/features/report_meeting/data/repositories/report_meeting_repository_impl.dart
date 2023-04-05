import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../di/di_module.dart';
import '../../domain/repositories/report_meeting_repository.dart';
import '../datasources/report_meeting_datasource/remote_data/report_meeting_remote_datasource.dart';

class ReportMeetingRepositoryImpl extends ReportMeetingRepository {
  ReportMeetingRepositoryImpl();

  final ReportMeetingRemoteDatasource reportMeetingRemoteDatasource =
      getIt.get<ReportMeetingRemoteDatasource>();

  @override
  Future<Either<AppException, bool>> reportMeeting(
      {required String reportedId,
      required List<String> summary,
      required String detail}) async {
    try {
      final result = await reportMeetingRemoteDatasource.reportMeeting(
          reportedId: reportedId, summary: summary, detail: detail);
      return Right(result);
    } on AppException catch (a) {
      return Left(a);
    } on Exception catch (s) {
      return Left(
        AppException(
          error: s,
          displayMessage: 'Không thể gửi báo cáo',
        ),
      );
    }
  }
}
