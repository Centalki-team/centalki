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
    this.historyPage,
    this.completedSessionCount,
  });

  final int? historyPage;
  final int? completedSessionCount;
}
