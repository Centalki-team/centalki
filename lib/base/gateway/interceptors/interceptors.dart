import 'package:dio/dio.dart';

import '../exception/app_exception.dart';

typedef CreateInterceptors = List<Interceptor> Function();

typedef OnCall<I, O> = O Function(I input);

class EmptyInput {
  const EmptyInput();
}

abstract class AppInterceptor<O> {
  static EmptyInput emptyInput = const EmptyInput();

  final Map<Type, Function> _call = {};

  void onEmptyInput(O Function() callback) {
    on<EmptyInput>((input) => callback());
  }

  void on<I>(OnCall<I, O> callback) {
    if (_call.containsKey(I)) {
      throw AppException(
        errorCode: 'duplicate',
        message: 'Duplicate Function with ${I.toString()}',
      );
    }
    _call[I] = callback;
  }

  Future<O> call<I>(I input) {
    if (!_call.containsKey(I)) {
      throw AppException(
        errorCode: 'not_found',
        message: 'Not fount Function with ${I.toString()}',
      );
    }
    return _call[I]!.call(input);
  }
}
