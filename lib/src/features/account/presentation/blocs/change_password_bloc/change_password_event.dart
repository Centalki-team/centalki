part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent {
  const ChangePasswordEvent();
}

class ChangePasswordSendPasswordEvent extends ChangePasswordEvent {
  const ChangePasswordSendPasswordEvent(
      this.password,
      this.newPassword,
      this.confirmPassword,
      );

  final String password;
  final String newPassword;
  final String confirmPassword;
}

class ChangePasswordChangeEvent extends ChangePasswordEvent {
  const ChangePasswordChangeEvent();
}
