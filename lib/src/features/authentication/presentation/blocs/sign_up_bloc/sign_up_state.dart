part of 'sign_up_bloc.dart';

abstract class SignUpState {
  const SignUpState();
}

class SignUpInitState extends SignUpState {
  const SignUpInitState();
}

class SignUpLoadingState extends SignUpState {
  const SignUpLoadingState();
}

class SignUpSuccessState extends SignUpState {
  const SignUpSuccessState();
}

class SignUpErrorState extends SignUpState {
  const SignUpErrorState({
    required this.message,
  });

  final String message;
}

class SignUpValidateState extends SignUpState {
  const SignUpValidateState({
    required this.fullnameError,
    required this.emailError,
    required this.passwordError,
    required this.retypePasswordError,
    required this.termsError,
    required this.forceDisabled,
  });

  final String fullnameError;
  final String emailError;
  final String passwordError;
  final String retypePasswordError;
  final String termsError;
  final bool forceDisabled;
}
