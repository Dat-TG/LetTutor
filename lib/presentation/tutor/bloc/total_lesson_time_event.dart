part of 'total_lesson_time_bloc.dart';

sealed class TotalLessonTimeEvent extends Equatable {
  const TotalLessonTimeEvent();

  @override
  List<Object> get props => [];
}

final class TotalLessonTimeFetched extends TotalLessonTimeEvent {
  const TotalLessonTimeFetched();
}
