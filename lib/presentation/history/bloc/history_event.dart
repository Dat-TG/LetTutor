part of 'history_bloc.dart';

sealed class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

final class HistoryFetched extends HistoryEvent {
  final ScheduleParams params;
  const HistoryFetched(this.params);
}
