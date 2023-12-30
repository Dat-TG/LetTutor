import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/wallet/transaction_entity.dart';
import 'package:let_tutor/domain/repositories/wallet/wallet_repository.dart';

class GetTransactionsUsecase
    implements UseCase<DataState<List<TransactionEntity>>, String> {
  final WalletRepository _walletRepository;
  GetTransactionsUsecase(this._walletRepository);

  @override
  Future<DataState<List<TransactionEntity>>> call({String? params}) {
    return _walletRepository.getTransactions();
  }
}
