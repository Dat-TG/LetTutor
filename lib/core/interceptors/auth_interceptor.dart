import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;

  AuthInterceptor(this.dio);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Retrieve token from wherever it's stored (e.g., SharedPreferences)
    final String? token = sl<SharedPreferences>()
        .getString('access-token'); // Implement this function to get the token

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    print(
        'Request: ${options.method} ${options.headers} ${options.path} ${options.queryParameters}');
    print('Request: ${options.data}');

    return handler.next(options);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    print(
        'Response: ${response.statusCode} ${response.headers} ${response.data}');
    return handler.next(response);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    print('Error: ${err.response?.statusCode} ${err.response?.headers}');
    print('Error: $err');
    if (err.response?.statusCode == 401) {
      // Refresh token
      final String? refreshToken = sl<SharedPreferences>().getString(
          'refresh-token'); // Implement this function to get the token

      if (refreshToken != null) {
        log('Refresh token: $refreshToken');
        log('Timezone: ${DateTime.now().timeZoneOffset.inHours}');
        final response = await dio.post(
          '/auth/refresh-token',
          data: {
            'refreshToken': refreshToken,
            'timezone': DateTime.now().timeZoneOffset.inHours,
          },
        );
        if (response.statusCode == 200) {
          // Save new tokens
          final data = response.data;
          sl<SharedPreferences>().setString(
              'access-token', response.data['tokens']['access']['token']);
          sl<SharedPreferences>()
              .setString('refresh-token', data['tokens']['refresh']['token']);

          // Retry
          RequestOptions options = err.requestOptions;
          final retryResponse = await dio.request(err.requestOptions.path,
              options: Options(
                method: options.method,
                headers: options.headers,
                extra: options.extra,
                contentType: options.contentType,
                responseType: options.responseType,
                validateStatus: options.validateStatus,
                receiveTimeout: options.receiveTimeout,
                sendTimeout: options.sendTimeout,
                followRedirects: options.followRedirects,
                maxRedirects: options.maxRedirects,
                requestEncoder: options.requestEncoder,
                responseDecoder: options.responseDecoder,
                listFormat: options.listFormat,
              ));
          return handler.resolve(retryResponse);
        }
      }
    }

    return handler.next(err);
  }
}
