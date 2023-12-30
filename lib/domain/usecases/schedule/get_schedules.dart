import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/schedule/schedule_entity.dart';
import 'package:let_tutor/domain/repositories/schedule/schedule_repository.dart';

class GetSchedulesUsecase
    implements UseCase<DataState<List<ScheduleEntity>>, ScheduleParams> {
  final ScheduleRepository _scheduleRepository;
  GetSchedulesUsecase(this._scheduleRepository);

  @override
  Future<DataState<List<ScheduleEntity>>> call({ScheduleParams? params}) {
    return _scheduleRepository.getSchedules(
        params: ScheduleParams(page: params?.page, perPage: params?.perPage));
  }
}
