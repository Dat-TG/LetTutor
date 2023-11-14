import 'dart:io';

import 'package:dio/dio.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/data/data_sources/remote/review/review_api_service.dart';
import 'package:let_tutor/data/models/review/review_model.dart';
import 'package:let_tutor/domain/repositories/review/review_repository.dart';

class ReviewRepositoryImpl implements ReviewRepository {
  final ReviewApiService _reviewApiService;

  ReviewRepositoryImpl(this._reviewApiService);
  @override
  Future<DataState<List<ReviewModel>>> getReviews({
    required String token,
    required ReviewParams params,
  }) async {
    try {
      final httpResponse = await _reviewApiService.getReviews(
          token: 'Bearer $token',
          tutorId: params.tutorId ?? '',
          page: params.page,
          perPage: params.perPage);
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
