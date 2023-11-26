import 'dart:io';

import 'package:dio/dio.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/data/data_sources/remote/tutor_schedule/tutor_schedule_api_service.dart';
import 'package:let_tutor/data/models/tutor_schedule/tutor_schedule_model.dart';
import 'package:let_tutor/domain/repositories/tutor_schedule/tutor_schedule_repository.dart';

class TutorScheduleRepositoryImpl implements TutorScheduleRepository {
  final TutorScheduleApiService _tutorScheduleApiService;

  TutorScheduleRepositoryImpl(this._tutorScheduleApiService);
  @override
  Future<DataState<List<ScheduleOfTutorModel>>> getScheduleOfTutor({
    required String token,
    required String tutorId,
    required int page,
  }) async {
    try {
      final httpResponse = await _tutorScheduleApiService.getScheduleOfTutor(
        token: 'Bearer $token',
        tutorId: tutorId,
        page: page,
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

  @override
  Future<DataState<String>> bookingSchedule({
    required String token,
    required BookingScheduleBody body,
  }) async {
    try {
      final httpResponse = await _tutorScheduleApiService.bookingSchedule(
        token: 'Bearer $token',
        body: body,
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
