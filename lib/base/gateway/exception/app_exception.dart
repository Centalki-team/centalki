import '../../helpers/app_log.dart';

class AppException<T> implements Exception {
  const AppException({
    this.trace,
    this.displayMessage = 'Đã xảy ra lỗi',
    this.name = 'AppException',
    this.error,
    this.message = '',
    this.displayTitle = 'Lỗi!!!',
    this.errorCode = 'error',
    this.time,
  });

  final String displayMessage;
  final String displayTitle;
  final String message;
  final T? error;
  final StackTrace? trace;
  final String errorCode;
  final String name;
  final DateTime? time;

  Future<void> log() async {
    AppLog.error(
      error: error,
      stackTrace: trace,
      message: message,
      name: '$displayTitle: $displayMessage',
    );
  }

  @override
  String toString() => """========================================
  $displayTitle: $displayMessage
  Info: $time $errorCode: $message
  Error: $error
  Trace: $trace""";

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    return other is AppException && errorCode == errorCode;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => errorCode.hashCode;
}
