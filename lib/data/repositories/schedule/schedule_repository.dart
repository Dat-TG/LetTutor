import 'dart:io';

import 'package:dio/dio.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/data/data_sources/remote/schedule/schedule_api_service.dart';
import 'package:let_tutor/data/models/schedule/schedule_model.dart';
import 'package:let_tutor/domain/repositories/schedule/schedule_repository.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleApiService _scheduleApiService;

  ScheduleRepositoryImpl(this._scheduleApiService);
  @override
  Future<DataState<List<ScheduleModel>>> getSchedules({
    required ScheduleParams params,
  }) async {
    try {
      final httpResponse = await _scheduleApiService.getSchedules(
        page: params.page ?? 1,
        perPage: params.perPage ?? 10,
        inFuture: 1,
        orderBy: 'meeting',
        sortBy: 'asc',
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
  Future<DataState<List<ScheduleModel>>> getHistory({
    required ScheduleParams params,
  }) async {
    try {
      final httpResponse = await _scheduleApiService.getHistory(
        page: params.page ?? 1,
        perPage: params.perPage ?? 10,
        inFuture: 0,
        orderBy: 'meeting',
        sortBy: '0desc',
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
