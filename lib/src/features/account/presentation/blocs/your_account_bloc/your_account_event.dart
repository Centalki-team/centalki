part of 'your_account_bloc.dart';

abstract class YourAccountEvent {
  const YourAccountEvent();
}

class YourAccountInitEvent extends YourAccountEvent {
  const YourAccountInitEvent();
}

class YourAccountLoadEvent extends YourAccountEvent {
  const YourAccountLoadEvent();
}

class YourAccountLogOutEvent extends YourAccountEvent {
  const YourAccountLogOutEvent();
}