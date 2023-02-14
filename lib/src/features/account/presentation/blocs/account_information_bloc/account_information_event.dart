part of 'account_information_bloc.dart';

abstract class AccountInformationEvent {
  const AccountInformationEvent();
}

class AccountInformationInitEvent extends AccountInformationEvent {
  const AccountInformationInitEvent();
}

class AccountInformationChangeEvent extends AccountInformationEvent {
  const AccountInformationChangeEvent();
}

class AccountInformationSaveEvent extends AccountInformationEvent {
  const AccountInformationSaveEvent(this.dateOfBirth, this.gender);

  final String dateOfBirth;
  final String gender;
}

class AccountInformationConnectEvent extends AccountInformationEvent {
  const AccountInformationConnectEvent();
}
