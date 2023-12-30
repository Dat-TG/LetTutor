import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/wallet/statistics_entity.dart';
import 'package:let_tutor/domain/entities/wallet/transaction_entity.dart';

abstract class WalletRepository {
  Future<DataState<StatisticsEntity>> getStatistics();
  Future<DataState<List<TransactionEntity>>> getTransactions();
}
