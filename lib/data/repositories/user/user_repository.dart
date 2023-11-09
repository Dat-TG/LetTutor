import 'dart:io';

import 'package:dio/dio.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/data/data_sources/remote/user/user_api_service.dart';
import 'package:let_tutor/data/models/user/user_model.dart';
import 'package:let_tutor/domain/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiService _userApiService;

  UserRepositoryImpl(this._userApiService);
  @override
  Future<DataState<UserModel>> getUser() async {
    try {
      final httpResponse = await _userApiService.getUserInfo(
          token:
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmNTY5YzIwMi03YmJmLTQ2MjAtYWY3Ny1lY2MxNDE5YTZiMjgiLCJpYXQiOjE2OTk0NTQ3MzcsImV4cCI6MTY5OTU0MTEzNywidHlwZSI6ImFjY2VzcyJ9.feE8NCPxqntJqD9-ZZfmbuiDx8QWvz7uR-slGBgraeE');
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
