import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/schedule/schedule_entity.dart';
import 'package:let_tutor/domain/repositories/schedule/schedule_repository.dart';

class GetSchedulesUsecase
    implements
        UseCase<DataState<List<ScheduleEntity>>, GetSchedulesUsecaseParams> {
  final ScheduleRepository _scheduleRepository;
  GetSchedulesUsecase(this._scheduleRepository);

  @override
  Future<DataState<List<ScheduleEntity>>> call(
      {GetSchedulesUsecaseParams? params}) {
    return _scheduleRepository.getSchedules(
        token: params?.token ?? "",
        params: ScheduleParams(page: params?.page, perPage: params?.perPage));
  }
}

class GetSchedulesUsecaseParams {
  final String token;
  final int page;
  final int perPage;

  GetSchedulesUsecaseParams({
    required this.page,
    required this.perPage,
    required this.token,
  });

  GetSchedulesUsecaseParams copyWith({
    int? page,
    int? perPage,
    String? token,
  }) {
    return GetSchedulesUsecaseParams(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      token: token ?? this.token,
    );
  }
}
