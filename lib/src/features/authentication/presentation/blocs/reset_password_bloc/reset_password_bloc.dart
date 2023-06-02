import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../generated/l10n.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(const ResetPasswordInitState()) {
    on<ResetPasswordInitEvent>(_onInit);
    on<ResetPasswordValidateEvent>(_onValidate);
    on<ResetPasswordSendEvent>(_onResetPassword);
  }

  void _onInit(ResetPasswordInitEvent event, emit) {}

  void _onValidate(ResetPasswordValidateEvent event, emit) {
    final emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );
    var emailError = '';

    if (event.email.isEmpty) {
      emailError = S.current.txtEmailEmpty;
    } else if (!emailRegExp.hasMatch(event.email)) {
      emailError = S.current.txtEmailInvalidFormat;
    }

    emit(ResetPasswordValidateState(
        emailError: emailError, forceDisabled: emailError.isNotEmpty));
  }

  void _onResetPassword(ResetPasswordSendEvent event, emit) async {
    emit(const ResetPasswordLoadingState());

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: event.email);
      emit(ResetPasswordLoadDoneState(
          message:
              'Reset password link was sent to email address: ${event.email}!\nPlease do not share to anybody!'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(ResetPasswordLoadErrorState(message: S.current.txtUserNotFound));
      }
    }
  }
}
