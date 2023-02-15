import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../../topic_detail/data/datasources/topics_datasource/remote_data/model/topic_detail_model.dart';
import '../../../../../domain/entities/session_schedule_entity.dart';

part 'session_schedule_model.g.dart';

@JsonSerializable()
class SessionScheduleModel extends SessionScheduleEntity {
  SessionScheduleModel(
      {this.id,
      this.studentId,
      this.topic,
      this.teacherId,
      this.startAt,
      this.pickedUpAt,
      this.status,
      this.createdAt})
      : super(
          sessionId: id,
          sessionStudentId: studentId,
          sessionTopicId: topic?.id,
          sessionTeacherId: teacherId,
          sessionStatus: SessionScheduleStatus.values
              .firstWhere((element) => element.name == status),
        );

  final String? id;
  final String? studentId;
  final TopicDetailModel? topic;
  final String? teacherId;
  final String? startAt;
  final String? pickedUpAt;
  final String? status;
  final String? createdAt;

  factory SessionScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$SessionScheduleModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionScheduleModelToJson(this);
}
