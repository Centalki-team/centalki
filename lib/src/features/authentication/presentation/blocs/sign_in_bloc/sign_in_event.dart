part of 'sign_in_bloc.dart';

abstract class SignInEvent {
  const SignInEvent();
}

class SignInInitEvent extends SignInEvent {
  const SignInInitEvent();
}

class SignInValidateEvent extends SignInEvent {
  const SignInValidateEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class SignInSendEvent extends SignInEvent {
  const SignInSendEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class GoogleSignInEvent extends SignInEvent {
  const GoogleSignInEvent();
}

class FacebookSignInEvent extends SignInEvent {
  const FacebookSignInEvent();
}
