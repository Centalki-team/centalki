part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object?> get props => [];
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

  @override
  List<Object?> get props => [
        message,
      ];
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

  @override
  List<Object?> get props => [
        fullnameError,
        emailError,
        passwordError,
        retypePasswordError,
        termsError,
        forceDisabled,
      ];
}

class SetInitLevelLoadingState extends SignUpState {
  const SetInitLevelLoadingState({
    this.showLoading = true,
  });

  final bool showLoading;

  @override
  List<Object?> get props => [
        showLoading,
      ];
}

class SetInitialLevelDoneState extends SignUpState {
  const SetInitialLevelDoneState();
}

class SetInitialLevelErrorState extends SignUpState {
  const SetInitialLevelErrorState({
    required this.exception,
  });

  final AppException exception;

  @override
  List<Object?> get props => [
        exception,
      ];
}
