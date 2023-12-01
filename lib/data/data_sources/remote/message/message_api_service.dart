import 'package:dio/dio.dart' hide Headers;
import 'package:let_tutor/core/utils/constants.dart';
import 'package:let_tutor/data/models/message/message_model.dart';
import 'package:retrofit/retrofit.dart';

part 'message_api_service.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class MessageApiService {
  factory MessageApiService(Dio dio) = _MessageApiService;

  @GET('/message/get-all-recipient')
  Future<HttpResponse<List<MessageModel>>> getReceivers({
    @Header('Authorization') required String token,
  });

  @GET('/message/get/{id}')
  Future<HttpResponse<List<MessageModel>>> getMessagesByUserId({
    @Header('Authorization') required String token,
    @Path('id') required String userId,
    @Query('startTime') required int startTime,
    @Query('page') required int page,
    @Query('perPage') required int perPage,
  });
}
