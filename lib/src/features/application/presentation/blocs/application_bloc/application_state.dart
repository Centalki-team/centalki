part of 'application_bloc.dart';

enum UIStatus {
  initial,
  loading,
  loadSuccess,
  loadFailed,
}

class ApplicationState extends Equatable {
  const ApplicationState({
    this.status = UIStatus.loading,
    this.locale = 'en',
  });

  final UIStatus status;
  final String locale;

  ApplicationState copyWith({
    UIStatus? status,
    String? locale,
    //bool? isDarkMode,
    // AuthStatus? authStatus,
  }) =>
      ApplicationState(
        status: status ?? this.status,
        locale: locale ?? this.locale,
        //isDarkMode: isDarkMode ?? this.isDarkMode,
        // authStatus: authStatus ?? this.authStatus,
      );

  @override
  List<Object?> get props => [
        status,
        locale,
      ];
}
