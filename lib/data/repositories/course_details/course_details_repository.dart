import 'dart:io';

import 'package:dio/dio.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/data/data_sources/remote/course_details/course_details_api_service.dart';
import 'package:let_tutor/data/models/course_details/course_details_model.dart';
import 'package:let_tutor/domain/repositories/course_details/course_details_repository.dart';

class CourseDetailsRepositoryImpl implements CourseDetailsRepository {
  final CourseDetailsApiService _courseDetailsApiService;

  CourseDetailsRepositoryImpl(this._courseDetailsApiService);
  @override
  Future<DataState<CourseDetailsModel>> getCourseDetails({
    required String token,
    required String courseId,
  }) async {
    try {
      final httpResponse = await _courseDetailsApiService.getCourseDetails(
        token: 'Bearer $token',
        courseId: courseId,
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
