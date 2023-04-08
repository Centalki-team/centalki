part of 'app_intro_bloc.dart';

abstract class AppIntroState extends Equatable {
  const AppIntroState();

  @override
  List<Object?> get props => [];
}

class AppIntroInitState extends AppIntroState {
  const AppIntroInitState();
}

class AppIntroLoadedState extends AppIntroState {
  const AppIntroLoadedState({
    required this.appIntros,
  });

  final List<AppIntroEntity> appIntros;

  @override
  List<Object?> get props => [
        appIntros,
      ];
}

class AppIntroPageIndexChangeState extends AppIntroState {
  const AppIntroPageIndexChangeState({
    this.currentIndex = 0,
  });

  final int currentIndex;

  @override
  List<Object?> get props => [
        currentIndex,
      ];
}
