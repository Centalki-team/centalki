import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  static const accessToken = 'Authorization';

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Accept'] = 'application/json';
    final session = await FirebaseAuth.instance.currentUser?.getIdTokenResult();
    final userId = FirebaseAuth.instance.currentUser?.uid;
    log(session?.token ?? 'no token found');
    log(userId ?? 'null uid');
    options.headers[accessToken] = 'Bearer ${session?.token ?? ''}';
    //options.headers['CustomerToken'] = session;
    super.onRequest(options, handler);
  }
}
