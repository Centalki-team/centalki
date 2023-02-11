import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/text.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(const ChangePasswordInitState()) {
    on<ChangePasswordSendPasswordEvent>(_onSendPassword);
    on<ChangePasswordSendNewPasswordEvent>(_onSendNewPassword);
    on<ChangePasswordSendConfirmPasswordEvent>(_onSendConfirmPassword);
    on<ChangePasswordChangeEvent>(_onChange);
  }

  var currentPassword = '';
  var newPassword = '';
  var confirmPassword = '';

  void _onSendPassword(ChangePasswordSendPasswordEvent event, emit) {
    currentPassword = event.password;

    if (currentPassword.isEmpty) {
      if (newPassword.isEmpty) {
        if (confirmPassword.isEmpty) {
          emit(const ChangePasswordInvalidInputState());
        } else {
          emit(ChangePasswordInvalidInputState(
              passwordError: TextDoc.txtPasswordEmptyWarning,
              newPasswordError: 'New password cannot be empty'));
        }
      } else {
        if (confirmPassword.isEmpty || confirmPassword != newPassword) {
          emit(ChangePasswordInvalidInputState(
              passwordError: TextDoc.txtPasswordEmptyWarning,
              confirmPasswordError:
                  'Confirmed password must match the new password'));
        } else {
          emit(ChangePasswordInvalidInputState(
              passwordError: TextDoc.txtPasswordEmptyWarning));
        }
      }
    } else {
      if (newPassword.isEmpty) {
        if (confirmPassword.isEmpty) {
          emit(const ChangePasswordInvalidInputState(
              newPasswordError: 'New password cannot be empty',
              confirmPasswordError: 'Confirmed password cannot be empty'));
        } else {
          emit(const ChangePasswordInvalidInputState(
              newPasswordError: 'New password cannot be empty'));
        }
      } else {
        if (confirmPassword.isEmpty || confirmPassword != newPassword) {
          emit(const ChangePasswordInvalidInputState(
              confirmPasswordError:
                  'Confirmed password must match the new password'));
        } else {
          emit(const ChangePasswordValidInputState());
        }
      }
    }
  }

  void _onSendNewPassword(ChangePasswordSendNewPasswordEvent event, emit) {
    newPassword = event.newPassword;

    if (currentPassword.isEmpty) {
      if (newPassword.isEmpty) {
        if (confirmPassword.isEmpty) {
          emit(const ChangePasswordInvalidInputState());
        } else {
          emit(ChangePasswordInvalidInputState(
              passwordError: TextDoc.txtPasswordEmptyWarning,
              newPasswordError: 'New password cannot be empty'));
        }
      } else {
        if (confirmPassword.isEmpty || confirmPassword != newPassword) {
          emit(ChangePasswordInvalidInputState(
              passwordError: TextDoc.txtPasswordEmptyWarning,
              confirmPasswordError:
                  'Confirmed password must match the new password'));
        } else {
          emit(ChangePasswordInvalidInputState(
              passwordError: TextDoc.txtPasswordEmptyWarning));
        }
      }
    } else {
      if (newPassword.isEmpty) {
        if (confirmPassword.isEmpty) {
          emit(const ChangePasswordInvalidInputState(
              newPasswordError: 'New password cannot be empty',
              confirmPasswordError: 'Confirmed password cannot be empty'));
        } else {
          emit(const ChangePasswordInvalidInputState(
              newPasswordError: 'New password cannot be empty'));
        }
      } else {
        if (confirmPassword.isEmpty || confirmPassword != newPassword) {
          emit(const ChangePasswordInvalidInputState(
              confirmPasswordError:
                  'Confirmed password must match the new password'));
        } else {
          emit(const ChangePasswordValidInputState());
        }
      }
    }
  }

  void _onSendConfirmPassword(
      ChangePasswordSendConfirmPasswordEvent event, emit) {
    confirmPassword = event.confirmPassword;

    if (currentPassword.isEmpty) {
      if (newPassword.isEmpty) {
        if (confirmPassword.isEmpty) {
          emit(const ChangePasswordInvalidInputState());
        } else {
          emit(ChangePasswordInvalidInputState(
              passwordError: TextDoc.txtPasswordEmptyWarning,
              newPasswordError: 'New password cannot be empty'));
        }
      } else {
        if (confirmPassword.isEmpty || confirmPassword != newPassword) {
          emit(ChangePasswordInvalidInputState(
              passwordError: TextDoc.txtPasswordEmptyWarning,
              confirmPasswordError:
                  'Confirmed password must match the new password'));
        } else {
          emit(ChangePasswordInvalidInputState(
              passwordError: TextDoc.txtPasswordEmptyWarning));
        }
      }
    } else {
      if (newPassword.isEmpty) {
        if (confirmPassword.isEmpty) {
          emit(const ChangePasswordInvalidInputState(
              newPasswordError: 'New password cannot be empty',
              confirmPasswordError: 'Confirmed password cannot be empty'));
        } else {
          emit(const ChangePasswordInvalidInputState(
              newPasswordError: 'New password cannot be empty'));
        }
      } else {
        if (confirmPassword.isEmpty || confirmPassword != newPassword) {
          emit(const ChangePasswordInvalidInputState(
              confirmPasswordError:
                  'Confirmed password must match the new password'));
        } else {
          emit(const ChangePasswordValidInputState());
        }
      }
    }
  }

  void _onChange(ChangePasswordChangeEvent event, emit) async {
    emit(const ChangePasswordLoadingState());

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      try {
        await currentUser.reauthenticateWithCredential(
            EmailAuthProvider.credential(
                email: currentUser.email ?? '', password: currentPassword));
        await currentUser.updatePassword(newPassword);
        emit(const ChangePasswordLoadDoneState());
      } on FirebaseAuthException catch (e) {
        emit(ChangePasswordLoadErrorState(e.message ?? ''));
      } on Exception catch (_) {
        emit(const ChangePasswordLoadErrorState(
            'Something went wrong. Please try again later!'));
      }
    } else {
      emit(const ChangePasswordLoadErrorState('User does not sign in!'));
    }
  }
}
