import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/temp_dio/dio_client.dart';
import '../../../../connect_teacher/domain/entities/session_schedule_entity.dart';

part 'ongoing_session_event.dart';
part 'ongoing_session_state.dart';

class OngoingSessionBloc
    extends Bloc<OngoingSessionEvent, OngoingSessionState> {
  OngoingSessionBloc() : super(const OngoingSessionInitState()) {
    on<OngoingSessionInitEvent>(_onInit);
    on<OngoingSessionCheckingEvent>(_onCheckOngoingSession);
    add(const OngoingSessionInitEvent());
  }

  var childChangeReference = FirebaseDatabase.instance
      .ref("session-schedule")
      .equalTo(FirebaseAuth.instance.currentUser?.uid ?? '', key: 'studentId')
      .ref;

  void _onInit(OngoingSessionInitEvent event, emit) {
    add(const OngoingSessionCheckingEvent());
    childChangeReference.onValue.listen((event) {
      add(const OngoingSessionCheckingEvent());
    });
  }

  @override
  Future<void> close() {
    childChangeReference.onValue.listen((event) {}).cancel();
    return super.close();
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
          isCheckForNewSession: event.isCheckForNewSession,
          sessionScheduleEntity: pickedUpSessions.sessions!.first,
          timeEmit: DateTime.now(),
        ));
      } else {
        emit(OngoingSessionCheckingDoneState(
          isInOngoingSession: false,
          isRecheckForRejoin: event.isRecheckForRejoin,
          isCheckForNewSession: event.isCheckForNewSession,
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
