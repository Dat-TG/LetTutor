import 'package:dio/dio.dart' hide Headers;
import 'package:let_tutor/data/models/ebook/ebook_model.dart';
import 'package:retrofit/retrofit.dart';

part 'ebook_api_service.g.dart';

@RestApi()
abstract class EbookApiService {
  factory EbookApiService(Dio dio) = _EbookApiService;

  @GET('/e-book')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<List<EbookModel>>> getListEbooks({
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('level') List<int>? level,
    @Query('order') String? order,
    @Query('orderBy') String? orderBy,
    @Query('categoryId') List<String>? categoryId,
    @Query('q') String? q,
  });
}
