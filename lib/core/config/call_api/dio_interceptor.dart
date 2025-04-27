import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:manager_state/core/config/routes/routes.dart';
import 'package:manager_state/main.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('➡️ Request: [${options.method}] ${options.uri}');
    print('Headers: ${options.headers}');
    print('Data: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('✅ Response [${response.statusCode}] ${response.requestOptions.uri}');
    print('Data: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('❌ Error [${err.response?.statusCode}] ${err.requestOptions.uri}');
    print('Message: ${err.message}');
    super.onError(err, handler);
  }
}

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await getToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }

  Future<String?> getToken() async {
    return 'your_fake_token';
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    final ctx = navigatorKey.currentContext;
    if (ctx == null) return handler.next(error);

    if (error.type == DioExceptionType.connectionTimeout) {
      ScaffoldMessenger.of(
        ctx,
      ).showSnackBar(const SnackBar(content: Text('Timeout Error')));
      Navigator.pushNamedAndRemoveUntil(
        ctx,
        RoutePaths.splashRoute,
        (route) => false,
      );
      return;
    }

    final statusCode = error.response?.statusCode;

    if (statusCode == 401 || statusCode == 500) {
      Navigator.pushNamedAndRemoveUntil(
        ctx,
        RoutePaths.splashRoute,
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(
        ctx,
      ).showSnackBar(SnackBar(content: Text('Error: ${error.message}')));
    }

    return handler.next(error);
  }
}
