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
    on<ConnectTeacherFindTeacher>(_onFindTeacher);
    on<ConnectTeacherConnectRoom>(_onConnectRoom);
    on<ConnectTeacherTryInternetConnect>(_onTryInternetConnect);
    on<ConnectTeacherFindOtherTeacher>(_onFindOtherTeacher);
  }

  String sessionId = '';
  late final String topicId;
  bool isCancel = false;

  void _onInit(ConnectTeacherInit event, emit) async {
    emit(const ConnectTeacherLoadingState(TextDoc.txtFindTeacher));

    topicId = event.topicId;
    if (FirebaseAuth.instance.currentUser != null) {
      try {
        final studentId = FirebaseAuth.instance.currentUser?.uid ?? '';
        final sessionSchedule =
            await DioClient.createNewSessionSchedule(studentId, topicId);
        sessionId = sessionSchedule.sessionId ?? '';
        emit(const ConnectTeacherLoadDoneState(TextDoc.txtFindTeacher));
      } on Exception catch (e) {
        var message = e.toString().split("Exception: ")[1];
        emit(ConnectTeacherLoadFailureState(message));
      }
    } else {
      emit(const ConnectTeacherLoadFailureState(TextDoc.txtNotSignIn));
    }
  }

  void _onCancelButtonPressed(
      ConnectTeacherCancelButtonPressed event, emit) async {
    isCancel = true;
    await FirebaseDatabase.instance
        .ref("session-schedule/$sessionId/status")
        .onValue
        .listen((event) {})
        .cancel();
    await DioClient.cancelSessionSchedule(sessionId);
    emit(const ConnectTeacherCancelState());
  }

  void _onFindTeacher(ConnectTeacherFindTeacher event, emit) async {
    emit(const ConnectTeacherFindingTeacherState(TextDoc.txtFindTeacher));

    try {
      var currentStatus = '';
      final events = FirebaseDatabase.instance
          .ref("session-schedule/$sessionId/status")
          .onValue;
      await for (var status in events) {
        currentStatus = status.snapshot.value.toString();
        switch (currentStatus) {
          case 'PICKED_UP':
            emit(const ConnectTeacherFindDoneState(TextDoc.txtConnectedTeacher));
            add(const ConnectTeacherConnectRoom());
            break;
          case 'CANCELLED':
            await events.listen((event) {}).cancel();
            if (!isCancel) {
              emit(const ConnectTeacherCancelState(isTeacherCancelled: true));
            }
            break;
          case 'TIME_OUT':
            await events.listen((event) {}).cancel();
            await DioClient.cancelSessionSchedule(sessionId);
            emit(const ConnectTeacherFindFailureState(
                TextDoc.txtNotTeacherAvailableContent));
            break;
          default:
            break;
        }
      }
    } on Exception catch (exception) {
      print('EXCEPTION WHEN LISTEN CHANGE: $exception');
    }
  }

  void _onConnectRoom(ConnectTeacherConnectRoom event, emit) async {
    var teacherName = '';
    try {
      final sessionsResponse = await DioClient.getPickedUpSessionListOfStudent(
          FirebaseAuth.instance.currentUser!.uid, 'PICKED_UP');
      sessionsResponse.sessions?.forEach((element) {
        if (element.sessionId == sessionId) {
          teacherName = element.sessionTeacher?.fullName ?? '';
        }
      });
      if (teacherName.isNotEmpty) {
        emit(ConnectTeacherConnectingRoomState(
            '${TextDoc.txtConnectedTeacher}$teacherName${TextDoc.txtLaunchSession}'));
        await Future.delayed(const Duration(seconds: 3));
        emit(const ConnectTeacherConnectDoneState());
      } else {
        emit(const ConnectTeacherConnectErrorState(
            TextDoc.txtNotTeacherAvailableContent));
      }
    } on Exception catch (_) {
      emit(const ConnectTeacherConnectErrorState(
          TextDoc.txtNotTeacherAvailableContent));
    }
  }

  void _onTryInternetConnect(ConnectTeacherTryInternetConnect event, emit) {}

  void _onFindOtherTeacher(ConnectTeacherFindOtherTeacher event, emit) {
    add(ConnectTeacherInit(topicId));
  }
}
