import 'package:dio/dio.dart' hide Headers;
import 'package:let_tutor/core/utils/constants.dart';
import 'package:let_tutor/data/models/tutor_schedule/tutor_schedule_model.dart';
import 'package:retrofit/retrofit.dart';

part 'tutor_schedule_api_service.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class TutorScheduleApiService {
  factory TutorScheduleApiService(Dio dio) = _TutorScheduleApiService;

  @GET('/schedule')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<List<ScheduleOfTutorModel>>> getScheduleOfTutor({
    @Header('Authorization') required String token,
    @Query('tutorId') required String tutorId,
    @Query('page') required int page,
  });
}
