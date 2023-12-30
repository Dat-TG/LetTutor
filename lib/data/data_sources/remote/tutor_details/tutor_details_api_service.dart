import 'package:dio/dio.dart' hide Headers;
import 'package:let_tutor/data/models/tutor_details/tutor_details_model.dart';
import 'package:retrofit/retrofit.dart';

part 'tutor_details_api_service.g.dart';

@RestApi()
abstract class TutorDetailsApiService {
  factory TutorDetailsApiService(Dio dio) = _TutorDetailsApiService;

  @GET('/tutor/{tutorId}')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<TutorDetailsModel>> getTutorDetails({
    @Path('tutorId') required String tutorId,
  });

  @POST('/report')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<String>> report({
    @Field("tutorId") required String tutorId,
    @Field("content") required String content,
  });
}
