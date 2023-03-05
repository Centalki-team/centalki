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

class ConnectTeacherLoadFailureState extends ConnectTeacherState {
  const ConnectTeacherLoadFailureState(String message)
      : super(message: message);
}

class ConnectTeacherLoadDoneState extends ConnectTeacherState {
  const ConnectTeacherLoadDoneState(String message) : super(message: message);
}

class ConnectTeacherFindingTeacherState extends ConnectTeacherState {
  const ConnectTeacherFindingTeacherState(String message)
      : super(message: message);
}

class ConnectTeacherFindDoneState extends ConnectTeacherState {
  const ConnectTeacherFindDoneState(String message) : super(message: message);
}

class ConnectTeacherFindFailureState extends ConnectTeacherState {
  const ConnectTeacherFindFailureState(String message)
      : super(message: message);
}

class ConnectTeacherConnectingRoomState extends ConnectTeacherState {
  const ConnectTeacherConnectingRoomState(String message)
      : super(message: message);
}

class ConnectTeacherConnectDoneState extends ConnectTeacherState {
  const ConnectTeacherConnectDoneState() : super();
}

class ConnectTeacherConnectErrorState extends ConnectTeacherState {
  const ConnectTeacherConnectErrorState(String message)
      : super(message: message);
}

class ConnectTeacherCancelState extends ConnectTeacherState {
  const ConnectTeacherCancelState();
}

//update Init -> Loading -> LoadDone -> Finding -> FindDone -> Connecting -> ConnectDone -> join meet
// FindFailure -> Internet Connection, Not found teacher
// LoadFailure -> Internet Connection, Not sign in
// Connect Failure -> Internet Connection
