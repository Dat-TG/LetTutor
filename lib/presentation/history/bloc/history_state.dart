part of 'history_bloc.dart';

sealed class HistoryState extends Equatable {
  final List<ScheduleEntity>? history;
  final DioException? error;
  final ScheduleParams? params;
  const HistoryState({
    this.history,
    this.error,
    this.params,
  });

  @override
  List<Object?> get props => [history, error, params];
}

final class HistoryLoading extends HistoryState {
  const HistoryLoading(List<ScheduleEntity> history, ScheduleParams params)
      : super(history: history, params: params);
}

final class HistoryDone extends HistoryState {
  const HistoryDone(List<ScheduleEntity> history, ScheduleParams params)
      : super(history: history, params: params);
}

final class HistoryFailed extends HistoryState {
  const HistoryFailed(
      List<ScheduleEntity> history, ScheduleParams params, DioException error)
      : super(
          history: history,
          params: params,
          error: error,
        );
}

final class HistoryComplete extends HistoryState {
  const HistoryComplete(List<ScheduleEntity> history, ScheduleParams params)
      : super(history: history, params: params);
}
