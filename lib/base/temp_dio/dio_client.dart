import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../src/features/account/data/account_datasources/remote_data/model/user_account_model.dart';
import '../../src/features/account/data/balance_datasources/remote_data/model/balance_model.dart';
import '../../src/features/account/data/history_datasources/remote_data/model/history_session_model.dart';
import '../../src/features/account/domain/entities/balance_entity.dart';
import '../../src/features/account/domain/entities/history_session_entity.dart';
import '../../src/features/account/domain/entities/user_account_entity.dart';
import '../../src/features/connect_teacher/data/datasources/schedule_datasource/remote_data/model/session_schedule_model.dart';
import '../../src/features/connect_teacher/domain/entities/session_schedule_entity.dart';
import '../../src/features/topic_detail/data/datasources/topics_datasource/remote_data/model/topic_detail_model.dart';
import '../../src/features/topic_detail/domain/entities/topic_detail_entity.dart';
import '../../src/features/topics/data/datasources/topics_datasource/remote_data/model/topic_model.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) => super
      .createHttpClient(context)
    ..badCertificateCallback = ((X509Certificate cert, String host, int port) {
      final isValidHost =
          ["api.centalki.com"].contains(host); // <-- allow only hosts in array
      return isValidHost;
    });
}

class DioClient {
  static final Dio _dio = Dio();

  static const baseUrl = 'https://api.centalki.com/v1';

  static Future<dynamic> assignRole(String idToken, String? displayName) =>
      _dio.post("$baseUrl/auth/assign-role", data: {
        "idToken": idToken,
        "role": "STUDENT",
        "displayName": displayName
      });

  static Future<dynamic> validateRole(String? idToken) =>
      _dio.post("$baseUrl/auth/validate-role",
          data: {"idToken": idToken, "role": "STUDENT"});

  static Future<TopicsListBaseModel> getTopicList() async {
    final response = await _dio.get(
      "$baseUrl/topic",
    );
    return TopicsListBaseModel.fromJson(response.data);
  }

  static Future<TopicDetailEntity> getTopicDetailById(
      String topicId, String idToken) async {
    final response = await _dio.get("$baseUrl/topic/$topicId",
        options: Options(headers: {'Authorization': idToken}));

    if (response.statusCode != 200) {
      throw Exception(
          'Error ${response.statusCode}\nCannot get detail for topic $topicId');
    }
    if (response.data.toString().isEmpty) {
      throw Exception('ERROR\nTopic does not exist.');
    }

    try {
      return TopicDetailModel.fromJson(response.data['data']);
    } on Exception catch (_) {
      throw Exception('ERROR\nTopic Model Mismatched.');
    }
  }

  static Future<SessionScheduleEntity> createNewSessionSchedule(
      String studentId, String topicId) async {
    try {
      final response = await _dio.post("$baseUrl/session-schedule", data: {
        "studentId": studentId,
        "topicId": topicId,
      });
      return SessionScheduleModel.fromJson(response.data);
    } on DioError catch (dioError) {
      switch (dioError.response?.statusCode) {
        case 402:
          throw Exception('Insufficient balance.\nPlease refill your wallet.');
        case 404:
          throw Exception('Topic does not exist.');
        case 409:
          throw Exception('The student has already been in another session.');
        default:
          throw Exception('Try again later!');
      }
    } on Exception catch (_) {
      throw Exception('Something was wrong. Please try again later!');
    }
  }

  static Future<void> cancelSessionSchedule(String sessionId) async {
    if (sessionId.isEmpty) return;
    await _dio.post("$baseUrl/session-schedule/$sessionId/cancel");
  }

  static Future<SessionScheduleListEntity> getPickedUpSessionListOfStudent(
      String studentId, String status) async {
    try {
      final response =
          await _dio.get("$baseUrl/session-schedule", queryParameters: {
        "studentId": studentId,
        "status": status,
      });
      final data = Map<String, dynamic>.from({"data": response.data});
      return SessionScheduleListModel.fromJson(data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  static Future<UserAccountEntity> getUserInformation(String idToken) async {
    final response = await _dio.get("$baseUrl/auth/profile",
        options: Options(headers: {'Authorization': idToken}));
    return UserAccountModel.fromJson(response.data);
  }

  static Future<bool> updateUserInformation(
      Map<String, dynamic> updateInformation, String idToken) async {
    final response = await _dio.patch("$baseUrl/auth/profile",
        data: updateInformation,
        options: Options(headers: {'Authorization': idToken}));
    return response.statusCode == 200;
  }

  static Future<BalanceEntity> getAccountBalance(String idToken) async {
    final response = await _dio.get("$baseUrl/auth/balance",
        options: Options(headers: {"Authorization": idToken}));
    return BalanceModel.fromJson(response.data);
  }

  static Future<HistorySessionEntity> getCompletedSessions(
      {required String idToken, int page = 1, int size = 10}) async {
    final response = await _dio.get("$baseUrl/auth/sessions",
        queryParameters: {
          "page": page,
          "size": size,
          "status": "COMPLETED",
        },
        options: Options(headers: {"Authorization": idToken}));
    return HistorySessionModel.fromJson(response.data);
  }

  static Future<bool> updateInterestedTopics(
      List<String> topicIds, String idToken) async {
    final response = await _dio.put("$baseUrl/auth/interested-topics",
        data: {"interestedTopicIds": topicIds},
        options: Options(headers: {"Authorization": idToken}));
    return response.statusCode == 200;
  }

  static Future<dynamic> reportTeacher(
      {String? reportedId, List<String>? summary, String? detail}) async {
    final idToken = await FirebaseAuth.instance.currentUser?.getIdToken();
    return await _dio.post("$baseUrl/reporting",
        data: {"reportedId": reportedId, "summary": summary, "detail": detail},
        options: Options(headers: {"Authorization": idToken}));
  }

  static Future<dynamic> blockTeacher({
    required String? blockedId,
  }) async {
    final idToken = await FirebaseAuth.instance.currentUser?.getIdToken();
    return await _dio.post("$baseUrl/blocking",
        data: {
          "blockedId": blockedId,
        },
        options: Options(headers: {"Authorization": idToken}));
  }

  static verifyPurchase(PurchaseDetails purchaseDetails) async {
    try {
      final idToken = await FirebaseAuth.instance.currentUser?.getIdToken();
      final endpoint = Platform.isIOS
          ? "$baseUrl/transaction/apple/verify-purchase"
          : "$baseUrl/transaction/google/verify-purchase";
      final response = await _dio.post(endpoint,
          data: {
            'source': purchaseDetails.verificationData.source,
            'productId': purchaseDetails.productID,
            'verificationData':
                purchaseDetails.verificationData.serverVerificationData,
          },
          options: Options(headers: {"Authorization": idToken}));
      print('statusCode:${response.statusCode}');

      return response.statusCode == 201;
    } catch (e) {
      return false;
    }
  }

  static Future<dynamic> setDeviceToken(String idToken, String token) =>
      _dio.post(
        "$baseUrl/auth/device-token",
        data: {"token": token},
        options: Options(headers: {
          "Authorization": 'Bearer $idToken',
        }),
      );
}
