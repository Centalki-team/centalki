import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/text.dart';
import '../../../../../base/temp_dio/dio_client.dart';

part 'connect_teacher_event.dart';
part 'connect_teacher_state.dart';

class ConnectTeacherBloc
    extends Bloc<ConnectTeacherEvent, ConnectTeacherState> {
  ConnectTeacherBloc() : super(const ConnectTeacherInitState()) {
    on<ConnectTeacherInit>(_onInit);
    on<ConnectTeacherCancelButtonPressed>(_onCancelButtonPressed);
    on<ConnectTeacherConnectRoom>(_onConnectRoom);
    on<ConnectTeacherTryConnect>(_onTryConnect);
    on<ConnectTeacherFindOtherTeacher>(_onFindOtherTeacher);
  }

  late final String sessionId;

  void _onInit(ConnectTeacherInit event, emit) async {
    emit(ConnectTeacherLoadingState(TextDoc.txtFindTeacher));

    if (FirebaseAuth.instance.currentUser != null) {
      final String studentId = FirebaseAuth.instance.currentUser?.uid ?? '';
      final sessionSchedule =
          await DioClient.createNewSessionSchedule(studentId, event.topicId);
      sessionId = sessionSchedule.sessionId ?? '';
      print(sessionSchedule.sessionId);
      emit(ConnectTeacherLoadDoneState(TextDoc.txtFindTeacher));
    } else {
      emit(ConnectTeacherConnectErrorState(TextDoc.txtNotSignIn,
          TextDoc.txtNotSignInTitle, ConnectFailure.NOT_SIGN_IN));
    }
  }

  void _onCancelButtonPressed(
      ConnectTeacherCancelButtonPressed event, emit) async {
    await DioClient.cancelSessionSchedule(sessionId);
    emit(const ConnectTeacherCancelState());
  }

  void _onConnectRoom(ConnectTeacherConnectRoom event, emit) async {
    emit(ConnectTeacherConnectingRoomState(
        TextDoc.txtFoundedTeacher));

    try {
      final statusSessionScheduleRef = FirebaseDatabase.instance
          .ref("/session-schedule/$sessionId/status");
      statusSessionScheduleRef.onValue.listen((eventDatabase) async {
        final data = eventDatabase.snapshot.value;
        print('DATA: $data');
        if (data.toString() == 'ROUTING') {
          emit(const ConnectTeacherConnectDoneState(
              'Launching session'));
        } else if (data.toString() == 'TIME_OUT') {
          emit(const ConnectTeacherConnectDoneState('TIMEOUT'));
        }
      });
    } catch (exception) {
      print('EXCEPTION WHEN LISTEN CHANGE: $exception');
    }
  }

  void _onTryConnect(ConnectTeacherTryConnect event, emit) {}

  void _onFindOtherTeacher(ConnectTeacherFindOtherTeacher event, emit) {}
}
