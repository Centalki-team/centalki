part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object?> get props => [];
}

class SignInInitState extends SignInState {
  const SignInInitState();
}

class SignInLoadingState extends SignInState {
  const SignInLoadingState();
}

class SignInLoadDoneState extends SignInState {
  const SignInLoadDoneState();
}

class SignInLoadErrorState extends SignInState {
  const SignInLoadErrorState({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [
        message,
      ];
}

class SignInValidateState extends SignInState {
  const SignInValidateState({
    required this.emailError,
    required this.passwordError,
    required this.forceDisabled,
  });

  final String emailError;
  final String passwordError;
  final bool forceDisabled;

  @override
  List<Object?> get props => [
        emailError,
        passwordError,
        forceDisabled,
      ];
}

class SignInVerifyEmailState extends SignInState {
  const SignInVerifyEmailState();
}
