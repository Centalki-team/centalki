import 'package:dartz/dartz.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../base/usecase/usecase.base.dart';
import '../repositories/report_meeting_repository.dart';
import 'report_meeting_params.dart';

class ReportMeetingUseCase
    with UseCase<ReportMeetingParams, Either<AppException, bool>> {
  const ReportMeetingUseCase({
    required this.reportMeetingRepository,
  });

  final ReportMeetingRepository reportMeetingRepository;

  @override
  Future<Either<AppException, bool>> execute(ReportMeetingParams params) =>
      reportMeetingRepository.reportMeeting(
        reportedId: params.reportedId,
        summary: params.summary,
        detail: params.detail,
      );
}
