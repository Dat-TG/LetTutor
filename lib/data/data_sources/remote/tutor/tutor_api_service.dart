import 'package:dio/dio.dart' hide Headers;
import 'package:let_tutor/core/utils/constants.dart';
import 'package:let_tutor/data/models/tutor/tutor_model.dart';
import 'package:let_tutor/domain/repositories/tutor/tutor_repositoy.dart';
import 'package:retrofit/retrofit.dart';

part 'tutor_api_service.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class TutorApiService {
  factory TutorApiService(Dio dio) = _TutorApiService;

  @POST('/tutor/search')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<List<TutorModel>>> searchTutors({
    @Header('Authorization') required String token,
    @Body() required TutorSearchParams params,
  });
}
