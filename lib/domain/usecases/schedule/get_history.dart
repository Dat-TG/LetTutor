import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/schedule/schedule_entity.dart';
import 'package:let_tutor/domain/repositories/schedule/schedule_repository.dart';
import 'package:let_tutor/domain/usecases/schedule/get_schedules.dart';

class GetHistoryUsecase
    implements
        UseCase<DataState<List<ScheduleEntity>>, GetSchedulesUsecaseParams> {
  final ScheduleRepository _scheduleRepository;
  GetHistoryUsecase(this._scheduleRepository);

  @override
  Future<DataState<List<ScheduleEntity>>> call(
      {GetSchedulesUsecaseParams? params}) {
    return _scheduleRepository.getHistory(
        token: params?.token ?? "",
        params: ScheduleParams(page: params?.page, perPage: params?.perPage));
  }
}
