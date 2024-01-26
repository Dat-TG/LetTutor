part of 'schedule_bloc.dart';

sealed class ScheduleEvent extends Equatable {
  const ScheduleEvent();

  @override
  List<Object> get props => [];
}

final class ScheduleFetched extends ScheduleEvent {
  final ScheduleParams params;
  const ScheduleFetched(this.params);
}

final class ScheduleCancelled extends ScheduleEvent {
  final CancelScheduleParams params;
  const ScheduleCancelled(this.params);
}
