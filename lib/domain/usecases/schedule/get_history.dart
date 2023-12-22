import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/schedule/schedule_entity.dart';
import 'package:let_tutor/domain/repositories/schedule/schedule_repository.dart';

class GetHistoryUsecase
    implements UseCase<DataState<List<ScheduleEntity>>, ScheduleParams> {
  final ScheduleRepository _scheduleRepository;
  GetHistoryUsecase(this._scheduleRepository);

  @override
  Future<DataState<List<ScheduleEntity>>> call({ScheduleParams? params}) {
    return _scheduleRepository.getHistory(
        params: ScheduleParams(page: params?.page, perPage: params?.perPage));
  }
}
