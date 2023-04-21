import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/gateway/exception/app_exception.dart';

part 'history_detail_event.dart';
part 'history_detail_state.dart';

class HistoryDetailBloc extends Bloc<HistoryDetailEvent, HistoryDetailState> {
  HistoryDetailBloc() : super(const HistoryDetailInitState()) {
    on<HistoryDetailInitEvent>(_onInit);
    on<HistoryDetailLoadEvent>(_onLoad);
    add(const HistoryDetailInitEvent());
  }

  void _onInit(HistoryDetailInitEvent event, emit) {
    add(const HistoryDetailLoadEvent());
  }

  void _onLoad(HistoryDetailLoadEvent event, emit) async {
    // emit(const HistoryDetailLoadingState());

    // final contents = await getSessionFeedbackContentUseCase(null);
    // emit(const HistoryDetailLoadingState(showLoading: false));
    // contents.fold(
    //   (l) => emit(
    //     HistoryDetailLoadFailedState(
    //       exception: l,
    //     ),
    //   ),
    //   (r) => emit(
    //     HistoryDetailLoadDoneState(
    //       contents: r,
    //     ),
    //   ),
    // );
  }
}
