import 'dart:io';

import 'package:dio/dio.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/data/data_sources/remote/wallet/wallet_api_service.dart';
import 'package:let_tutor/data/models/wallet/statistics_model.dart';
import 'package:let_tutor/data/models/wallet/transaction_model.dart';
import 'package:let_tutor/domain/repositories/wallet/wallet_repository.dart';

class WalletRepositoryImpl implements WalletRepository {
  final WalletApiService _walletApiService;

  WalletRepositoryImpl(this._walletApiService);
  @override
  Future<DataState<StatisticsModel>> getStatistics() async {
    try {
      final httpResponse = await _walletApiService.getStatistics();
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
  Future<DataState<List<TransactionModel>>> getTransactions() async {
    try {
      final httpResponse = await _walletApiService.getTransactions();
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
