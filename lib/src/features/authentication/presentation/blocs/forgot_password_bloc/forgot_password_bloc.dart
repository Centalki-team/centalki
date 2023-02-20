import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/text.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(const ForgotPasswordInitState()) {
    on<ForgotPasswordInitEvent>(_onInit);
    on<ForgotPasswordValidateEvent>(_onValidate);
    on<ForgotPasswordSendEvent>(_onForgotPassword);
  }

  void _onInit(ForgotPasswordInitEvent event, emit) {}

  void _onValidate(ForgotPasswordValidateEvent event, emit) {
    final emailRegExp = RegExp(
      r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
    );
    var emailError = '';

    if (event.email.isEmpty) {
      emailError = TextDoc.txtEmailEmpty;
    } else if (!emailRegExp.hasMatch(event.email)) {
      emailError = TextDoc.txtEmailInvalidFormat;
    }

    emit(ForgotPasswordValidateState(
        emailError: emailError, forceDisabled: emailError.isNotEmpty));
  }

  void _onForgotPassword(ForgotPasswordSendEvent event, emit) async {
    emit(const ForgotPasswordLoadingState());

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: event.email);
      emit(ForgotPasswordLoadDoneState(
          message:
              'Reset password link was sent to email address: ${event.email}!\nPlease do not share to anybody!'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(const ForgotPasswordLoadErrorState(message: TextDoc.txtUserNotFound));
      }
    }
  }
}
