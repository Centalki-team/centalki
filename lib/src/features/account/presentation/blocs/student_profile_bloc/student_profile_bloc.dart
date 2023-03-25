import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

import '../../../../../../base/define/text.dart';
import '../../../../../../base/temp_dio/dio_client.dart';
import '../../../../topics/domain/entities/topic_item_entity.dart';
import '../../../domain/entities/user_account_entity.dart';

part 'student_profile_event.dart';

part 'student_profile_state.dart';

class StudentProfileBloc
    extends Bloc<StudentProfileEvent, StudentProfileState> {
  StudentProfileBloc() : super(const StudentProfileInitState()) {
    on<StudentProfileInitEvent>(_onInit);
    on<StudentProfileChangeEvent>(_onChange);
    on<StudentProfileSaveChangesEvent>(_onSaveChanges);
    on<StudentProfileChangeAvatarEvent>(_onChangeAvatar);
  }

  var avatarException = '';
  var fullNameError = '';
  var englishNameError = '';
  var bioError = '';
  var user = const UserAccountEntity();

  void _onInit(StudentProfileInitEvent event, emit) async {
    emit(const StudentProfileLoadingState());
    try {
      user = await FirebaseAuth.instance.currentUser
              ?.getIdToken()
              .then(DioClient.getUserInformation) ??
          const UserAccountEntity();
      final topics = await DioClient.getTopicList();
      var selectedInterestedTopics =
          (user.userProfile?.accountInterestedTopicIds ?? []).toList();
      emit(StudentProfileLoadDoneState(
        user.avatarUrl ?? '',
        user.fullName ?? '',
        user.userProfile?.accountEnglishName ?? '',
        user.userProfile?.accountBio ?? '',
        selectedInterestedTopics,
        topics.topics ?? [],
      ));
    } on Exception catch (_) {}
  }

  void _onChange(StudentProfileChangeEvent event, emit) {
    if (event.fullName.isEmpty) {
      fullNameError = TextDoc.txtFullNameEmpty;
    } else if (event.fullName.replaceAll(' ', '').length < 2) {
      fullNameError = TextDoc.txtFullNameTooShort;
    } else if (event.fullName.length > 50) {
      fullNameError = TextDoc.txtFullNameTooLong;
    } else if (checkOnlyChar(event.fullName)) {
      fullNameError = '';
    } else {
      fullNameError = TextDoc.txtFullNameOnlyCharacters;
    }

    if (event.englishName.isNotEmpty) {
      if (event.englishName.replaceAll(' ', '').length < 2) {
        englishNameError = TextDoc.txtEngNameTooShort;
      } else if (event.englishName.length > 50) {
        englishNameError = TextDoc.txtEngNameTooLong;
      } else if (checkOnlyChar(event.englishName)) {
        englishNameError = '';
      } else {
        englishNameError = TextDoc.txtEngNameOnlyCharacters;
      }
    } else {
      englishNameError = '';
    }

    if (event.bio.length > 200) {
      bioError = TextDoc.txtBioTooLong;
    } else {
      bioError = '';
    }

    emit(const StudentProfileInitState());
    emit(StudentProfileChangedState(
      avatarException: avatarException,
      fullNameError: fullNameError,
      englishNameError: englishNameError,
      bioError: bioError,
      forceDisabled: checkDisabledButton(),
    ));
  }

  void _onSaveChanges(StudentProfileSaveChangesEvent event, emit) async {
    emit(const StudentProfileSavingState());

    var setSelected = event.selectedInterestedTopics.toSet();
    var setCurrent =
        (user.userProfile?.accountInterestedTopicIds ?? []).toSet();
    var updateInterestedTopics =
        setSelected.difference(setCurrent).isNotEmpty ||
            setCurrent.difference(setSelected).isNotEmpty;

    if (event.fullName != user.fullName ||
        event.englishName != user.userProfile?.accountEnglishName ||
        event.bio != user.userProfile?.accountBio ||
        updateInterestedTopics ||
        (event.avatarUrl.isNotEmpty && event.avatarUrl != user.avatarUrl)) {
      final updateInformation = Map<String, dynamic>.from({
        "displayName": event.fullName,
        "englishName": event.englishName,
        "bio": event.bio,
      });
      if (event.avatarUrl.isNotEmpty && event.avatarUrl != user.avatarUrl) {
        try {
          final name =
              event.avatarUrl.substring(event.avatarUrl.lastIndexOf("/") + 1);
          final storageRef = FirebaseStorage.instance.ref();
          final avatarRef = storageRef.child("media/avatar/$name");
          await avatarRef.putFile(
            File(event.avatarUrl),
            SettableMetadata(contentType: 'image/jpeg'),
          );
          final downloadUrl = await avatarRef.getDownloadURL();
          updateInformation.addAll({"photoURL": downloadUrl});
        } on Exception catch (_) {
          emit(const StudentProfileSaveFailureState(
              'Không thể cập nhật avatar'));
          return;
        }
      }
      try {
        final idToken =
            await FirebaseAuth.instance.currentUser?.getIdToken() ?? '';
        final isSuccess = await DioClient.updateUserInformation(
          updateInformation,
          idToken,
        );
        final isUpdated = await DioClient.updateInterestedTopics(
          event.selectedInterestedTopics,
          idToken,
        );
        if (!isSuccess && !isUpdated) {
          throw Exception();
        }
      } on Exception catch (_) {
        emit(const StudentProfileSaveFailureState(
          TextDoc.txtProfileUpdateFailed,
        ));
        return;
      }
    }

    emit(const StudentProfileSaveDoneState());
  }

  void _onChangeAvatar(StudentProfileChangeAvatarEvent event, emit) async {
    final imagePicked = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (imagePicked != null) {
      if (await imagePicked.length() > 1024 * 1000 * 2) {
        avatarException = TextDoc.txtFileMaximumPerFile;
        emit(StudentProfileChangedState(
          avatarException: avatarException,
          fullNameError: fullNameError,
          englishNameError: englishNameError,
          bioError: bioError,
          forceDisabled: checkDisabledButton(),
        ));
      } else if (!(await checkImageExtension(imagePicked))) {
        avatarException = TextDoc.txtFileNotSupported;
        emit(StudentProfileChangedState(
          avatarException: avatarException,
          fullNameError: fullNameError,
          englishNameError: englishNameError,
          bioError: bioError,
          forceDisabled: checkDisabledButton(),
        ));
      } else {
        avatarException = '';
        emit(StudentProfileChangedState(
          avatarException: avatarException,
          avatarUrl: imagePicked.path,
          fullNameError: fullNameError,
          englishNameError: englishNameError,
          bioError: bioError,
          forceDisabled: checkDisabledButton(),
        ));
      }
    }
  }

  Future<bool> checkImageExtension(XFile imagePickedFile) async {
    final data = await imagePickedFile.readAsBytes();
    final mime = lookupMimeType('', headerBytes: data);
    return ["image/png", "image/jpeg", "image/jpg", "image/webp"]
        .contains(mime);
  }

  bool checkDisabledButton() =>
      fullNameError.isNotEmpty ||
      englishNameError.isNotEmpty ||
      bioError.isNotEmpty ||
      avatarException.isNotEmpty;

  bool checkOnlyChar(String data) => !RegExp(
          r'[^ a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễếệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+')
      .hasMatch(data);
}
