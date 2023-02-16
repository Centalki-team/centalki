import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/text.dart';
import '../../../../../../base/temp_dio/dio_client.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpInitState()) {
    on<SignUpInitEvent>(_onInit);
    on<SignUpValidateEvent>(_onValidate);
    on<SignUpSubmitEvent>(_onSubmit);
  }

  void _onInit(SignUpInitEvent event, emit) {}

  void _onValidate(SignUpValidateEvent event, emit) {
    final emailRegExp = RegExp(
      r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
    );

    var fullnameError = '';
    var emailError = '';
    var passwordError = '';
    var retypePasswordError = '';
    var termsError = '';
    var signUpButtonDisabled = false;

    if (event.fullname.isEmpty) {
      fullnameError = 'Name cannot be empty';
    }

    if (event.email.isEmpty) {
      emailError = TextDoc.txtEmailEmptyWarning;
    } else if (emailRegExp.hasMatch(event.email) == false) {
      emailError = TextDoc.txtEmailInvalidFormatWarning;
    }

    if (event.password.isEmpty) {
      passwordError = TextDoc.txtPasswordEmptyWarning;
    } else if (event.password.length < 6) {
      passwordError = 'Password must contain at least 6 characters';
    }

    if (event.retypePassword.isEmpty) {
      retypePasswordError = 'Please enter your password again';
    } else if (event.retypePassword != event.password) {
      retypePasswordError = 'Retyped password mismatched';
    }

    if (event.isTermsAccepted == false) {
      termsError = 'Please agree with our Terms & Conditions';
    }

    signUpButtonDisabled = fullnameError.isNotEmpty ||
        emailError.isNotEmpty ||
        passwordError.isNotEmpty ||
        retypePasswordError.isNotEmpty ||
        termsError.isNotEmpty;

    emit(SignUpValidateState(
      fullnameError: fullnameError,
      emailError: emailError,
      passwordError: passwordError,
      retypePasswordError: retypePasswordError,
      termsError: termsError,
      forceDisabled: signUpButtonDisabled,
    ));
  }

  void _onSubmit(SignUpSubmitEvent event, emit) async {
    emit(const SignUpLoadingState());

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email.trim(),
        password: event.password.trim(),
      );

      credential.user?.getIdToken().then(DioClient.assignRole);
      emit(const SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          emit(const SignUpErrorState(message: 'The password provided is too weak.'));
          break;
        case 'email-already-in-use':
          emit(const SignUpErrorState(message: 'Email is used by another account.'));
          break;
        default:
          break;
      }
    } on DioError catch (_) {
      emit(SignUpErrorState(message: TextDoc.txtNotValidateRole));
    }
  }
}
