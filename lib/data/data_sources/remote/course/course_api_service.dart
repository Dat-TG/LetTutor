import 'package:dio/dio.dart' hide Headers;
import 'package:let_tutor/data/models/course/course_model.dart';
import 'package:retrofit/retrofit.dart';

part 'course_api_service.g.dart';

@RestApi()
abstract class CourseApiService {
  factory CourseApiService(Dio dio) = _CourseApiService;

  @GET('/course')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<List<CourseModel>>> getListCourses({
    @Query('page') required int page,
    @Query('size') required int size,
  });
}
