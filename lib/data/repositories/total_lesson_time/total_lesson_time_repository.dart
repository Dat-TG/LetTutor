import 'dart:io';

import 'package:dio/dio.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/data/data_sources/remote/total_lesson_time/total_lesson_time_api_service.dart';
import 'package:let_tutor/domain/repositories/total_lesson_time/total_lesson_time_repository.dart';

class TotalLessonTimeRepositoryImpl implements TotalLessonTimeRepository {
  final TotalLessonTimeApiService _totalLessonTimeApiService;

  TotalLessonTimeRepositoryImpl(this._totalLessonTimeApiService);
  @override
  Future<DataState<int>> getTotalLessonTime({
    required String token,
  }) async {
    try {
      final httpResponse = await _totalLessonTimeApiService.getTotalLessonTime(
        token: 'Bearer $token',
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
