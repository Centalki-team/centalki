part of 'account_information_bloc.dart';

abstract class AccountInformationState {
  const AccountInformationState();
}

class AccountInformationInitState extends AccountInformationState {
  const AccountInformationInitState();
}

class AccountInformationLoadingState extends AccountInformationState {
  const AccountInformationLoadingState();
}

class AccountInformationLoadDoneState extends AccountInformationState {
  const AccountInformationLoadDoneState(this.email, this.phoneNumber, this.dateOfBirth, this.gender);

  final String email;
  final String phoneNumber;
  final DateTime dateOfBirth;
  final Gender gender;
}

class AccountInformationLoadFailureState extends AccountInformationState {
  const AccountInformationLoadFailureState(this.message);

  final String message;
}

class AccountInformationSavingState extends AccountInformationState {
  const AccountInformationSavingState();
}

class AccountInformationSaveDoneState extends AccountInformationState {
  const AccountInformationSaveDoneState();
}

class AccountInformationSaveFailureState extends AccountInformationState {
  const AccountInformationSaveFailureState(this.message);

  final String message;
}

class AccountInformationChangingState extends AccountInformationState {
  const AccountInformationChangingState();
}