import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:let_tutor/data/models/user/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api_service.g.dart';

@RestApi()
abstract class UserApiService {
  factory UserApiService(Dio dio) = _UserApiService;

  @GET('/user/info')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<UserModel>> getUserInfo();

  @PUT('/user/info')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<UserModel>> updateUserInfo({
    @Body() required Map<String, dynamic> userInfoBody,
  });

  @POST('/user/uploadAvatar')
  @MultiPart()
  Future<HttpResponse<UserModel>> uploadAvatar({
    @Part() required File avatar,
  });
}
