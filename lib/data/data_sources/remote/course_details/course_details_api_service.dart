import 'package:dio/dio.dart' hide Headers;
import 'package:let_tutor/data/models/course_details/course_details_model.dart';
import 'package:retrofit/retrofit.dart';

part 'course_details_api_service.g.dart';

@RestApi()
abstract class CourseDetailsApiService {
  factory CourseDetailsApiService(Dio dio) = _CourseDetailsApiService;

  @GET('/course/{id}')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<CourseDetailsModel>> getCourseDetails({
    @Path('id') required String courseId,
  });
}
