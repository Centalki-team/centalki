part of 'student_profile_bloc.dart';

abstract class StudentProfileState {
  const StudentProfileState();
}

class StudentProfileInitState extends StudentProfileState {
  const StudentProfileInitState();
}

class StudentProfileLoadingState extends StudentProfileState {
  const StudentProfileLoadingState();
}

class StudentProfileLoadDoneState extends StudentProfileState {
  const StudentProfileLoadDoneState(this.avatarUrl, this.fullName,
      this.englishName, this.bio, this.selectedInterestedTopics);

  final String avatarUrl;
  final String fullName;
  final String englishName;
  final String bio;
  final List<bool> selectedInterestedTopics;
}

class StudentProfileLoadFailureState extends StudentProfileState {
  const StudentProfileLoadFailureState(this.message);

  final String message;
}

class StudentProfileSavingState extends StudentProfileState {
  const StudentProfileSavingState();
}

class StudentProfileSaveDoneState extends StudentProfileState {
  const StudentProfileSaveDoneState();
}

class StudentProfileSaveFailureState extends StudentProfileState {
  const StudentProfileSaveFailureState(this.message);

  final String message;
}

class StudentProfileChangeState extends StudentProfileState {
  const StudentProfileChangeState();
}
