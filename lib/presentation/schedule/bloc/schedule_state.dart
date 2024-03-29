part of 'schedule_bloc.dart';

sealed class ScheduleState extends Equatable {
  final List<ScheduleEntity>? schedules;
  final DioException? error;
  final ScheduleParams? params;
  const ScheduleState({
    this.schedules,
    this.error,
    this.params,
  });

  @override
  List<Object?> get props => [schedules, error, params];
}

final class ScheduleLoading extends ScheduleState {
  const ScheduleLoading(List<ScheduleEntity> schedules, ScheduleParams params)
      : super(schedules: schedules, params: params);
}

final class ScheduleDone extends ScheduleState {
  const ScheduleDone(List<ScheduleEntity> schedules, ScheduleParams params)
      : super(schedules: schedules, params: params);
}

final class ScheduleFailed extends ScheduleState {
  const ScheduleFailed(
      List<ScheduleEntity> schedules, ScheduleParams params, DioException error)
      : super(
          schedules: schedules,
          params: params,
          error: error,
        );
}

final class ScheduleComplete extends ScheduleState {
  const ScheduleComplete(List<ScheduleEntity> schedules, ScheduleParams params)
      : super(schedules: schedules, params: params);
}
