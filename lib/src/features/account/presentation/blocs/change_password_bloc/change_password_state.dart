part of 'change_password_bloc.dart';

abstract class ChangePasswordState {
  const ChangePasswordState();
}

class ChangePasswordInitState extends ChangePasswordState {
  const ChangePasswordInitState();
}

class ChangePasswordLoadingState extends ChangePasswordState {
  const ChangePasswordLoadingState();
}

class ChangePasswordLoadDoneState extends ChangePasswordState {
  const ChangePasswordLoadDoneState();
}

class ChangePasswordLoadErrorState extends ChangePasswordState {
  const ChangePasswordLoadErrorState(this.message);

  final String message;
}

class ChangePasswordInvalidInputState extends ChangePasswordState {
  const ChangePasswordInvalidInputState(
      {this.passwordError, this.newPasswordError, this.confirmPasswordError});

  final String? passwordError;
  final String? newPasswordError;
  final String? confirmPasswordError;
}

class ChangePasswordValidInputState extends ChangePasswordState {
  const ChangePasswordValidInputState();
}
