import 'dart:io';

import 'package:dio/dio.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/data/data_sources/remote/course/course_api_service.dart';
import 'package:let_tutor/data/models/course/course_model.dart';
import 'package:let_tutor/domain/repositories/course/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseApiService _courseApiService;

  CourseRepositoryImpl(this._courseApiService);
  @override
  Future<DataState<List<CourseModel>>> getListCourses({
    required int page,
    required int size,
    List<int>? level,
    String? order,
    String? orderBy,
    List<String>? categoryId,
    String? q,
  }) async {
    try {
      final httpResponse = await _courseApiService.getListCourses(
        page: page,
        size: size,
        level: level,
        order: order,
        orderBy: orderBy,
        categoryId: categoryId,
        q: q,
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
