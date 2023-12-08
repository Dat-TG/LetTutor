import 'package:dio/dio.dart' hide Headers;
import 'package:let_tutor/core/utils/constants.dart';
import 'package:let_tutor/data/models/auth/auth_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST('/auth/login')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<AuthModel>> login({
    @Field("email") required String email,
    @Field("password") required String password,
  });

  @POST('/auth/refresh-token')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<AuthModel>> refreshToken({
    @Field("refreshToken") required String refreshToken,
    @Field("timezone") required int timezone,
  });

  @POST('/auth/register')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<AuthModel>> register({
    @Field("email") required String email,
    @Field("password") required String password,
  });

  @POST('/user/forgotPassword')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<String>> forgotPassword(
      {@Field("email") required String email});

  @POST('/auth/change-password')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<String>> changePassword({
    @Header('Authorization') required String token,
    @Field("password") required String password,
    @Field("newPassword") required String newPassword,
  });

  @POST('/auth/google')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<AuthModel>> loginGoogle({
    @Field("access_token") required String accessToken,
  });
}
