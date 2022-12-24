part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState {
  const ForgotPasswordState();
}

class ForgotPasswordInitState extends ForgotPasswordState {
  const ForgotPasswordInitState();
}

class ForgotPasswordLoadingState extends ForgotPasswordState {
  const ForgotPasswordLoadingState();
}

class ForgotPasswordLoadDoneState extends ForgotPasswordState {
  const ForgotPasswordLoadDoneState({
    required this.message,
  });

  final String message;
}

class ForgotPasswordLoadErrorState extends ForgotPasswordState {
  const ForgotPasswordLoadErrorState({
    required this.message,
  });

  final String message;
}

class ForgotPasswordValidateState extends ForgotPasswordState {
  const ForgotPasswordValidateState({
    required this.emailError,
    required this.forceDisabled,
  });

  final String emailError;
  final bool forceDisabled;
}
