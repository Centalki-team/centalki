import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/text.dart';
import '../../../../../../base/temp_dio/dio_client.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInInitState()) {
    on<SignInInitEvent>(_onInit);
    on<SignInValidateEvent>(_onValidate);
    on<SignInSendEvent>(_onSignIn);
  }

  void _onInit(SignInInitEvent event, emit) {}

  void _onValidate(SignInValidateEvent event, emit) {
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
    );
    String emailError = '';
    String passwordError = '';

    if (event.email.isEmpty) {
      emailError = TextDoc.txtEmailEmptyWarning;
    } else if (!emailRegExp.hasMatch(event.email)) {
      emailError = TextDoc.txtEmailInvalidFormatWarning;
    }

    if (event.password.isEmpty) {
      passwordError = TextDoc.txtPasswordEmptyWarning;
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
        emit(SignInLoadErrorState(
            message: TextDoc.txtUserNotFound));
      } else if (e.code == 'wrong-password') {
        emit(SignInLoadErrorState(
            message: TextDoc.txtWrongPassword));
      }
    } on DioError catch (_) {
      emit(SignInLoadErrorState(message: TextDoc.txtNotValidateRole));
    }
  }
}
