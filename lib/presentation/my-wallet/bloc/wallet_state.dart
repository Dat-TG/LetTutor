part of 'wallet_bloc.dart';

sealed class WalletState extends Equatable {
  final StatisticsEntity? statistics;
  final List<TransactionEntity>? transactions;
  final DioException? errorStatistics;
  final DioException? errorTransactions;
  const WalletState({
    this.statistics,
    this.transactions,
    this.errorStatistics,
    this.errorTransactions,
  });

  @override
  List<Object?> get props => [
        statistics,
        transactions,
        errorStatistics,
        errorTransactions,
      ];
}

final class WalletLoadingStatistics extends WalletState {
  const WalletLoadingStatistics({
    StatisticsEntity? statistics,
    List<TransactionEntity>? transactions,
    DioException? errorStatistics,
    DioException? errorTransactions,
  }) : super(
          statistics: statistics,
          transactions: transactions,
          errorStatistics: errorStatistics,
          errorTransactions: errorTransactions,
        );
}

final class WalletLoadingTransactions extends WalletState {
  const WalletLoadingTransactions({
    StatisticsEntity? statistics,
    List<TransactionEntity>? transactions,
    DioException? errorStatistics,
    DioException? errorTransactions,
  }) : super(
          statistics: statistics,
          transactions: transactions,
          errorStatistics: errorStatistics,
          errorTransactions: errorTransactions,
        );
}

final class WalletLoadedStatistics extends WalletState {
  const WalletLoadedStatistics({
    StatisticsEntity? statistics,
    List<TransactionEntity>? transactions,
    DioException? errorStatistics,
    DioException? errorTransactions,
  }) : super(
          statistics: statistics,
          transactions: transactions,
          errorStatistics: errorStatistics,
          errorTransactions: errorTransactions,
        );
}

final class WalletLoadedTransactions extends WalletState {
  const WalletLoadedTransactions({
    StatisticsEntity? statistics,
    List<TransactionEntity>? transactions,
    DioException? errorStatistics,
    DioException? errorTransactions,
  }) : super(
          statistics: statistics,
          transactions: transactions,
          errorStatistics: errorStatistics,
          errorTransactions: errorTransactions,
        );
}

final class WalletErrorStatistics extends WalletState {
  const WalletErrorStatistics({
    StatisticsEntity? statistics,
    List<TransactionEntity>? transactions,
    DioException? errorStatistics,
    DioException? errorTransactions,
  }) : super(
          statistics: statistics,
          transactions: transactions,
          errorStatistics: errorStatistics,
          errorTransactions: errorTransactions,
        );
}

final class WalletErrorTransactions extends WalletState {
  const WalletErrorTransactions({
    StatisticsEntity? statistics,
    List<TransactionEntity>? transactions,
    DioException? errorStatistics,
    DioException? errorTransactions,
  }) : super(
          statistics: statistics,
          transactions: transactions,
          errorStatistics: errorStatistics,
          errorTransactions: errorTransactions,
        );
}
