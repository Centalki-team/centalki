import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/gateway/exception/app_exception.dart';
import '../../../../../di/di_module.dart';
import '../../domain/repositories/report_meeting_repository.dart';
import '../../domain/usecases/report_meeting_params.dart';
import '../../domain/usecases/report_meeting_usecase.dart';

part 'report_meeting_event.dart';
part 'report_meeting_state.dart';

class ReportMeetingBloc extends Bloc<ReportMeetingEvent, ReportMeetingState> {
  ReportMeetingBloc() : super(const ReportMeetingInitState()) {
    on<ReportMeetingInitEvent>(_onInit);
    on<ReportMeetingLoadEvent>(_onLoad);
  }

  final ReportMeetingUseCase reportMeetingUseCase = ReportMeetingUseCase(
      reportMeetingRepository: getIt.get<ReportMeetingRepository>());

  void _onInit(ReportMeetingInitEvent event, emit) {}

  void _onLoad(ReportMeetingLoadEvent event, emit) async {
    emit(const ReportMeetingLoadingState());

    final reportResult = await reportMeetingUseCase.execute(ReportMeetingParams(
      reportedId: event.teacherId,
      sessionId: event.sessionId,
      summary: event.problems,
      detail: event.description,
    ));
    reportResult.fold(
      (l) => emit(
        ReportMeetingLoadFailureState(
          l,
        ),
      ),
      (r) => emit(
        const ReportMeetingLoadDoneState(),
      ),
    );
  }
}
