part of 'application_bloc.dart';

abstract class ApplicationEvent {
  const ApplicationEvent();
}

class ApplicationLoaded extends ApplicationEvent {}

class ApplicationLocaleChanged extends ApplicationEvent {
  ApplicationLocaleChanged({required this.locale});

  final String locale;
}

class ApplicationDarkModeChanged extends ApplicationEvent {
  ApplicationDarkModeChanged({
    required this.enable,
  });

  final bool enable;
}