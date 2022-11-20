import 'dart:developer' as developer;
import '../gateway/interceptors/interceptors.dart';

mixin LogMixin {
  static LogMixin _logMixin = DefaultLog();

  static void setLog(LogMixin logMixin) {
    _logMixin = logMixin;
  }

  Future<void> log(String message, {String? name});

  Future<void> error({
    dynamic error,
    StackTrace? stackTrace,
    String? name,
    String? message,
  });

  Future<void> route({
    required String routeName,
    dynamic argument,
    String? name,
  });

  List<AppInterceptor> get interceptors;
}

abstract class AppLog {
  static void setLog(LogMixin logMixin) {
    LogMixin.setLog(logMixin);
  }

  static Future<void> log(String message, {String? name}) async {
    LogMixin._logMixin.log(message, name: name).catchError((e, s) {
      LogMixin._logMixin.error(error: e, stackTrace: s, name: 'LogCenter');
      LogMixin._logMixin.log(
        'message: $message,\nname: $name',
        name: 'LogSource',
      );
    });
  }

  static Future<void> error(
      {dynamic error,
      StackTrace? stackTrace,
      String? name,
      String? message}) async {
    LogMixin._logMixin
        .error(
            error: error, stackTrace: stackTrace, name: name, message: message)
        .catchError((e, s) {
      LogMixin._logMixin.error(error: e, stackTrace: s, name: 'LogCenter');
      LogMixin._logMixin.log(
        'error: $error,\nstackTrace: $stackTrace,\nname: $name',
        name: 'LogSource',
      );
    });
  }

  static Future<void> route(
      {required String routeName, dynamic argument, String? name}) async {
    LogMixin._logMixin
        .route(routeName: routeName, argument: argument, name: name)
        .catchError((e, s) {
      LogMixin._logMixin.error(error: e, stackTrace: s, name: 'LogCenter');
      LogMixin._logMixin.log(
        'routeName: $routeName,\nargument: $argument,\nname: $name',
        name: 'LogSource',
      );
    });
  }

  static List<AppInterceptor> get interceptors =>
      LogMixin._logMixin.interceptors;
}

class DefaultLog with LogMixin {
  @override
  Future<void> error(
      {error, StackTrace? stackTrace, String? name, String? message}) async {
    developer.log(
      message ?? '',
      name: name ?? 'LogSource',
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  List<AppInterceptor> get interceptors => [];

  @override
  Future<void> log(String message, {String? name}) async {
    developer.log(message, name: name ?? 'LogSource');
  }

  @override
  Future<void> route(
      {required String routeName, argument, String? name}) async {
    developer.log(
      'routeName: $routeName,\nargument: $argument',
      name: name ?? 'LogSource',
    );
  }
}
