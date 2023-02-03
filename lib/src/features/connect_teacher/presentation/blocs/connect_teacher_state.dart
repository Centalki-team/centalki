part of 'connect_teacher_bloc.dart';

abstract class ConnectTeacherState {
  const ConnectTeacherState();
}

class ConnectTeacherInitState extends ConnectTeacherState {
  const ConnectTeacherInitState();
}

class ConnectTeacherLoadingState extends ConnectTeacherState {
  const ConnectTeacherLoadingState();
}

class ConnectTeacherLoadDoneState extends ConnectTeacherState {
  const ConnectTeacherLoadDoneState(this.message);

  final String message;
}

class ConnectTeacherConnectingRoomState extends ConnectTeacherState {
  const ConnectTeacherConnectingRoomState(this.message);

  final String message;
}

class ConnectTeacherConnectDoneState extends ConnectTeacherState {
  const ConnectTeacherConnectDoneState(this.message);

  final String message;
}

class ConnectTeacherConnectErrorState extends ConnectTeacherState {
  const ConnectTeacherConnectErrorState(this.message);

  final String message;
}