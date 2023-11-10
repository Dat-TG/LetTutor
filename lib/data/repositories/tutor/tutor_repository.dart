import 'dart:io';

import 'package:dio/dio.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/data/data_sources/remote/tutor/tutor_api_service.dart';
import 'package:let_tutor/data/models/tutor/tutor_model.dart';
import 'package:let_tutor/domain/repositories/tutor/tutor_repositoy.dart';

class TutorRepositoryImpl implements TutorRepository {
  final TutorApiService _tutorApiService;

  TutorRepositoryImpl(this._tutorApiService);
  @override
  Future<DataState<List<TutorModel>>> getTutors({
    required String token,
    required TutorSearchParams params,
  }) async {
    try {
      final httpResponse = await _tutorApiService.searchTutors(
          token: 'Bearer $token', params: params);
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
