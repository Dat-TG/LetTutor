import 'dart:io';

import 'package:dio/dio.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/data/data_sources/remote/ebook/ebook_api_service.dart';
import 'package:let_tutor/data/models/ebook/ebook_model.dart';
import 'package:let_tutor/domain/repositories/ebook/ebook_repository.dart';

class EbookRepositoryImpl implements EbookRepository {
  final EbookApiService _ebookApiService;

  EbookRepositoryImpl(this._ebookApiService);
  @override
  Future<DataState<List<EbookModel>>> getListEbooks({
    required int page,
    required int size,
    List<int>? level,
    String? order,
    String? orderBy,
    List<String>? categoryId,
    String? q,
  }) async {
    try {
      final httpResponse = await _ebookApiService.getListEbooks(
        page: page,
        size: size,
        level: level,
        order: order,
        orderBy: orderBy,
        categoryId: categoryId,
        q: q,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
              error: httpResponse.response.statusMessage,
              response: httpResponse.response,
              type: DioExceptionType.badResponse,
              requestOptions: httpResponse.response.requestOptions),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
