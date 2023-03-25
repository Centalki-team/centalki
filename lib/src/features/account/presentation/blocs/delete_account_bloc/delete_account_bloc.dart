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
    if (password.length > 100) {
      emit(const DeleteAccountPasswordInvalidState(TextDoc.txtPasswordTooLong));
    } else {
      emit(const DeleteAccountPasswordValidState());
    }
  }

  void _onDelete(DeleteAccountDeleteEvent event, emit) async {
    emit(const DeleteAccountLoadingState());

    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        for (var element in currentUser.providerData) {
          switch (element.providerId) {
            case 'password':
              await currentUser.reauthenticateWithCredential(
                  EmailAuthProvider.credential(
                      email: currentUser.email ?? '', password: password));
              break;
            case 'google.com':
            case 'facebook.com':
              if (DateTime
                  .now()
                  .difference(currentUser.metadata.lastSignInTime!)
                  .inDays >
                  7) {
                throw FirebaseAuthException(
                    code: '', message: TextDoc.txtSignInAgainToDelete);
              }
              break;
            default:
          }
        }

        await currentUser
            .delete()
            .then((value) => emit(const DeleteAccountLoadDoneState()));
      } else {
        emit(const DeleteAccountLoadErrorState(TextDoc.txtUserNotSignIn));
      }
    } on FirebaseAuthException catch (e) {
      emit(DeleteAccountLoadErrorState(e.message ?? ''));
    } on Exception catch (_) {
      emit(const DeleteAccountLoadErrorState(TextDoc.txtDeleteAccountError));
    }
  }
}
