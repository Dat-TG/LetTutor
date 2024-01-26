import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/repositories/schedule/schedule_repository.dart';

class CancelScheduleUsecase
    implements UseCase<DataState<String>, CancelScheduleParams> {
  final ScheduleRepository _scheduleRepository;
  CancelScheduleUsecase(this._scheduleRepository);

  @override
  Future<DataState<String>> call({CancelScheduleParams? params}) {
    return _scheduleRepository.cancelSchedule(
      scheduleDetailId: params!.scheduleDetailId,
      cancelReasonId: params.cancelReasonId,
      note: params.note,
    );
  }
}
