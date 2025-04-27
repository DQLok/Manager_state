import 'package:dio/dio.dart';
import 'package:manager_state/core/config/call_api/dio_interceptor.dart';

class DioClient {
  static BaseOptions options = BaseOptions(
    baseUrl: 'http://',
    connectTimeout: Duration(milliseconds: 5000),
    receiveTimeout: Duration(milliseconds: 5000),
  );
  final Dio _dio = Dio(options);
  DioClient() {
    _dio.interceptors.addAll([
      AuthInterceptor(),
      DioInterceptor(),
      ErrorInterceptor(),
    ]);
  }

  Dio get getDio => _dio;
}
