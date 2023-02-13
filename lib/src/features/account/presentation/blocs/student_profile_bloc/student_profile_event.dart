part of 'student_profile_bloc.dart';

abstract class StudentProfileEvent {
  const StudentProfileEvent();
}

class StudentProfileInitEvent extends StudentProfileEvent {
  const StudentProfileInitEvent();
}

class StudentProfileChangeEvent extends StudentProfileEvent {
  const StudentProfileChangeEvent(this.avatarUrl, this.fullName,
      this.englishName, this.bio, this.selectedInterestedTopics);

  final String avatarUrl;
  final String fullName;
  final String englishName;
  final String bio;
  final List<bool> selectedInterestedTopics;
}

class StudentProfileSaveChangesEvent extends StudentProfileEvent {
  const StudentProfileSaveChangesEvent(this.avatarUrl, this.fullName,
      this.englishName, this.bio, this.selectedInterestedTopics);

  final String avatarUrl;
  final String fullName;
  final String englishName;
  final String bio;
  final List<bool> selectedInterestedTopics;
}
