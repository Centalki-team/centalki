import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sample_exception/sample_exception.dart';

import '../exception/authentication_exception.dart';

class AuthenticationInterceptor extends QueuedInterceptor {
  AuthenticationInterceptor._({this.refreshed = false});

  AuthenticationInterceptor() : refreshed = false;

  factory AuthenticationInterceptor.refreshed() =>
      AuthenticationInterceptor._(refreshed: true);

  final bool refreshed;
  // final _repo = JwtService.inst.repo;
  // final _userManager = JwtService.inst.userManager;

  static final Dio _dioInstance = Dio()
    ..interceptors.add(AuthenticationInterceptor.refreshed());

  void log(dynamic error) {
    if (kDebugMode) {
      print(error);
    }
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // final token = await _repo.getToken;
    // if (token?.valid == true) {
    //   if (kDebugMode) {
    //     print('API ${options.method} => ${options.baseUrl}${options.path}');
    //     if (!_userManager.onForeground) {
    //       print(
    //           'App is on background, UserManager be not detected any change. Maybe authentication work not true!!!');
    //     }
    //   }
    //   options.headers['Authorization'] = 'Bearer ${token?.token}';
    //   handler.next(options);
    // } else {
    //   _userManager.expired();
    //   log(TokenNotFound(stackTrace: StackTrace.current));
    //   // handler.reject(DioError(
    //   //     requestOptions: options,
    //   //     type: DioErrorType.cancel,
    //   //     error: TokenNotFound(stackTrace: StackTrace.current)));
    // }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    // if (_userManager.isLogin) {
    //   if (authenticationError(err)) {
    //     if (refreshed) {
    //       _userManager.expired();
    //       log(DeniedToken(error: err));
    //       // handler.next(convert(err, DeniedToken(error: err)));
    //     } else if (await _repo.hasRefreshToken) {
    //       final result = await refreshToken();
    //       if (result) {
    //         final response = await reconnect(err);
    //         if (response.data is DioError) {
    //           _userManager.expired();
    //           log(response.data);
    //           // handler.next(response.data);
    //         } else {
    //           handler.resolve(response);
    //         }
    //       } else {
    //         _userManager.expired();
    //         log(RefreshTokenFailed(error: err));
    //         // handler.next(convert(err, RefreshTokenFailed(error: err)));
    //       }
    //     } else {
    //       _userManager.expired();
    //       log(TokenExpired(error: err));
    //       // handler.next(convert(err, TokenExpired(error: err)));
    //     }
    //   } else {
    //     handler.next(err);
    //   }
    // } else {
    //   _userManager.expired();
    // }
  }

  Future<bool> refreshToken() async {
    // final useCase = RefreshTokenUseCase();
    // final response = await useCase.execute();
    // final validate = LoginSuccess(response);
    // return validate.valid();
    return true;
  }

  Future<Response<dynamic>> reconnect(DioError err) async {
    // final headers = err.requestOptions.headers;
    // final token = await _repo.getToken;
    // headers['Authorization'] = 'Bearer ${token?.token}';
    // final RequestOptions _options =
    //     err.requestOptions.copyWith(headers: headers);
    // if (token?.valid == true) {
    //   return _dioInstance
    //       .fetch(_options)
    //       .catchError((e, s) => Response(requestOptions: _options, data: e));
    // } else {
    //   _userManager.expired();
    //   log(TokenNotFound(stackTrace: StackTrace.current));
    //   return Response(
    //       requestOptions: _options,
    //       data: TokenNotFound(stackTrace: StackTrace.current));
    // }
    return Response(requestOptions: RequestOptions(path: '/'));
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 401) {
      handler.reject(DioError(
        requestOptions: response.requestOptions,
        type: DioErrorType.response,
        error: AuthenticationException(
            debugMessage: 'Bị chặn bởi AuthenticationInterceptor'),
        response: response,
      ));
    } else {
      handler.next(response);
    }
  }

  static bool authenticationError(DioError err) {
    if (err.response?.statusCode == 401) return true;
    if (err.error is SampleException) {
      final error = err.error as SampleException;
      return error.containsError<AuthenticationException>() ||
          error.containsError(SampleErrorCode.unauthorized);
    }
    return false;
  }

  static bool deniedToken(SampleException exception) {
    if (exception.containsError<DeniedToken>() ||
        exception.containsError<AuthenticationException>() ||
        exception.containsError(SampleErrorCode.unauthorized)) {
      //JwtService.inst.userManager.expired();
      return true;
    }
    return false;
  }

  DioError convert(DioError error, SampleException exception) => DioError(
        requestOptions: error.requestOptions,
        type: error.type,
        response: error.response,
        error: exception,
      );
}
