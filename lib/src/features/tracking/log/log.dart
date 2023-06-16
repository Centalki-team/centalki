import 'dart:developer';

import 'package:flutter/foundation.dart';

class Log {
  static void error(dynamic error, [StackTrace? stack]) {
    log(
      'Error:========================',
      name: 'Analytics',
      error: error,
      stackTrace: stack,
    );
  }

  static void debug(String message) {
    if (kDebugMode) {
      log(message, name: 'Analytics');
    }
  }

  static void mark(dynamic error, [StackTrace? stack]) {
    log(
      'Marker:========================',
      name: 'Analytics',
      error: error,
      stackTrace: stack,
    );
  }
}
