import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../base/temp_dio/dio_client.dart';
import '../src/features/notifications/presentation/views/noti_list_page.dart';

Future<void> setUpFCM(context) async {
  var messaging = FirebaseMessaging.instance;

  var settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    var token = await messaging.getToken();
    if (token != null) {
      final idToken = await FirebaseAuth.instance.currentUser?.getIdToken();
      if (idToken != null) {
        await DioClient.setDeviceToken(idToken, token);
      }
    }
  }

  // android
  const channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.max,
  );
  const initializationSettingsAndroid =
      AndroidInitializationSettings('@drawable/ic_centalki');
  const initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  //iOS
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (_) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NotiListPage(),
      ),
    ),
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  FirebaseMessaging.onMessage.listen((message) {
    var notification = message.notification;
    var android = message.notification?.android;

    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            channelShowBadge: true,
            largeIcon: const DrawableResourceAndroidBitmap('ic_launcher'),
            styleInformation: BigTextStyleInformation(
              notification.body ?? '',
            ),
          ),
        ),
      );
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NotiListPage(),
      ),
    );
  });
}
