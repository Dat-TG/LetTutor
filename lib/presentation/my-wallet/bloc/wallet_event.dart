part of 'wallet_bloc.dart';

sealed class WalletEvent extends Equatable {
  const WalletEvent();

  @override
  List<Object> get props => [];
}

final class GetStatisticsEvent extends WalletEvent {
  const GetStatisticsEvent();
}

final class GetTransactionsEvent extends WalletEvent {
  const GetTransactionsEvent();
}
