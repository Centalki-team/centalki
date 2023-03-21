import '../../../connect_teacher/domain/entities/session_schedule_entity.dart';

class HistorySessionEntity {
  const HistorySessionEntity({
    this.historyMeta,
    this.historySessions,
  });

  final HistoryMetaEntity? historyMeta;
  final List<SessionScheduleEntity>? historySessions;
}

class HistoryMetaEntity {
  const HistoryMetaEntity({
    this.historyHasNextPage,
    this.historyHasPrevPage,
    this.historyPage,
    this.historyPageSize,
    this.completedSessionCount,
  });

  final bool? historyHasNextPage;
  final bool? historyHasPrevPage;
  final int? historyPage;
  final int? historyPageSize;
  final int? completedSessionCount;
}
