part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent {
  const ForgotPasswordEvent();
}

class ForgotPasswordInitEvent extends ForgotPasswordEvent {
  const ForgotPasswordInitEvent();
}

class ForgotPasswordValidateEvent extends ForgotPasswordEvent {
  const ForgotPasswordValidateEvent({
    required this.email,
  });

  final String email;
}

class ForgotPasswordSendEvent extends ForgotPasswordEvent {
  const ForgotPasswordSendEvent({
    required this.email,
  });

  final String email;
}
