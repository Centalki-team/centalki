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

  void _onInit(ConnectTeacherInit event, emit) async {
    emit(ConnectTeacherLoadingState(TextDoc.txtFindTeacher));

    if (FirebaseAuth.instance.currentUser != null) {
      final String studentId = FirebaseAuth.instance.currentUser?.uid ?? '';
      final sessionSchedule =
          await DioClient.createNewSessionSchedule(studentId, event.topicId);
      print(sessionSchedule.sessionId);
      emit(ConnectTeacherLoadDoneState(
          TextDoc.txtFindTeacher, sessionSchedule.sessionId ?? ''));
    } else {
      emit(ConnectTeacherConnectErrorState(TextDoc.txtNotSignIn, '',
          TextDoc.txtNotSignInTitle, ConnectFailure.NOT_SIGN_IN));
    }
  }

  void _onCancelButtonPressed(
      ConnectTeacherCancelButtonPressed event, emit) async {
    await DioClient.cancelSessionSchedule(event.sessionId);
    emit(const ConnectTeacherCancelState());
  }

  void _onConnectRoom(ConnectTeacherConnectRoom event, emit) async {
    emit(ConnectTeacherConnectingRoomState(
        TextDoc.txtFoundedTeacher, event.sessionId));

    DatabaseReference statusSessionScheduleRef = FirebaseDatabase.instance.ref("https://centalki.firebaseio.com/session-schedule/744WzbvAOL3kZKmK6yCS/status");
    statusSessionScheduleRef.onValue.listen((event) {
      final data = event.snapshot.value;
      print('DATA: $data');
    });
    await Future.delayed(Duration(seconds: 5));

    emit(ConnectTeacherConnectDoneState('Launching session', event.sessionId));

    await Future.delayed(Duration(seconds: 5));

    emit(ConnectTeacherMeetingState());
  }

  void _onTryConnect(ConnectTeacherTryConnect event, emit) {}

  void _onFindOtherTeacher(ConnectTeacherFindOtherTeacher event, emit) {}
}
