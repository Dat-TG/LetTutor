import 'package:dio/dio.dart' hide Headers;
import 'package:let_tutor/core/utils/constants.dart';
import 'package:let_tutor/data/models/schedule/schedule_model.dart';
import 'package:retrofit/retrofit.dart';

part 'schedule_api_service.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ScheduleApiService {
  factory ScheduleApiService(Dio dio) = _ScheduleApiService;

  @GET('/booking/list/student')
  Future<HttpResponse<List<ScheduleModel>>> getSchedules({
    @Header('Authorization') required String token,
    @Query('page') required int page,
    @Query('perPage') required int perPage,
    @Query('inFuture') required int inFuture,
    @Query('orderBy') required String orderBy,
    @Query('sortBy') required String sortBy,
  });

  @GET('/booking/list/student')
  Future<HttpResponse<List<ScheduleModel>>> getHistory({
    @Header('Authorization') required String token,
    @Query('page') required int page,
    @Query('perPage') required int perPage,
    @Query('inFuture') required int inFuture,
    @Query('orderBy') required String orderBy,
    @Query('sortBy') required String sortBy,
  });
}
