import 'dart:io';

import 'package:dio/dio.dart';

import '../../../generated/l10n.dart';
import '../../define/network_error_code.dart';
import '../exception/network_exception.dart';

class DefaultErrorHandlerInterceptor extends QueuedInterceptor {
  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    if (err.error is SocketException) {
      return handler.next(DioError(
        requestOptions: err.requestOptions,
        error: NetworkException(
            errorCode: NetworkErrorCode.noHost,
            error: err,
            displayMessage: S.current.txtNoConnectionOrServerDown,
            message: (err.error as SocketException).message,
            url: err.requestOptions.path),
        response: err.response,
        type: err.type,
      ));
    }
    if (err.response?.statusCode != null) {
      return handler.next(DioError(
        requestOptions: err.requestOptions,
        error: NetworkException(
            errorCode: err.response!.statusCode!.toString(),
            error: err,
            url: err.requestOptions.uri.path),
        response: err.response,
        type: err.type,
      ));
    }
    if ([
      DioErrorType.connectTimeout,
      DioErrorType.sendTimeout,
      DioErrorType.sendTimeout
    ].contains(err.type)) {
      handler.next(DioError(
        requestOptions: err.requestOptions,
        error: NetworkException(
          errorCode: NetworkErrorCode.timeout,
          error: err,
        ),
        response: err.response,
        type: err.type,
      ));
    }
    handler.next(err);
  }
}
