import 'package:dio/dio.dart' hide Headers;
import 'package:let_tutor/data/models/wallet/statistics_model.dart';
import 'package:let_tutor/data/models/wallet/transaction_model.dart';
import 'package:retrofit/retrofit.dart';

part 'wallet_api_service.g.dart';

@RestApi()
abstract class WalletApiService {
  factory WalletApiService(Dio dio) = _WalletApiService;

  @GET('/payment/statistics')
  Future<HttpResponse<StatisticsModel>> getStatistics();

  @GET('/payment/history')
  Future<HttpResponse<List<TransactionModel>>> getTransactions();
}
