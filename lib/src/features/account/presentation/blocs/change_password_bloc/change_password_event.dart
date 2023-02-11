part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent {
  const ChangePasswordEvent();
}

class ChangePasswordSendPasswordEvent extends ChangePasswordEvent {
  const ChangePasswordSendPasswordEvent(this.password);

  final String password;
}

class ChangePasswordSendNewPasswordEvent extends ChangePasswordEvent {
  const ChangePasswordSendNewPasswordEvent(this.newPassword);

  final String newPassword;
}

class ChangePasswordSendConfirmPasswordEvent extends ChangePasswordEvent {
  const ChangePasswordSendConfirmPasswordEvent(this.confirmPassword);

  final String confirmPassword;
}

class ChangePasswordChangeEvent extends ChangePasswordEvent {
  const ChangePasswordChangeEvent();
}
