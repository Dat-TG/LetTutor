import 'package:dio/dio.dart' hide Headers;
import 'package:let_tutor/core/utils/constants.dart';
import 'package:let_tutor/data/models/upcoming_lesson/upcoming_lesson_model.dart';
import 'package:retrofit/retrofit.dart';

part 'upcoming_lesson_api_service.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class UpcomingLessonApiService {
  factory UpcomingLessonApiService(Dio dio) = _UpcomingLessonApiService;

  @GET('/booking/next')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<UpcomingLessonModel?>> getUpcomingLesson({
    @Header('Authorization') required String token,
  });
}
