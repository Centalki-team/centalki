import 'package:alice/alice.dart';
import 'package:dio/dio.dart';

import '../define/network_error_code.dart';
import '../domain/resource.base.dart';
import 'exception/app_exception.dart';
import 'exception/network_exception.dart';
import 'interceptors/authentication_interceptor.dart';
import 'interceptors/default_error_handler_interceptor.dart';
import 'interceptors/default_response_handler_interceptor.dart';

enum HTTPMethod { get, post, put, delete, patch }

extension HTTPMethodX on HTTPMethod {
  String get mapToString {
    switch (this) {
      case HTTPMethod.get:
        return 'GET';
      case HTTPMethod.post:
        return 'POST';
      case HTTPMethod.put:
        return 'PUT';
      case HTTPMethod.delete:
        return 'DELETE';
      case HTTPMethod.patch:
        return 'PATCH';
    }
  }
}

enum ApiType {
  public,
  user,
}

class ApiGateway {
  ApiGateway(
    this.endpoint, {
    required this.apiType,
    this.interceptors,
    int connectTimeout = 10000,
    int receiveTimeout = 30000,
    int sendTimeout = 30000,
    Map<String, dynamic>? headers,
    String? contentType,
    BaseOptions? options,
  }) {
    final _options = options?.copyWith(
          baseUrl: endpoint,
          connectTimeout: connectTimeout,
          receiveTimeout: receiveTimeout,
          headers: headers,
          contentType: contentType,
        ) ??
        BaseOptions(
          baseUrl: endpoint,
          connectTimeout: connectTimeout,
          receiveTimeout: receiveTimeout,
          headers: headers,
          contentType: contentType,
        );
    _dioInstance = Dio(_options);
    _configureInterceptors();
  }

  final String endpoint;
  final ApiType apiType;
  //final TokenLocalDatasource _tokenLocalDatasource;
  final List<Interceptor>? interceptors;
  // final aliceInterceptor = Alice(
  //   showInspectorOnShake: true,
  //   darkTheme: false,
  //   showNotification: true,
  //   //navigatorKey: NavigationBase.navKey,
  // ).getDioInterceptor();

  late Dio _dioInstance;

  Dio get dio => _dioInstance;

  void _configureInterceptors() {
    // if (interceptors != null) {
    //   _dioInstance.interceptors
    //       .addAll([DefaultErrorHandlerInterceptor(), ...interceptors!]);
    // } else {
    //   _dioInstance.interceptors.addAll([
    //     DefaultResponseHandlerInterceptor(),
    //     DefaultErrorHandlerInterceptor()
    //   ]);
    // }

    // if (alice != null) {
    //   _dioInstance.interceptors.add(alice!.getDioInterceptor());
    // }

    switch (apiType) {
      case ApiType.public:
        if (interceptors == null) {
          _dioInstance.interceptors.addAll([
            DefaultResponseHandlerInterceptor(),
            DefaultErrorHandlerInterceptor(),
          ]);
        }
        // _dioInstance.interceptors.addAll([
        //   aliceInterceptor,
        // ]);
        break;
      case ApiType.user:
        // if (interceptors == null) {
        //   _dioInstance.interceptors.addAll([
        //     //DefaultResponseHandlerInterceptor(),
        //     DefaultErrorHandlerInterceptor()
        //   ]);
        // }
        _dioInstance.interceptors.addAll([
          DefaultResponseHandlerInterceptor(),
          DefaultErrorHandlerInterceptor(),
          AuthInterceptor(),
          //aliceInterceptor,
          //RefreshTokenInterceptor(_dioInstance, _tokenLocalDatasource),
        ]);
        break;
    }
  }

  Future<Response> executeFetch({
    required Resource resource,
    required HTTPMethod method,
    dynamic data,
    Map<String, dynamic>? params,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceivedProgress,
    Options? options,
  }) =>
      _dioInstance.fetch(RequestOptions(
        method: method.mapToString,
        baseUrl: endpoint,
        path: resource.path,
        queryParameters: params,
        data: data,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceivedProgress,
      ));

  Future<Response> execute({
    required Resource resource,
    required HTTPMethod method,
    dynamic data,
    Map<String, dynamic>? params,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceivedProgress,
    Options? options,
  }) {
    switch (method) {
      case HTTPMethod.get:
        return _dioInstance
            .get(
              resource.path,
              queryParameters: params,
              onReceiveProgress: onReceivedProgress,
              options: options,
            )
            .catchError((error) => _errorWrapper(error, resource));
      case HTTPMethod.post:
        return _dioInstance
            .post(
              resource.path,
              data: data,
              queryParameters: params,
              onSendProgress: onSendProgress,
              onReceiveProgress: onReceivedProgress,
              options: options,
            )
            .catchError((error) => _errorWrapper(error, resource));
      case HTTPMethod.put:
        return _dioInstance
            .put(
              resource.path,
              data: data,
              queryParameters: params,
              onSendProgress: onSendProgress,
              onReceiveProgress: onReceivedProgress,
              options: options,
            )
            .catchError((error) => _errorWrapper(error, resource));
      case HTTPMethod.delete:
        return _dioInstance
            .delete(
              resource.path,
              queryParameters: params,
              options: options,
              data: data,
            )
            .catchError((error) => _errorWrapper(error, resource));
      case HTTPMethod.patch:
        return _dioInstance
            .patch(
              resource.path,
              data: data,
              queryParameters: params,
              onSendProgress: onSendProgress,
              onReceiveProgress: onReceivedProgress,
              options: options,
            )
            .catchError((error) => _errorWrapper(error, resource));
    }
  }

  Future<Response> _errorWrapper(dynamic error, Resource resource) {
    if (error is DioError) {
      if (error.error is NetworkException) {
        throw error.error;
      } else if (error is AppException) {
        throw error.error;
      } else {
        throw NetworkException(
            errorCode: NetworkErrorCode.dioErrorUndefined,
            error: error,
            message: resource.description,
            url: '$endpoint${resource.path}');
      }
    } else {
      throw NetworkException(
          errorCode: NetworkErrorCode.undefined,
          error: error,
          message: resource.description,
          url: '$endpoint${resource.path}');
    }
  }
}
