import 'package:dio/dio.dart' hide Headers;
import 'package:let_tutor/core/utils/constants.dart';
import 'package:let_tutor/data/models/review/review_model.dart';
import 'package:retrofit/retrofit.dart';

part 'review_api_service.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ReviewApiService {
  factory ReviewApiService(Dio dio) = _ReviewApiService;

  @GET('/feedback/v2/{tutorId}')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<List<ReviewModel>>> getReviews({
    @Header('Authorization') required String token,
    @Path('tutorId') required String tutorId,
    @Query('page') int? page,
    @Query('perPage') int? perPage,
  });
}
