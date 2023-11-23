import 'package:dio/dio.dart' hide Headers;
import 'package:let_tutor/core/utils/constants.dart';
import 'package:let_tutor/data/models/user/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api_service.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class UserApiService {
  factory UserApiService(Dio dio) = _UserApiService;

  @GET('/user/info')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<UserModel>> getUserInfo({
    @Header('Authorization') required String token,
  });

  @PUT('/user/info')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<UserModel>> updateUserInfo({
    @Header('Authorization') required String token,
    @Body() required Map<String, dynamic> userInfoBody,
  });
}
