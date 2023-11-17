import 'package:dio/dio.dart' hide Headers;
import 'package:let_tutor/core/utils/constants.dart';
import 'package:retrofit/retrofit.dart';

part 'total_lesson_time_api_service.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class TotalLessonTimeApiService {
  factory TotalLessonTimeApiService(Dio dio) = _TotalLessonTimeApiService;

  @GET('/call/total')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<int>> getTotalLessonTime({
    @Header('Authorization') required String token,
  });
}
