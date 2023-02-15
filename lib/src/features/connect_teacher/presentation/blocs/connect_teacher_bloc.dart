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
    on<ConnectTeacherTryInternetConnect>(_onTryInternetConnect);
    on<ConnectTeacherFindOtherTeacher>(_onFindOtherTeacher);
  }

  String sessionId = '';
  late final String topicId;

  void _onInit(ConnectTeacherInit event, emit) async {
    emit(ConnectTeacherLoadingState(TextDoc.txtFindTeacher));

    topicId = event.topicId;
    if (FirebaseAuth.instance.currentUser != null) {
      try {
        final studentId = FirebaseAuth.instance.currentUser?.uid ?? '';
        final sessionSchedule =
            await DioClient.createNewSessionSchedule(studentId, topicId);
        sessionId = sessionSchedule.sessionId ?? '';
        print(sessionSchedule.sessionId);
        emit(ConnectTeacherLoadDoneState(TextDoc.txtFindTeacher));
      } on Exception catch (e) {
        var message = e.toString().split("Exception: ")[1];
        emit(ConnectTeacherLoadFailureState(message));
      }
    } else {
      emit(ConnectTeacherConnectErrorState(TextDoc.txtNotSignIn,
          TextDoc.txtNotSignInTitle, ConnectFailure.notSignIn));
    }
  }

  void _onCancelButtonPressed(
      ConnectTeacherCancelButtonPressed event, emit) async {
    await FirebaseDatabase.instance
        .ref("session-schedule/$sessionId/status")
        .onValue
        .listen((event) {})
        .cancel();
    await DioClient.cancelSessionSchedule(sessionId);
    emit(const ConnectTeacherCancelState());
  }

  void _onConnectRoom(ConnectTeacherConnectRoom event, emit) async {
    emit(ConnectTeacherConnectingRoomState(TextDoc.txtFoundedTeacher));

    try {
      var currentStatus = '';
      final events = FirebaseDatabase.instance
          .ref("session-schedule/$sessionId/status")
          .onValue;
      await for (var status in events) {
        currentStatus = status.snapshot.value.toString();
        switch (currentStatus) {
          case 'PICKED_UP':
            emit(ConnectTeacherConnectDoneState(TextDoc.txtConnectedTeacher));
            break;
          case 'CANCELLED':
            await events.listen((event) {}).cancel();
            emit(ConnectTeacherConnectErrorState(TextDoc.txtCancelledContent,
                TextDoc.txtCancelledTitle, ConnectFailure.teacherCancellation));
            break;
          case 'TIME_OUT':
            await events.listen((event) {}).cancel();
            await DioClient.cancelSessionSchedule(sessionId);
            emit(ConnectTeacherConnectErrorState(
                TextDoc.txtNotTeacherAvailableContent,
                TextDoc.txtNotTeacherAvailableTitle,
                ConnectFailure.notFoundTeacher));
            break;
          default:
            break;
        }
      }
    } on Exception catch (exception) {
      print('EXCEPTION WHEN LISTEN CHANGE: $exception');
    }
  }

  void _onTryInternetConnect(ConnectTeacherTryInternetConnect event, emit) {}

  void _onFindOtherTeacher(ConnectTeacherFindOtherTeacher event, emit) {
    add(ConnectTeacherInit(topicId));
  }
}
