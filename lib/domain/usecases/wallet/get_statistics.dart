import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/wallet/statistics_entity.dart';
import 'package:let_tutor/domain/repositories/wallet/wallet_repository.dart';

class GetStatisticsUsecase
    implements UseCase<DataState<StatisticsEntity>, String> {
  final WalletRepository _walletRepository;
  GetStatisticsUsecase(this._walletRepository);

  @override
  Future<DataState<StatisticsEntity>> call({String? params}) {
    return _walletRepository.getStatistics();
  }
}
