import 'dart:io';

import 'package:dio/dio.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/data/data_sources/remote/message/message_api_service.dart';
import 'package:let_tutor/data/models/message/message_model.dart';
import 'package:let_tutor/domain/repositories/message/message_repository.dart';

class MessageRepositoryImpl implements MessageRepository {
  final MessageApiService _messageApiService;

  MessageRepositoryImpl(this._messageApiService);
  @override
  Future<DataState<List<MessageModel>>> getReceivers() async {
    try {
      final httpResponse = await _messageApiService.getReceivers();
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

  @override
  Future<DataState<List<MessageModel>>> getMessagesByUserId({
    required String userId,
    required int startTime,
    required int page,
    required int perPage,
  }) async {
    try {
      final httpResponse = await _messageApiService.getMessagesByUserId(
        userId: userId,
        startTime: startTime,
        page: page,
        perPage: perPage,
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
