import 'dart:io';

import 'package:dio/dio.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/data/data_sources/remote/tutor_details/tutor_details_api_service.dart';
import 'package:let_tutor/data/models/tutor_details/tutor_details_model.dart';
import 'package:let_tutor/domain/repositories/tutor_details/tutor_details_repository.dart';

class TutorDetailsRepositoryImpl implements TutorDetailsRepository {
  final TutorDetailsApiService _tutorDetailsApiService;

  TutorDetailsRepositoryImpl(this._tutorDetailsApiService);
  @override
  Future<DataState<TutorDetailsModel>> getTutorDetails({
    required String id,
    required String token,
  }) async {
    try {
      final httpResponse = await _tutorDetailsApiService.getTutorDetails(
          token: 'Bearer $token', tutorId: id);
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
