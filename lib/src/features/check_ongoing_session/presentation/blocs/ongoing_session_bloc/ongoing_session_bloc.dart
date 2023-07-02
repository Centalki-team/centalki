import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/temp_dio/dio_client.dart';
import '../../../../connect_teacher/domain/entities/session_schedule_entity.dart';

part 'ongoing_session_event.dart';
part 'ongoing_session_state.dart';

class OngoingSessionBloc
    extends Bloc<OngoingSessionEvent, OngoingSessionState> {
  OngoingSessionBloc() : super(const OngoingSessionInitState()) {
    on<OngoingSessionCheckingEvent>(_onCheckOngoingSession);
    add(const OngoingSessionCheckingEvent());
  }

  void _onCheckOngoingSession(OngoingSessionCheckingEvent event, emit) async {
    try {
      final pickedUpSessions = await DioClient.getPickedUpSessionListOfStudent(
          FirebaseAuth.instance.currentUser?.uid ?? '', 'PICKED_UP');
      if (pickedUpSessions.sessions != null &&
          pickedUpSessions.sessions!.isNotEmpty) {
        emit(OngoingSessionCheckingDoneState(
          isInOngoingSession: true,
          isRecheckForRejoin: event.isRecheckForRejoin,
          sessionScheduleEntity: pickedUpSessions.sessions!.first,
          timeEmit: DateTime.now(),
        ));
      } else {
        emit(OngoingSessionCheckingDoneState(
          isInOngoingSession: false,
          isRecheckForRejoin: event.isRecheckForRejoin,
          timeEmit: DateTime.now(),
        ));
      }
    } on Exception catch (e) {
      emit(OngoingSessionCheckFailState(
        exception: e,
        timeEmit: DateTime.now(),
      ));
    }
  }
}
