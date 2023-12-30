import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/wallet/statistics_entity.dart';
import 'package:let_tutor/domain/entities/wallet/transaction_entity.dart';
import 'package:let_tutor/domain/usecases/wallet/get_statistics.dart';
import 'package:let_tutor/domain/usecases/wallet/get_transactions.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final GetStatisticsUsecase _getStatisticsUsecase;
  final GetTransactionsUsecase _getTransactionsUsecase;
  WalletBloc(this._getStatisticsUsecase, this._getTransactionsUsecase)
      : super(const WalletLoadingStatistics()) {
    on<GetStatisticsEvent>(onLoadStatistics);
    on<GetTransactionsEvent>(onLoadTransactions);
  }

  void onLoadStatistics(
      GetStatisticsEvent event, Emitter<WalletState> emit) async {
    emit(WalletLoadingStatistics(
      statistics: state.statistics,
      transactions: state.transactions,
      errorStatistics: state.errorStatistics,
      errorTransactions: state.errorTransactions,
    ));

    final dataState = await _getStatisticsUsecase();

    if (dataState is DataSuccess) {
      emit(WalletLoadedStatistics(
        statistics: dataState.data,
        transactions: state.transactions,
        errorStatistics: state.errorStatistics,
        errorTransactions: state.errorTransactions,
      ));
    } else if (dataState is DataFailed) {
      emit(WalletErrorStatistics(
        statistics: state.statistics,
        transactions: state.transactions,
        errorStatistics: dataState.error,
        errorTransactions: state.errorTransactions,
      ));
    }
  }

  void onLoadTransactions(
      GetTransactionsEvent event, Emitter<WalletState> emit) async {
    emit(WalletLoadingTransactions(
      statistics: state.statistics,
      transactions: state.transactions,
      errorStatistics: state.errorStatistics,
      errorTransactions: state.errorTransactions,
    ));

    final dataState = await _getTransactionsUsecase();

    if (dataState is DataSuccess) {
      emit(WalletLoadedTransactions(
        statistics: state.statistics,
        transactions: dataState.data,
        errorStatistics: state.errorStatistics,
        errorTransactions: state.errorTransactions,
      ));
    } else if (dataState is DataFailed) {
      emit(WalletErrorTransactions(
        statistics: state.statistics,
        transactions: state.transactions,
        errorStatistics: state.errorStatistics,
        errorTransactions: dataState.error,
      ));
    }
  }
}
