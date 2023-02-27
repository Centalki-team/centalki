import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../../base/define/text.dart';
import '../../../../../../base/temp_dio/dio_client.dart';
import '../../../../../../firebase_options.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInInitState()) {
    on<SignInInitEvent>(_onInit);
    on<SignInValidateEvent>(_onValidate);
    on<SignInSendEvent>(_onSignIn);
    on<GoogleSignInEvent>(_onSignInWithGoogle);
    on<FacebookSignInEvent>(_onSignInWithFB);
  }

  void _onInit(SignInInitEvent event, emit) {}

  void _onValidate(SignInValidateEvent event, emit) {
    final emailRegExp = RegExp(
      r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
    );
    var emailError = '';
    var passwordError = '';

    if (event.email.isEmpty) {
      emailError = TextDoc.txtEmailEmpty;
    } else if (!emailRegExp.hasMatch(event.email)) {
      emailError = TextDoc.txtEmailInvalidFormat;
    }

    if (event.password.isEmpty) {
      passwordError = TextDoc.txtPasswordEmpty;
    }

    emit(SignInValidateState(
      emailError: emailError,
      passwordError: passwordError,
      forceDisabled: emailError.isNotEmpty || passwordError.isNotEmpty,
    ));
  }

  void _onSignIn(SignInSendEvent event, emit) async {
    emit(const SignInLoadingState());

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      final idToken = await credential.user?.getIdToken();
      if (idToken != null) {
        await DioClient.validateRole(idToken);
      }
      emit(const SignInLoadDoneState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(const SignInLoadErrorState(message: TextDoc.txtUserNotFound));
      } else if (e.code == 'wrong-password') {
        emit(const SignInLoadErrorState(message: TextDoc.txtWrongPassword));
      }
    } on DioError catch (_) {
      emit(const SignInLoadErrorState(message: TextDoc.txtNotValidateRole));
    }
  }

  void _onSignInWithGoogle(GoogleSignInEvent event, emit) async {
    emit(const SignInLoadingState());
    // Trigger the authentication flow
    final googleUser = await GoogleSignIn(
            clientId: DefaultFirebaseOptions.currentPlatform.iosClientId)
        .signIn();

    // Obtain the auth details from the request
    final googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(const SignInLoadDoneState());
    } on DioError catch (_) {
      emit(const SignInLoadDoneState());
    }
  }

  void _onSignInWithFB(FacebookSignInEvent event, emit) async {
    emit(const SignInLoadingState());
    // Trigger the sign-in flow
    final loginResult = await FacebookAuth.instance.login();
    try {
      final facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } on DioError catch (_) {
      emit(const SignInLoadDoneState());
    }
  }
}
