// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistorySessionModel _$HistorySessionModelFromJson(Map<String, dynamic> json) =>
    HistorySessionModel(
      meta: json['meta'] == null
          ? null
          : HistoryMetaModel.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SessionScheduleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

HistoryMetaModel _$HistoryMetaModelFromJson(Map<String, dynamic> json) =>
    HistoryMetaModel(
      hasNextPage: json['hasNextPage'] as bool?,
      hasPrevPage: json['hasPrevPage'] as bool?,
      page: json['page'] as int?,
      size: json['size'] as int?,
      completedSession: json['completedSession'] as int?,
    );
