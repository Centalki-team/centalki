import 'package:sample_exception/sample_exception.dart';

class AuthenticationException extends SampleException {
  AuthenticationException({
    String errorCode = SampleErrorCode.unauthorized,
    String? message = 'Thông tin đăng nhập xảy ra lỗi',
    String? debugMessage,
    dynamic error,
    StackTrace? stackTrace,
  }) : super(errorCode,
            message: message,
            debugMessage: debugMessage,
            error: error,
            stackTrace: stackTrace,
            time: DateTime.now());
}

class TokenNotFound extends AuthenticationException {
  TokenNotFound({
    dynamic error,
    String? debugMessage,
    StackTrace? stackTrace,
  }) : super(
          errorCode: 'token-not-found',
          message: 'Thông tin đăng nhập không tìm thấy hoặc không hợp lệ',
          debugMessage: debugMessage ?? 'Token not found or empty',
          stackTrace: stackTrace,
          error: error,
        );
}

class TokenExpired extends AuthenticationException {
  TokenExpired({
    dynamic error,
    String? debugMessage,
    StackTrace? stackTrace,
  }) : super(
          errorCode: 'token-expired',
          message: 'Phiên làm việc hết hạn',
          debugMessage: debugMessage ?? 'Token Expired',
          stackTrace: stackTrace,
          error: error,
        );
}

class RefreshTokenFailed extends TokenExpired {
  RefreshTokenFailed({
    dynamic error,
    String? debugMessage,
    StackTrace? stackTrace,
  }) : super(
          debugMessage: debugMessage ?? 'Refresh Token Expired',
          stackTrace: stackTrace,
          error: error,
        );
}

class DeniedToken extends SampleException {
  DeniedToken({
    String errorCode = 'denied-token',
    String? message = 'Đăng nhập không được chấp nhận',
    String? debugMessage,
    dynamic error,
    StackTrace? stackTrace,
  }) : super(errorCode,
            message: message,
            debugMessage: debugMessage,
            error: error,
            stackTrace: stackTrace,
            time: DateTime.now());
}
