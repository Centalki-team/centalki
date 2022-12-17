import 'package:centalki/src/features/topic/data/datasources/topics_datasource/remote_data/model/topic_model.dart';

import '../../src/features/topic/domain/entities/topic_detail.dart';
import '../../src/features/topic/domain/entities/topic_item_entity.dart';
import 'package:dio/dio.dart';

class DioClient {
  static final Dio _dio = Dio();

  static const baseUrl = 'https://centalki-master.onrender.com/v1';

  static Future<dynamic> assignRole(String idToken) {
    return _dio.post("$baseUrl/auth/assign-role",
        data: {"idToken": idToken, "role": "STUDENT"});
  }

  static Future<dynamic> validateRole(String? idToken) {
    return _dio.post(
        "$baseUrl/auth/validate-role",
        data: {"idToken": idToken, "role": "STUDENT"});
  }

  static Future<TopicsListEntity> getTopicList() async {
    final response = await _dio.get(
      "$baseUrl/topic",
    );
    return TopicsListBaseModel.fromJson(response.data);
  }
  
  static Future<TopicDetail> getTopicDetailById(String topicId) async {
    final response = await _dio.get("$baseUrl/topic/$topicId");
    return TopicDetail.fromJson(response.data);
  }
}
