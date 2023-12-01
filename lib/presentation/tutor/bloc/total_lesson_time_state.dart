part of 'total_lesson_time_bloc.dart';

sealed class TotalLessonTimeState extends Equatable {
  final int? totalLessonTime;
  final DioException? error;
  const TotalLessonTimeState({this.totalLessonTime, this.error});

  @override
  List<Object?> get props => [totalLessonTime, error];
}

final class TotalLessonTimeLoading extends TotalLessonTimeState {
  const TotalLessonTimeLoading(int totalLessonTime)
      : super(totalLessonTime: totalLessonTime);
}

final class TotalLessonTimeDone extends TotalLessonTimeState {
  const TotalLessonTimeDone(int totalLessonTime)
      : super(totalLessonTime: totalLessonTime);
}

final class TotalLessonTimeFailed extends TotalLessonTimeState {
  const TotalLessonTimeFailed(DioException error) : super(error: error);
}
