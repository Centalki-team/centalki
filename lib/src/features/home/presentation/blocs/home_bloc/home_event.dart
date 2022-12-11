part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class HomeInitEvent extends HomeEvent {
  const HomeInitEvent();
}

class HomeChangeTabEvent extends HomeEvent {
  const HomeChangeTabEvent({
    required this.desTab,
  });

  final int desTab;
}
