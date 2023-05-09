import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/text.dart';
import '../../../../../shared/extensions.dart';

part 'change_password_event.dart';

part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(const ChangePasswordInitState()) {
    on<ChangePasswordSendPasswordEvent>(_onSendPassword);
    on<ChangePasswordChangeEvent>(_onChange);
  }

  var currentPassword = '';
  var newPassword = '';
  var confirmPassword = '';

  String? passwordError;
  String? newPasswordError;
  String? confirmPasswordError;

  void _onSendPassword(ChangePasswordSendPasswordEvent event, emit) {
    currentPassword = event.password;
    newPassword = event.newPassword;
    confirmPassword = event.confirmPassword;

    if (currentPassword.isEmpty) {
      passwordError = TextDoc.txtPasswordEmpty;
    } else if (currentPassword.length < 8) {
      passwordError = TextDoc.txtPasswordTooShort;
    } else if (currentPassword.length > 100) {
      passwordError = TextDoc.txtPasswordTooLong;
    } else if (!currentPassword.validatePassword) {
      newPasswordError = TextDoc.txtPasswordNotValid;
    } else {
      passwordError = null;
    }

    if (newPassword.isEmpty) {
      newPasswordError = TextDoc.txtNewPasswordEmptyWarning;
    } else if (newPassword.length < 8) {
      newPasswordError = TextDoc.txtNewPasswordTooShort;
    } else if (newPassword.length > 100) {
      newPasswordError = TextDoc.txtNewPasswordTooLong;
    } else if (!newPassword.validatePassword) {
      newPasswordError = TextDoc.txtNewPasswordNotValid;
    } else {
      newPasswordError = null;
    }

    if (confirmPassword.isEmpty) {
      confirmPasswordError = TextDoc.txtConfirmedPasswordEmptyWarning;
    } else if (confirmPassword != newPassword) {
      confirmPasswordError = TextDoc.txtConfirmedPasswordMatchWarning;
    } else {
      confirmPasswordError = null;
    }

    emit(const ChangePasswordInitState());
    if (passwordError == null &&
        newPasswordError == null &&
        confirmPasswordError == null) {
      emit(const ChangePasswordValidInputState());
    } else {
      emit(ChangePasswordInvalidInputState(
        passwordError: passwordError,
        newPasswordError: newPasswordError,
        confirmPasswordError: confirmPasswordError,
      ));
    }
  }

  void _onChange(ChangePasswordChangeEvent event, emit) async {
    emit(const ChangePasswordLoadingState());

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      try {
        await currentUser
            .reauthenticateWithCredential(EmailAuthProvider.credential(
          email: currentUser.email ?? '',
          password: currentPassword,
        ));
        await currentUser.updatePassword(newPassword);
        emit(const ChangePasswordLoadDoneState());
      } on FirebaseAuthException catch (e) {
        emit(ChangePasswordLoadErrorState(e.message ?? ''));
      } on Exception catch (_) {
        emit(const ChangePasswordLoadErrorState(
          TextDoc.txtChangePasswordError,
        ));
      }
    } else {
      emit(const ChangePasswordLoadErrorState(
        TextDoc.txtUserNotSignIn,
      ));
    }
  }
}
