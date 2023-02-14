import 'package:flutter_bloc/flutter_bloc.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(const HistoryInitState()) {
    on<HistoryInitEvent>(_onInit);
  }

  void _onInit(HistoryInitEvent event, emit) async {
    emit(const HistoryLoadingState());

    await Future.delayed(const Duration(seconds: 2));

    emit(const HistoryLoadDoneState());
  }
}