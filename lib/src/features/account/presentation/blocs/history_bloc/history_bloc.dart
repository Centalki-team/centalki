import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/text.dart';
import '../../../../../../base/temp_dio/dio_client.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../connect_teacher/domain/entities/session_schedule_entity.dart';

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
        completedSessions.historySessions ?? [],
        hasReachMax:
            !(completedSessions.historyMeta?.historyHasNextPage ?? false),
      ));
      // print(completedSessions.historySessions![0].sessionId);
    } on Exception catch (_) {
      emit(HistoryLoadFailureState(S.current.txtLoadFailed));
    }
  }

  void _onLoadMore(HistoryLoadMoreEvent event, emit) async {
    try {
      var currentSessions = state.sessionList;
      var moreSessions = await DioClient.getCompletedSessions(
          idToken: _idToken, page: state.currentPage + 1);
      var currentMoreSessions = List<SessionScheduleEntity>.of(currentSessions)
        ..addAll(moreSessions.historySessions!);
      emit(HistoryLoadDoneState(
        state.currentPage + 1,
        state.totalCompletedSessionCount,
        currentMoreSessions,
        hasReachMax: !(moreSessions.historyMeta?.historyHasNextPage ?? false),
      ));
    } on Exception catch (_) {
      emit(HistoryLoadFailureState(S.current.txtLoadFailed));
    }
  }
}
