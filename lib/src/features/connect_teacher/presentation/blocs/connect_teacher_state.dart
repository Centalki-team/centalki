part of 'connect_teacher_bloc.dart';

abstract class ConnectTeacherState {
  const ConnectTeacherState({this.message = '', this.sessionId = ''});

  final String message;
  final String sessionId;
}

class ConnectTeacherInitState extends ConnectTeacherState {
  const ConnectTeacherInitState();
}

class ConnectTeacherLoadingState extends ConnectTeacherState {
  const ConnectTeacherLoadingState(String message) : super(message: message);
}

class ConnectTeacherLoadDoneState extends ConnectTeacherState {
  const ConnectTeacherLoadDoneState(String message, String sessionId)
      : super(message: message, sessionId: sessionId);
}

class ConnectTeacherConnectingRoomState extends ConnectTeacherState {
  const ConnectTeacherConnectingRoomState(String message, String sessionId)
      : super(message: message, sessionId: sessionId);
}

class ConnectTeacherConnectDoneState extends ConnectTeacherState {
  const ConnectTeacherConnectDoneState(String message, String sessionId)
      : super(message: message, sessionId: sessionId);
}

class ConnectTeacherConnectErrorState extends ConnectTeacherState {
  const ConnectTeacherConnectErrorState(
      String message, String sessionId, this.failureTitle, this.failureType)
      : super(message: message, sessionId: sessionId);

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
