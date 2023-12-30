import 'dart:io';

import 'package:dio/dio.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/data/data_sources/remote/upcoming_lesson/upcoming_lesson_api_service.dart';
import 'package:let_tutor/data/models/upcoming_lesson/upcoming_lesson_model.dart';
import 'package:let_tutor/domain/repositories/upcoming_lesson/upcoming_lesson_repository.dart';

class UpcomingLessonRepositoryImpl implements UpcomingLessonRepository {
  final UpcomingLessonApiService _upcomingLessonApiService;

  UpcomingLessonRepositoryImpl(this._upcomingLessonApiService);
  @override
  Future<DataState<UpcomingLessonModel?>> getUpcomingLesson() async {
    try {
      final httpResponse = await _upcomingLessonApiService.getUpcomingLesson();
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
