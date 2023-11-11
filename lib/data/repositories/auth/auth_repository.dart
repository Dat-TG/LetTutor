import 'dart:io';

import 'package:dio/dio.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/data/data_sources/remote/auth/auth_api_service.dart';
import 'package:let_tutor/data/models/auth/auth_model.dart';
import 'package:let_tutor/domain/repositories/auth/auth_repository.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _authApiService;

  AuthRepositoryImpl(this._authApiService);
  @override
  Future<DataState<AuthModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final httpResponse =
          await _authApiService.login(email: email, password: password);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        sl<SharedPreferences>().setString(
            'access-token', httpResponse.data.tokens!.access!.token ?? "");
        sl<SharedPreferences>().setString(
            'refresh-token', httpResponse.data.tokens!.refresh!.token ?? "");
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
              error: httpResponse.response.statusMessage,
              response: httpResponse.response,
              type: DioExceptionType.badResponse,
              requestOptions: httpResponse.response.requestOptions),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<AuthModel>> refreshToken({
    required String refreshToken,
    required int timezone,
  }) async {
    try {
      final httpResponse = await _authApiService.refreshToken(
          refreshToken: refreshToken, timezone: timezone);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        sl<SharedPreferences>().setString(
            'access-token', httpResponse.data.tokens!.access!.token ?? "");
        sl<SharedPreferences>().setString(
            'refresh-token', httpResponse.data.tokens!.refresh!.token ?? "");
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
              error: httpResponse.response.statusMessage,
              response: httpResponse.response,
              type: DioExceptionType.badResponse,
              requestOptions: httpResponse.response.requestOptions),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
