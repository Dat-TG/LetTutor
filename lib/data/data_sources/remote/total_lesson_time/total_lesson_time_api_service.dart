import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'total_lesson_time_api_service.g.dart';

@RestApi()
abstract class TotalLessonTimeApiService {
  factory TotalLessonTimeApiService(Dio dio) = _TotalLessonTimeApiService;

  @GET('/call/total')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<int>> getTotalLessonTime();
}
