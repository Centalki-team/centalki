part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent {
  const ResetPasswordEvent();
}

class ResetPasswordInitEvent extends ResetPasswordEvent {
  const ResetPasswordInitEvent();
}

class ResetPasswordValidateEvent extends ResetPasswordEvent {
  const ResetPasswordValidateEvent({
    required this.email,
  });

  final String email;
}

class ResetPasswordSendEvent extends ResetPasswordEvent {
  const ResetPasswordSendEvent({
    required this.email,
  });

  final String email;
}
