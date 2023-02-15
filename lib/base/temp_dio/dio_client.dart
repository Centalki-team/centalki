import '../../src/features/topic_detail/data/datasources/topics_datasource/remote_data/model/topic_detail_model.dart';
import '../../src/features/topic_detail/domain/entities/topic_detail_entity.dart';
import '../../src/features/topics/data/datasources/topics_datasource/remote_data/model/topic_model.dart';
import '../../src/features/topics/domain/entities/topic_item_entity.dart';
import 'package:dio/dio.dart';

class DioClient {
  static final Dio _dio = Dio();

  static const baseUrl = 'http://api.centalki.com/v1';

  static Future<dynamic> assignRole(String idToken) {
    return _dio.post("$baseUrl/auth/assign-role",
        data: {"idToken": idToken, "role": "STUDENT"});
  }

  static Future<dynamic> validateRole(String? idToken) {
    return _dio.post("$baseUrl/auth/validate-role",
        data: {"idToken": idToken, "role": "STUDENT"});
  }

  static Future<TopicsListEntity> getTopicList() async {
    final response = await _dio.get(
      "$baseUrl/topic",
    );
    return TopicsListBaseModel.fromJson(response.data);
  }

  static Future<TopicDetailEntity> getTopicDetailById(String topicId) async {
    final response = await _dio.get(
      "$baseUrl/topic/$topicId",
    );

    if (response.statusCode != 200) {
      throw Exception(
          'Error ${response.statusCode}\nCannot get detail for topic $topicId');
    }
    if (response.data.toString().isEmpty) {
      throw Exception('ERROR\nTopic does not exist.');
    }

    try {
      return TopicDetailModel.fromJson(response.data['data']);
    } on Exception catch (e) {
      throw Exception('ERROR\nTopic Model Mismatched.');
    }
  }

  static Future<SessionScheduleEntity> createNewSessionSchedule(
      String studentId, String topicId) async {
    final response = await _dio.post("$baseUrl/session-schedule", data: {
      "studentId": studentId,
      "topicId": topicId,
    });
    return SessionScheduleModel.fromJson(response.data);
  }

  static Future<void> cancelSessionSchedule(String sessionId) async {
    if (sessionId.isEmpty) return;
    await _dio.post("$baseUrl/session-schedule/$sessionId/cancel");
  }
}
