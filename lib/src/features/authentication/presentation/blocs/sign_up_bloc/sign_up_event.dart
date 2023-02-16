part of 'sign_up_bloc.dart';

abstract class SignUpEvent {
  const SignUpEvent();
}

class SignUpInitEvent extends SignUpEvent {
  const SignUpInitEvent();
}

class SignUpValidateEvent extends SignUpEvent {
  const SignUpValidateEvent({
    required this.fullname,
    required this.email,
    required this.password,
    required this.retypePassword,
    required this.isTermsAccepted,
  });

  final String fullname;
  final String email;
  final String password;
  final String retypePassword;
  final bool isTermsAccepted;
}

class SignUpSubmitEvent extends SignUpEvent {
  const SignUpSubmitEvent({
    required this.fullname,
    required this.email,
    required this.password,
  });

  final String fullname;
  final String email;
  final String password;
}
