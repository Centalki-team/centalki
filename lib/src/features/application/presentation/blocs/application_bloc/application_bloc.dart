import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(const ApplicationState()) {
    on<ApplicationLocaleChanged>(_onLocaleChanged);
  }

  _onLocaleChanged(ApplicationLocaleChanged event, emit) async {
    if (state.locale != event.locale) {
      emit(state.copyWith(
        status: UIStatus.loading,
      ));

      

      emit(state.copyWith(
        status: UIStatus.loadSuccess,
        locale: event.locale,
      ));
    }
  }
}
