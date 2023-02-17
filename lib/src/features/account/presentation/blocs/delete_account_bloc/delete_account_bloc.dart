import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/text.dart';

part 'delete_account_event.dart';
part 'delete_account_state.dart';

class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  DeleteAccountBloc() : super(const DeleteAccountInitState()) {
    on<DeleteAccountInitEvent>(_onInit);
    on<DeleteAccountChangePasswordEvent>(_onChangePassword);
    on<DeleteAccountDeleteEvent>(_onDelete);
  }

  String password = '';

  void _onInit(DeleteAccountInitEvent event, emit) {}

  void _onChangePassword(DeleteAccountChangePasswordEvent event, emit) {
    password = event.password;
    if (password.isEmpty) {
      emit(DeleteAccountPasswordInvalidState(TextDoc.txtPasswordEmptyWarning));
    } else {
      emit(const DeleteAccountPasswordValidState());
    }
  }

  void _onDelete(DeleteAccountDeleteEvent event, emit) async {
    emit(const DeleteAccountLoadingState());

    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        await currentUser.reauthenticateWithCredential(
            EmailAuthProvider.credential(
                email: currentUser.email ?? '', password: password));

        await currentUser
            .delete()
            .then((value) => emit(const DeleteAccountLoadDoneState()));
      } else {
        emit(DeleteAccountLoadErrorState(TextDoc.txtUserNotSignIn));
      }
    } on FirebaseAuthException catch (e) {
      emit(DeleteAccountLoadErrorState(e.message ?? ''));
    } on Exception catch (_) {
      emit(DeleteAccountLoadErrorState(TextDoc.txtDeleteAccountError));
    }
  }
}
