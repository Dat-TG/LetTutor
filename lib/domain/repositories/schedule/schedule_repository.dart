import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/schedule/schedule_entity.dart';

abstract class ScheduleRepository {
  Future<DataState<List<ScheduleEntity>>> getSchedules({
    required String token,
    required ScheduleParams params,
  });

  Future<DataState<List<ScheduleEntity>>> getHistory({
    required String token,
    required ScheduleParams params,
  });
}

class ScheduleParams {
  final int? page;
  final int? perPage;

  ScheduleParams({
    this.page,
    this.perPage,
  });

  ScheduleParams copyWith({
    int? page,
    int? perPage,
  }) {
    return ScheduleParams(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
    );
  }
}
