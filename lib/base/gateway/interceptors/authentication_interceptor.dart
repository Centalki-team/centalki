import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  static const accessToken = 'Authorization';

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Accept'] = 'application/json';
    final session = await FirebaseAuth.instance.currentUser?.getIdToken();
    options.headers[accessToken] = 'Bearer $session';
    options.headers['CustomerToken'] = session;
    super.onRequest(options, handler);
  }
}
