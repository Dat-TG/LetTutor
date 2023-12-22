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

    return handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Refresh token
      final String? refreshToken = sl<SharedPreferences>().getString(
          'refresh-token'); // Implement this function to get the token

      if (refreshToken != null) {
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
