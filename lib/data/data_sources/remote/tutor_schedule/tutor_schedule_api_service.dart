import 'package:dio/dio.dart' hide Headers;
import 'package:let_tutor/data/models/tutor_schedule/tutor_schedule_model.dart';
import 'package:let_tutor/domain/repositories/tutor_schedule/tutor_schedule_repository.dart';
import 'package:retrofit/retrofit.dart';

part 'tutor_schedule_api_service.g.dart';

@RestApi()
abstract class TutorScheduleApiService {
  factory TutorScheduleApiService(Dio dio) = _TutorScheduleApiService;

  @GET('/schedule')
  Future<HttpResponse<List<ScheduleOfTutorModel>>> getScheduleOfTutor({
    @Query('tutorId') required String tutorId,
    @Query('page') required int page,
  });

  @POST('/booking')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<String>> bookingSchedule({
    @Body() required BookingScheduleBody body,
  });
}
