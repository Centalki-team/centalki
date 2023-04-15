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
    log(session?.token ?? 'no token found');
    options.headers[accessToken] = 'Bearer ${session?.token ?? ''}';
    //options.headers['CustomerToken'] = session;
    super.onRequest(options, handler);
  }
}
