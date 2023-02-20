import 'package:json_annotation/json_annotation.dart';

import '../../../../../connect_teacher/data/datasources/schedule_datasource/remote_data/model/session_schedule_model.dart';
import '../../../../domain/entities/history_session_entity.dart';

part 'history_session_model.g.dart';

@JsonSerializable(createToJson: false)
class HistorySessionModel extends HistorySessionEntity {
  const HistorySessionModel({
    this.meta,
    this.data,
  }) : super(
          historyMeta: meta,
          historySessions: data,
        );

  final HistoryMetaModel? meta;
  final List<SessionScheduleModel>? data;

  factory HistorySessionModel.fromJson(Map<String, dynamic> json) =>
      _$HistorySessionModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class HistoryMetaModel extends HistoryMetaEntity {
  const HistoryMetaModel({
    this.hasNextPage,
    this.hasPrevPage,
    this.page,
    this.size,
    this.completedSession,
  }) : super(
          historyPage: page,
          completedSessionCount: completedSession,
        );

  final bool? hasNextPage;
  final bool? hasPrevPage;
  final int? page;
  final int? size;
  final int? completedSession;

  factory HistoryMetaModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryMetaModelFromJson(json);
}
