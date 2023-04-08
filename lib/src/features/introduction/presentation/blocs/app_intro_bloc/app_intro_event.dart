part of 'app_intro_bloc.dart';

abstract class AppIntroEvent {
  const AppIntroEvent();
}

class AppIntroLoadEvent extends AppIntroEvent {
  const AppIntroLoadEvent();
}

class AppIntroScrollEvent extends AppIntroEvent {
  const AppIntroScrollEvent({this.index = 0});

  final int index;
}

class AppIntroSkipEvent extends AppIntroEvent {
  const AppIntroSkipEvent();
}

class AppIntroNextEvent extends AppIntroEvent {
  const AppIntroNextEvent();
}

class AppIntroConfirmEvent extends AppIntroEvent {
  const AppIntroConfirmEvent();
}

class AppIntroCheckShowEvent extends AppIntroEvent {
  const AppIntroCheckShowEvent();
}
