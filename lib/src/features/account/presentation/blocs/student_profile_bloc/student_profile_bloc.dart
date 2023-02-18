import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/text.dart';
import '../../../../../../base/temp_dio/dio_client.dart';

part 'student_profile_event.dart';
part 'student_profile_state.dart';

class StudentProfileBloc
    extends Bloc<StudentProfileEvent, StudentProfileState> {
  StudentProfileBloc() : super(const StudentProfileInitState()) {
    on<StudentProfileInitEvent>(_onInit);
    on<StudentProfileChangeEvent>(_onChange);
    on<StudentProfileSaveChangesEvent>(_onSaveChanges);
  }

  void _onInit(StudentProfileInitEvent event, emit) async {
    emit(const StudentProfileLoadingState());
    try {
      final studentProfile = await FirebaseAuth.instance.currentUser
          ?.getIdToken()
          .then(DioClient.getUserInformation);
      emit(StudentProfileLoadDoneState(
          studentProfile?.avatarUrl ?? '',
          studentProfile?.fullName ?? '',
          studentProfile?.userProfile?.accountEnglishName ?? '',
          '',
          [true, false, true, false]));
    } on Exception catch (_) {}
  }

  void _onChange(StudentProfileChangeEvent event, emit) {
    emit(const StudentProfileSavingState());
    emit(const StudentProfileChangeState());
  }

  void _onSaveChanges(StudentProfileSaveChangesEvent event, emit) async {
    emit(const StudentProfileSavingState());
    final updateInformation = Map<String, dynamic>.from({
      "photoUrl": event.avatarUrl,
      "displayName": event.fullName,
      "englishName": event.englishName,
    });
    try {
      final idToken = await FirebaseAuth.instance.currentUser?.getIdToken() ?? '';
      final isSuccess = await DioClient.updateUserInformation(updateInformation, idToken);
      if (!isSuccess) {
        throw Exception();
      }
      emit(const StudentProfileSaveDoneState());
    }
    on Exception catch (_) {
      emit(StudentProfileSaveFailureState(TextDoc.txtSaveFailed));
    }
  }
}
