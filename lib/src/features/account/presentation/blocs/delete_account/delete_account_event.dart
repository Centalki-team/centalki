part of 'delete_account_bloc.dart';

abstract class DeleteAccountEvent {
  const DeleteAccountEvent();
}

class DeleteAccountInitEvent extends DeleteAccountEvent {
  const DeleteAccountInitEvent();
}

class DeleteAccountChangePasswordEvent extends DeleteAccountEvent {
  const DeleteAccountChangePasswordEvent(this.password);

  final String password;
}

class DeleteAccountDeleteEvent extends DeleteAccountEvent {
  const DeleteAccountDeleteEvent();
}