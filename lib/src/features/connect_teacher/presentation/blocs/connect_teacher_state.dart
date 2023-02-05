part of 'connect_teacher_bloc.dart';

abstract class ConnectTeacherState {
  const ConnectTeacherState({this.message = ''});

  final String message;
}

class ConnectTeacherInitState extends ConnectTeacherState {
  const ConnectTeacherInitState();
}

class ConnectTeacherLoadingState extends ConnectTeacherState {
  const ConnectTeacherLoadingState(String message) : super(message: message);
}

class ConnectTeacherLoadDoneState extends ConnectTeacherState {
  const ConnectTeacherLoadDoneState(String message) : super(message: message);
}

class ConnectTeacherConnectingRoomState extends ConnectTeacherState {
  const ConnectTeacherConnectingRoomState(String message)
      : super(message: message);
}

class ConnectTeacherConnectDoneState extends ConnectTeacherState {
  const ConnectTeacherConnectDoneState(String message)
      : super(message: message);
}

class ConnectTeacherConnectErrorState extends ConnectTeacherState {
  const ConnectTeacherConnectErrorState(
      String message, this.failureTitle, this.failureType)
      : super(message: message);

  final String failureTitle;
  final ConnectFailure failureType;
}

class ConnectTeacherMeetingState extends ConnectTeacherState {
  const ConnectTeacherMeetingState();
}

class ConnectTeacherCancelState extends ConnectTeacherState {
  const ConnectTeacherCancelState();
}

enum ConnectFailure {
  INTERNET_CONNECTION,
  TEACHER_CANCELLATION,
  NOT_FOUND_TEACHER,
  NOT_SIGN_IN
}
