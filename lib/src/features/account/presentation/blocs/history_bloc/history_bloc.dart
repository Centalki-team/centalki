import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/text.dart';
import '../../../../../../base/temp_dio/dio_client.dart';
import '../../../../connect_teacher/domain/entities/session_schedule_entity.dart';
import '../../../domain/entities/history_session_entity.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(const HistoryInitState()) {
    on<HistoryInitEvent>(_onInit);
    on<HistoryLoadMoreEvent>(_onLoadMore);
  }

  late final String _idToken;

  void _onInit(HistoryInitEvent event, emit) async {
    emit(const HistoryLoadingState());
    try {
      _idToken = await FirebaseAuth.instance.currentUser?.getIdToken() ?? '';
      final completedSessions =
          await DioClient.getCompletedSessions(idToken: _idToken);
      emit(HistoryLoadDoneState(
          completedSessions.historyMeta?.historyPage ?? 1,
          completedSessions.historyMeta?.completedSessionCount ?? 0,
          completedSessions.historySessions ?? []));
    } on Exception catch (_) {
      emit(HistoryLoadFailureState(TextDoc.txtLoadFailed));
    }
  }

  void _onLoadMore(HistoryLoadMoreEvent event, emit) async {
    try {
      var currentSessions = state.sessionList;
      var moreSessions = await DioClient.getCompletedSessions(
          idToken: _idToken, page: state.currentPage + 1);
      if (moreSessions.historySessions?.isEmpty ?? true) {
        emit(HistoryLoadDoneState(
          state.currentPage,
          state.sessionCount,
          currentSessions,
          hasReachMax: true,
        ));
      } else {
        var currentMoreSessions =
            List<SessionScheduleEntity>.of(currentSessions)
              ..addAll(moreSessions.historySessions!.reversed);
        emit(HistoryLoadDoneState(
            state.currentPage + 1, state.sessionCount, currentMoreSessions));
      }
    } on Exception catch (_) {
      emit(HistoryLoadFailureState(TextDoc.txtLoadFailed));
    }
  }
}
