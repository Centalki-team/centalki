import 'package:dio/dio.dart';

class DefaultResponseHandlerInterceptor extends QueuedInterceptor {
  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    handler.next(response);
  }
}
