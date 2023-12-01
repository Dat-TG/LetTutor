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
}
