part of 'connect_teacher_bloc.dart';

abstract class ConnectTeacherEvent {
  const ConnectTeacherEvent();
}

class ConnectTeacherInit extends ConnectTeacherEvent {
  const ConnectTeacherInit(this.topicId);

  final String topicId;
}

class ConnectTeacherCancelButtonPressed extends ConnectTeacherEvent {
  const ConnectTeacherCancelButtonPressed();
}

class ConnectTeacherConnectRoom extends ConnectTeacherEvent {
  const ConnectTeacherConnectRoom();
}

class ConnectTeacherTryConnect extends ConnectTeacherEvent {}

class ConnectTeacherFindOtherTeacher extends ConnectTeacherEvent {}
