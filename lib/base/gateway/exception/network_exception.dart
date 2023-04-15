import 'package:dio/dio.dart';

import '../../define/network_error_code.dart';
import 'app_exception.dart';

class NetworkException extends AppException<DioError> {
  NetworkException(
      {String errorCode = 'network',
      DioError? error,
      StackTrace? stackTrace,
      String message = 'Error in network',
      String displayMessage = 'Xảy ra lỗi khi gọi API',
      String displayTitle = 'Lỗi kết nối',
      String? url})
      : super(
          errorCode: errorCode,
          error: error,
          trace: stackTrace,
          time: DateTime.now(),
          message: '$url: $message',
          displayTitle: displayTitle,
          displayMessage: '$displayMessage [$errorCode]',
        );

  static NetworkException tokenNotFound(
          {DioError? error, StackTrace? stackTrace, String? url}) =>
      NetworkException(
          errorCode: NetworkErrorCode.unauthenticated,
          error: error,
          stackTrace: stackTrace,
          url: url,
          displayTitle: 'Unauthenticated',
          displayMessage: 'Đăng nhập hết hạn hoặc không tìm thấy ');
}
