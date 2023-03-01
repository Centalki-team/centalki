import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/text.dart';
import '../../../../../../base/temp_dio/dio_client.dart';
import '../../../../topics/domain/entities/topic_item_entity.dart';

part 'student_profile_event.dart';
part 'student_profile_state.dart';

class StudentProfileBloc
    extends Bloc<StudentProfileEvent, StudentProfileState> {
  StudentProfileBloc() : super(const StudentProfileInitState()) {
    on<StudentProfileInitEvent>(_onInit);
    on<StudentProfileChangeEvent>(_onChange);
    on<StudentProfileSaveChangesEvent>(_onSaveChanges);
  }

  late final List<TopicItemEntity> topicList;

  void _onInit(StudentProfileInitEvent event, emit) async {
    emit(const StudentProfileLoadingState());
    try {
      final studentProfile = await FirebaseAuth.instance.currentUser
          ?.getIdToken()
          .then(DioClient.getUserInformation);
      final topics = await DioClient.getTopicList();
      topicList = topics.topics ?? [];
      var selectedInterestedTopics = List.generate(
          topicList.length,
          (index) =>
              studentProfile?.userProfile?.accountInterestedTopicIds
                  ?.contains(topicList[index].topicId) ??
              false);
      emit(StudentProfileLoadDoneState(
        studentProfile?.avatarUrl ?? '',
        studentProfile?.fullName ?? '',
        studentProfile?.userProfile?.accountEnglishName ?? '',
        studentProfile?.userProfile?.accountBio ?? '',
        selectedInterestedTopics,
        topics.topics ?? [],
      ));
    } on Exception catch (_) {}
  }

  void _onChange(StudentProfileChangeEvent event, emit) {
    emit(const StudentProfileSavingState());
    emit(const StudentProfileChangedState());
  }

  void _onSaveChanges(StudentProfileSaveChangesEvent event, emit) async {
    emit(const StudentProfileSavingState());
    var selectedTopicIds = <String>[];
    for (var i = 0; i < event.selectedInterestedTopics.length; i++) {
      if (event.selectedInterestedTopics[i]) {
        selectedTopicIds.add(topicList[i].topicId ?? '');
      }
    }
    final updateInformation = Map<String, dynamic>.from({
      "photoUrl": event.avatarUrl,
      "displayName": event.fullName,
      "englishName": event.englishName,
      "bio": event.bio,
    });
    try {
      final idToken =
          await FirebaseAuth.instance.currentUser?.getIdToken() ?? '';
      final isSuccess =
          await DioClient.updateUserInformation(updateInformation, idToken);
      final isUpdated =
          await DioClient.updateInterestedTopics(selectedTopicIds, idToken);
      if (!isSuccess && !isUpdated) {
        throw Exception();
      }
      emit(const StudentProfileSaveDoneState());
    } on Exception catch (_) {
      emit(const StudentProfileSaveFailureState(TextDoc.txtProfileUpdateFailed));
    }
  }
}
