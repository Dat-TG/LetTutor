import 'package:dio/dio.dart';
import 'package:let_tutor/core/interceptors/auth_interceptor.dart';
import 'package:let_tutor/core/utils/constants.dart';

class DioClient {
  static Dio getInstance() {
    final Dio dio = Dio(BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));

    dio.interceptors.add(AuthInterceptor(dio));

    return dio;
  }
}
