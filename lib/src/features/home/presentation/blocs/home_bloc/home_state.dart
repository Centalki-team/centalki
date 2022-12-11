part of 'home_bloc.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitState extends HomeState {
  const HomeInitState();
}

class HomeChangeTabState extends HomeState {
  const HomeChangeTabState({
    required this.currentTab,
  });

  final int currentTab;
}
