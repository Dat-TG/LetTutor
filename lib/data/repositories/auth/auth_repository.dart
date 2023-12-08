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
  Future<DataState<AuthModel>> loginGoogle({
    required String accessToken,
  }) async {
    try {
      final httpResponse =
          await _authApiService.loginGoogle(accessToken: accessToken);
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

  @override
  Future<DataState<AuthModel>> register({
    required String email,
    required String password,
  }) async {
    try {
      final httpResponse =
          await _authApiService.register(email: email, password: password);
      if (httpResponse.response.statusCode == HttpStatus.created) {
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
  Future<DataState<String>> forgotPassword({
    required String email,
  }) async {
    try {
      final httpResponse = await _authApiService.forgotPassword(email: email);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
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
  Future<DataState<String>> changePassword({
    required String token,
    required String password,
    required String newPassword,
  }) async {
    try {
      final httpResponse = await _authApiService.changePassword(
        token: 'Bearer $token',
        password: password,
        newPassword: newPassword,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
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
