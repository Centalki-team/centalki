part of 'connect_teacher_bloc.dart';

abstract class ConnectTeacherEvent {
  const ConnectTeacherEvent();
}

class ConnectTeacherInit extends ConnectTeacherEvent {
  const ConnectTeacherInit(this.sessionId);

  final String sessionId;
}

class ConnectTeacherCancelButtonPressed extends ConnectTeacherEvent {
  const ConnectTeacherCancelButtonPressed();
}

class ConnectTeacherFindTeacher extends ConnectTeacherEvent {
  const ConnectTeacherFindTeacher();
}

class ConnectTeacherConnectRoom extends ConnectTeacherEvent {
  const ConnectTeacherConnectRoom();
}

class ConnectTeacherLaunchSession extends ConnectTeacherEvent {
  const ConnectTeacherLaunchSession();
}

class ConnectTeacherTryInternetConnect extends ConnectTeacherEvent {}

class ConnectTeacherFindOtherTeacher extends ConnectTeacherEvent {}
