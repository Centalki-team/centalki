part of 'reset_password_bloc.dart';

abstract class ResetPasswordState {
  const ResetPasswordState();
}

class ResetPasswordInitState extends ResetPasswordState {
  const ResetPasswordInitState();
}

class ResetPasswordLoadingState extends ResetPasswordState {
  const ResetPasswordLoadingState();
}

class ResetPasswordLoadDoneState extends ResetPasswordState {
  const ResetPasswordLoadDoneState({
    required this.message,
  });

  final String message;
}

class ResetPasswordLoadErrorState extends ResetPasswordState {
  const ResetPasswordLoadErrorState({
    required this.message,
  });

  final String message;
}

class ResetPasswordValidateState extends ResetPasswordState {
  const ResetPasswordValidateState({
    required this.emailError,
    required this.forceDisabled,
  });

  final String emailError;
  final bool forceDisabled;
}
