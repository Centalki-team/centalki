part of 'delete_account_bloc.dart';

abstract class DeleteAccountState {
  const DeleteAccountState();
}

class DeleteAccountInitState extends DeleteAccountState {
  const DeleteAccountInitState();
}

class DeleteAccountLoadingState extends DeleteAccountState {
  const DeleteAccountLoadingState();
}

class DeleteAccountLoadDoneState extends DeleteAccountState {
  const DeleteAccountLoadDoneState();
}

class DeleteAccountLoadErrorState extends DeleteAccountState {
  const DeleteAccountLoadErrorState(this.message);

  final String message;
}

class DeleteAccountPasswordInvalidState extends DeleteAccountState {
  const DeleteAccountPasswordInvalidState(this.message);

  final String message;
}

class DeleteAccountPasswordValidState extends DeleteAccountState {
  const DeleteAccountPasswordValidState();
}