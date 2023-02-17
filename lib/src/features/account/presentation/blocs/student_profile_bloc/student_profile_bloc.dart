import 'package:flutter_bloc/flutter_bloc.dart';

part 'student_profile_event.dart';
part 'student_profile_state.dart';

class StudentProfileBloc extends Bloc<StudentProfileEvent, StudentProfileState> {
  StudentProfileBloc() : super(const StudentProfileInitState()) {
    on<StudentProfileInitEvent>(_onInit);
    on<StudentProfileChangeEvent>(_onChange);
    on<StudentProfileSaveChangesEvent>(_onSaveChanges);
  }

  void _onInit(StudentProfileInitEvent event, emit) async {
    emit(const StudentProfileLoadingState());

    await Future.delayed(const Duration(seconds: 2));

    emit(const StudentProfileLoadDoneState('', 'Nguyen Ngoc Mai Anh', 'Daphne', '', [true, false, true, false]));
  }

  void _onChange(StudentProfileChangeEvent event, emit) {
    emit(const StudentProfileSavingState());
    emit(const StudentProfileChangeState());
  }

  void _onSaveChanges(StudentProfileSaveChangesEvent event, emit) async {
    emit(const StudentProfileSavingState());

    await Future.delayed(const Duration(seconds: 2));

    emit(const StudentProfileSaveDoneState());
  }
}