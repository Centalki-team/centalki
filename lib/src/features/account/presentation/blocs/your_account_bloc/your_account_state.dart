part of 'your_account_bloc.dart';

abstract class YourAccountState {
  const YourAccountState();
}

class YourAccountInitState extends YourAccountState {
  const YourAccountInitState();
}

class YourAccountLoadingState extends YourAccountState {
  const YourAccountLoadingState();
}

class YourAccountLoadDoneState extends YourAccountState {
  const YourAccountLoadDoneState();
}

class YourAccountLoadErrorState extends YourAccountState {
  const YourAccountLoadErrorState();
}